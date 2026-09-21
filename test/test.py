# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0
import os
import random
from collections import deque
 
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, FallingEdge, ReadOnly
 
SHIFT_MAX = 8          # 4-bit shift field; values above SHIFT_MAX clamp to it
BIT0 = "round"         # config bit 0:  "round"  -> round enable (as submitted)
                       #                "signed" -> signed int8 out, always round
CUT_SAFE = False       # True if the phase pipe waits for tvalid (bubbles allowed
                       # inside a window). False: one pixel per clock, no bubbles.
 
# uio pin map (see the tt_um_ wrapper)
TVALID, TUSER, TLAST, WGHUPD, RNDGSET, MREADY = 0, 1, 2, 3, 4, 5
M_TVALID, S_TREADY = 6, 7
 
SEED = int(os.environ.get("SEED", "20260921"))
SESSIONS = int(os.environ.get("SESSIONS", "40"))
# =============================================================================
 
 
def model(px, k, shift, bit0):
    """Bit-exact oracle. Returns the byte that should appear on uo_out."""
    s = min(shift, SHIFT_MAX)
    acc = sum(p * w for p, w in zip(px, k))
    half = (1 << s) >> 1
    if BIT0 == "round":
        r = (acc + (half if bit0 else 0)) >> s          # Python >> floors
        return max(0, min(255, r))
    r = (acc + half) >> s
    if bit0:
        return max(-128, min(127, r)) & 0xFF            # two's complement byte
    return max(0, min(255, r))
 
 
def bits(sig):
    """8-char string, MSB first, so X/Z are visible instead of raising."""
    return str(sig.value).lower()
 
 
class Bench:
    def __init__(self, dut):
        self.dut = dut
        self.rng = random.Random(SEED)
        self.expected = deque()
        self.errors = []
        self.sent = 0
        self.received = 0
        self.last_out = None
        self.history = []
 
    # ---------------------------------------------------------------- setup --
    async def start(self):
        dut = self.dut
        cocotb.start_soon(Clock(dut.clk, 20, unit="ns").start())   # 50 MHz
        dut.ena.value = 1
        dut.ui_in.value = 0
        dut.uio_in.value = 1 << MREADY
        dut.rst_n.value = 0
        await ClockCycles(dut.clk, 10)
        dut.rst_n.value = 1
        await self.idle(12)                  # flush the phase pipe
        cocotb.start_soon(self.monitor())
        dut._log.info(f"SEED={SEED} BIT0={BIT0} CUT_SAFE={CUT_SAFE} SHIFT_MAX={SHIFT_MAX}")
 
    # --------------------------------------------------------------- driver --
    async def beat(self, data=None, valid=0, user=0, last=0, wg=0, cfg=0):
        """One clock on the bus: set on the falling edge, sampled on the rising."""
        if data is None:
            data = self.rng.randint(0, 255)          # junk: must be ignored
        mready = self.rng.randint(0, 1)              # does nothing; must not matter
        await FallingEdge(self.dut.clk)
        self.dut.ui_in.value = data & 0xFF
        self.dut.uio_in.value = ((valid << TVALID) | (user << TUSER) | (last << TLAST)
                                 | (wg << WGHUPD) | (cfg << RNDGSET) | (mready << MREADY))
 
    async def idle(self, n=1):
        for _ in range(n):
            await self.beat()
 
    async def gap(self):
        await self.idle(self.rng.choice([0, 0, 0, 1, 2, 3]))
 
    async def load_cfg(self, shift, bit0):
        junk = self.rng.randint(0, 7) << 5           # bits 7:5 are unused
        await self.beat(data=junk | ((shift & 0xF) << 1) | (bit0 & 1), cfg=1)
 
    async def load_weights(self, k):
        for i, w in enumerate(k):
            junk = self.rng.randint(0, 3) << 6       # bits 7:6 are unused
            await self.beat(data=junk | (w & 0x3F), wg=1, user=int(i == 0))
 
    async def send(self, px):
        """Stream one 3x3 window."""
        for i, p in enumerate(px):
            await self.beat(data=p, valid=1, user=int(i == 0), last=int(i == 8))
            if CUT_SAFE and i < 8 and self.rng.random() < 0.3:
                await self.idle(self.rng.randint(1, 4))      # bubble, junk on bus
 
    def expect(self, value, *ctx):
        self.expected.append((value,) + ctx)
        self.sent += 1
 
    async def window(self, px, k, shift, bit0):
        await self.send(px)
        self.expect(model(px, k, shift, bit0), px, k, shift, bit0)
 
    async def drain(self, timeout=40):
        for _ in range(timeout):
            if not self.expected:
                return
            await self.idle()
        self.errors.append(f"{len(self.expected)} result(s) never arrived")
        self.expected.clear()
 
    # -------------------------------------------------------------- monitor --
    async def monitor(self):
        dut = self.dut
        while True:
            await FallingEdge(dut.clk)
            await ReadOnly()
            out, uin, res = bits(dut.uio_out), bits(dut.uio_in), bits(dut.uo_out)
            mv = out[7 - M_TVALID]
 
            # s_tready is a pure passthrough of m_tready
            if out[7 - S_TREADY] != uin[7 - MREADY]:
                self.errors.append(f"s_tready {out[7 - S_TREADY]} != m_tready {uin[7 - MREADY]}")
            if mv not in "01":
                self.errors.append(f"m_tvalid is '{mv}'")
                continue
 
            if mv == "1":
                if any(c not in "01" for c in res):
                    self.errors.append(f"uo_out unresolved during m_tvalid: {res}")
                    continue
                got = int(res, 2)
                self.received += 1
                if not self.expected:
                    self.errors.append(f"unexpected result {got}")
                else:
                    exp, *ctx = self.expected.popleft()
                    if got != exp:
                        self.errors.append(f"got {got} exp {exp}: {ctx}")
                self.history.append(got)
                self.last_out = res
            elif self.last_out is not None and res != self.last_out:
                # the result register holds until the next result
                self.errors.append(f"uo_out changed without m_tvalid: {self.last_out}->{res}")
 
    def finish(self):
        for e in self.errors[:10]:
            self.dut._log.error(e)
        assert not self.errors, f"{len(self.errors)} error(s), first: {self.errors[0]}"
        assert self.received == self.sent, f"sent {self.sent}, received {self.received}"
        self.dut._log.info(f"{self.sent} windows, all bit-exact")
 
    # ------------------------------------------------------ random knob soup --
    def rand_kernel(self):
        r = self.rng
        x = r.random()
        if x < 0.15:
            return [r.choice([-32, 31])] * 9             # extremes, hard saturation
        if x < 0.25:
            k = [0] * 9
            k[r.randrange(9)] = r.randint(-32, 31)       # one live tap
            return k
        if x < 0.30:
            return [0] * 9
        return [r.randint(-32, 31) for _ in range(9)]
 
    def rand_window(self):
        r = self.rng
        x = r.random()
        if x < 0.10:
            return [r.choice([0, 255])] * 9
        if x < 0.20:
            return [r.choice([0, 1, 254, 255]) for _ in range(9)]
        return [r.randint(0, 255) for _ in range(9)]
 
 
# =============================================================================
@cocotb.test()
async def test_anchor(dut):
    """Hand-computed numbers, NOT the model: keeps the oracle itself honest."""
    tb = Bench(dut)
    await tb.start()
    assert bits(dut.uio_oe) == "11000000", f"uio_oe = {bits(dut.uio_oe)}, want 11000000"
 
    windows = [[0, 0, 0, 0, 163, 0, 163, 163, 161], [0] * 9, [255] * 9,
               [10, 20, 30, 40, 50, 60, 70, 80, 90]]
    rnd = 1 if BIT0 == "round" else 0        # rounded, unsigned, in either mode
    cases = [
        ("gaussian", [4, 8, 8, 4, 16, 4, 8, 8, 4], 6, [92, 0, 255, 50]),
        ("sharpen", [-1, -1, -1, -1, 9, -1, -1, -1, -1], 0, [255, 0, 255, 50]),
        ("highpass", [-1, -1, -1, -1, 8, -1, -1, -1, -1], 3, [102, 0, 0, 0]),
    ]
    for name, k, shift, want in cases:
        await tb.load_cfg(shift, rnd)
        await tb.load_weights(k)
        for px, w in zip(windows, want):
            await tb.send(px)
            tb.expect(w, name, px)            # the hand number, not the model
            await tb.gap()
        await tb.drain()
        dut._log.info(f"{name:9s} shift {shift}: {tb.history[-4:]}  (hand-computed {want})")
    tb.finish()
 
 
@cocotb.test()
async def test_boundaries(dut):
    """Every saturation edge, rounding tie and carry, and the shift clamp."""
    tb = Bench(dut)
    await tb.start()
    one = lambda c: [0, 0, 0, 0, c, 0, 0, 0, 0]          # only the centre tap
    # (centre weight, centre pixel, shift, bit0)
    cases = [
        (1, 255, 0, 1), (2, 128, 0, 1), (-1, 1, 0, 1),     # 255 / 256 / -1
        (7, 73, 1, 1), (7, 73, 1, 0), (2, 255, 1, 1),      # 511: carry vs truncate
        (-1, 1, 1, 1), (-3, 1, 1, 1),                       # -0.5 tie, -1.5
        (31, 255, 8, 1), (-32, 255, 8, 1),                  # biggest single tap
        (1, 255, 15, 1), (1, 127, 12, 1), (1, 128, 9, 1),   # shift > 8 clamps to 8
        (1, 127, 0, 0), (1, 128, 0, 0), (-1, 128, 0, 0),    # int8 edges (signed mode)
        (-1, 129, 0, 1), (1, 255, 1, 0), (-1, 255, 1, 1),
    ]
    for w, p, shift, bit0 in cases:
        await tb.load_cfg(shift, bit0)
        await tb.load_weights(one(w))
        await tb.window(one(p), one(w), shift, bit0)
        await tb.drain()
    tb.finish()
 
 
@cocotb.test()
async def test_knob_soup(dut):
    """Random everything, reprogrammed on the fly without resets."""
    tb = Bench(dut)
    await tb.start()
    k, shift, bit0 = [0] * 9, 0, 0
    await tb.load_cfg(shift, bit0)
    await tb.load_weights(k)
    for _ in range(SESSIONS):
        what = tb.rng.choice(["both", "both", "cfg", "weights"])
        if what in ("both", "cfg"):
            shift, bit0 = tb.rng.randint(0, 15), tb.rng.randint(0, 1)
            await tb.load_cfg(shift, bit0)
            await tb.gap()
        if what in ("both", "weights"):
            k = tb.rand_kernel()
            await tb.load_weights(k)
            await tb.gap()
        for _ in range(tb.rng.randint(1, 20)):
            await tb.window(tb.rand_window(), k, shift, bit0)
            await tb.gap()                        # zero gap = back-to-back
        await tb.drain()
    tb.finish()
