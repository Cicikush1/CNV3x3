# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import random

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, FallingEdge

# uio bit positions (see src/tt_um_conv3x3.vhdl header)
TVALID, TUSER, TLAST, WGHUPD, RNDGSET, MREADY = 0, 1, 2, 3, 4, 5
M_TVALID = 6          # uio_out bit
S_TREADY = 7          # uio_out bit

# the four windows in sim/axis_tdata_stim.txt
FRAMES = [
    [0, 0, 0, 0, 163, 0, 163, 163, 161],
    [0] * 9,
    [255] * 9,
    [10, 20, 30, 40, 50, 60, 70, 80, 90],
]

# phase order: (1,1) (1,0) (0,1) (1,-1) (0,0) (-1,-1) (-1,0) (0,-1) (-1,1)
GAUSS = [4, 8, 8, 4, 16, 4, 8, 8, 4]              # sum 64  -> shift 6
HPF   = [-1, -1, -1, -1, 8, -1, -1, -1, -1]       # sum 0   -> shift 3
BOX9  = [28, 28, 28, 28, 28, 28, 29, 29, 29]      # sum 256 -> shift 8
SHARP = [-1, -1, -1, -1, 9, -1, -1, -1, -1]       # sum 1   -> shift 0


def ref(px, k, shift, rnd=1):
    """Bit-exact model: accumulate, optional round-half-up, floor-shift, clamp."""
    acc = sum(p * w for p, w in zip(px, k))
    if rnd:
        acc += (1 << shift) >> 1
    return max(0, min(255, acc >> shift))          # Python >> floors negatives


async def drive(dut, data, valid=0, user=0, last=0, wg=0, cfg=0):
    """One bus beat. Set on the falling edge, sampled on the next rising edge."""
    await FallingEdge(dut.clk)
    dut.ui_in.value = data & 0xFF
    dut.uio_in.value = ((valid << TVALID) | (user << TUSER) | (last << TLAST)
                        | (wg << WGHUPD) | (cfg << RNDGSET) | (1 << MREADY))


async def idle(dut, n=1):
    for _ in range(n):
        await drive(dut, 0)


async def reset(dut):
    clock = Clock(dut.clk, 20, unit="ns")          # 50 MHz, matches config.json
    cocotb.start_soon(clock.start())
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 1 << MREADY
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    # tuserpipe has no reset on silicon: give it 8+ clocks with tuser low
    # before any phase decode is trustworthy.
    await idle(dut, 12)


async def load_cfg(dut, shift, rnd=1):
    """Config byte rides on ui_in: [4:1] = shift, [0] = round enable."""
    await drive(dut, ((shift & 0xF) << 1) | (rnd & 1), cfg=1)
    await idle(dut, 2)


async def load_weights(dut, k):
    """Nine beats, tuser on the first, tvalid low so the MAC does not accumulate."""
    for i, w in enumerate(k):
        await drive(dut, w, wg=1, user=int(i == 0))
    await idle(dut, 12)                            # let the phase pipe drain


async def run_frame(dut, px):
    for i, p in enumerate(px):
        await drive(dut, p, valid=1, user=int(i == 0), last=int(i == 8))
    await idle(dut)
    for _ in range(8):
        await FallingEdge(dut.clk)
        if (int(dut.uio_out.value) >> M_TVALID) & 1:
            return int(dut.uo_out.value)
    raise AssertionError("m_tvalid never rose")


async def program(dut, k, shift, rnd=1):
    await load_cfg(dut, shift, rnd)
    await load_weights(dut, k)


async def check(dut, k, shift, rnd=1):
    for n, px in enumerate(FRAMES):
        got = await run_frame(dut, px)
        exp = ref(px, k, shift, rnd)
        dut._log.info(f"  frame {n}: got {got:3d}  expected {exp:3d}")
        assert got == exp, f"frame {n}: got {got}, expected {exp}"
        await idle(dut, 2)


@cocotb.test()
async def test_lpf_then_hpf(dut):
    """The headline case: a lowpass pass, then a highpass pass, no reset between."""
    await reset(dut)
    assert int(dut.uio_oe.value) == 0b11000000, "uio_oe should be 0xC0"

    dut._log.info("--- pass 0: gaussian LPF, shift 6 ---")
    await program(dut, GAUSS, 6)
    await check(dut, GAUSS, 6)

    dut._log.info("--- pass 1: HPF, shift 3 (reconfigured on the fly) ---")
    await program(dut, HPF, 3)
    await check(dut, HPF, 3)


@cocotb.test()
async def test_kernels(dut):
    """Every filter the datasheet claims."""
    await reset(dut)
    for name, k, shift in (("sharpen", SHARP, 0), ("gauss", GAUSS, 6),
                           ("box9", BOX9, 8), ("hpf", HPF, 3)):
        dut._log.info(f"--- {name}, shift {shift} ---")
        await program(dut, k, shift)
        await check(dut, k, shift)


@cocotb.test()
async def test_truncate_mode(dut):
    """Round enable off must truncate, not round."""
    await reset(dut)
    await program(dut, GAUSS, 6, rnd=0)
    await check(dut, GAUSS, 6, rnd=0)


@cocotb.test()
async def test_random(dut):
    """Random 6-bit kernels, every shift, both rounding modes."""
    await reset(dut)
    rng = random.Random(1234)
    for trial in range(30):
        k = [rng.randint(-32, 31) for _ in range(9)]
        shift = rng.randint(0, 8)
        rnd = rng.randint(0, 1)
        await program(dut, k, shift, rnd)
        for _ in range(4):
            px = [rng.randint(0, 255) for _ in range(9)]
            got = await run_frame(dut, px)
            exp = ref(px, k, shift, rnd)
            assert got == exp, (f"trial {trial}: k={k} shift={shift} rnd={rnd} "
                                f"px={px} got {got} exp {exp}")
            await idle(dut)

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
