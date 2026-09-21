/*
 * Copyright (c) 2026 Yahya Numan Incirkus
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module mac_unit_Brtl_8_8
  (input  clk,
   input  aresetn,
   input  en,
   input  re_start,
   input  re_last,
   input  rndgmod,
   input  [3:0] shiftsel,
   input  [5:0] macu_h,
   input  [7:0] macu_i,
   output [7:0] macu_res,
   output macu_valid);
  reg [19:0] acc;
  wire [19:0] acc_fb;
  wire [3:0] s;
  wire [18:0] sticky;
  wire [7:0] win;
  wire rbit;
  wire hi;
  wire rnd_en;
  wire [8:0] sum9;
  reg vpipe;
  wire [19:0] n166;
  wire [8:0] n170;
  wire [14:0] n171;
  wire [14:0] n172;
  wire [14:0] n173;
  wire [19:0] n174;
  wire [19:0] n175;
  wire [30:0] n178;
  wire [31:0] n179;
  wire n181;
  wire [3:0] n182;
  wire n184;
  wire n185;
  wire n186;
  wire n187;
  wire n188;
  wire n189;
  wire n190;
  wire n191;
  wire n192;
  wire n193;
  wire n194;
  wire n195;
  wire n196;
  wire n197;
  wire n198;
  wire n199;
  wire n200;
  wire n201;
  wire n202;
  wire n203;
  wire n204;
  wire n205;
  wire n206;
  wire n207;
  wire n208;
  wire n209;
  wire n210;
  wire n211;
  wire n212;
  wire n213;
  wire n214;
  wire n215;
  wire n216;
  wire n217;
  wire n218;
  wire n219;
  wire n220;
  wire n221;
  wire n222;
  wire n223;
  wire n224;
  wire n225;
  wire n226;
  wire n227;
  wire n228;
  wire n229;
  wire n230;
  wire n231;
  wire n232;
  wire n233;
  wire n234;
  wire n235;
  wire n236;
  wire n237;
  wire n238;
  wire [31:0] n240;
  wire n242;
  wire [7:0] n243;
  wire n244;
  wire [7:0] n246;
  wire n249;
  wire [31:0] n251;
  wire n253;
  wire [7:0] n254;
  wire n255;
  wire n256;
  wire [7:0] n257;
  wire n259;
  wire n261;
  wire [31:0] n262;
  wire n264;
  wire [7:0] n265;
  wire n266;
  wire n267;
  wire [7:0] n268;
  wire n269;
  wire n270;
  wire [31:0] n271;
  wire n273;
  wire [7:0] n274;
  wire n275;
  wire n276;
  wire [7:0] n277;
  wire n278;
  wire n279;
  wire [31:0] n280;
  wire n282;
  wire [7:0] n283;
  wire n284;
  wire n285;
  wire [7:0] n286;
  wire n287;
  wire n288;
  wire [31:0] n289;
  wire n291;
  wire [7:0] n292;
  wire n293;
  wire n294;
  wire [7:0] n295;
  wire n296;
  wire n297;
  wire [31:0] n298;
  wire n300;
  wire [7:0] n301;
  wire n302;
  wire n303;
  wire [7:0] n304;
  wire n305;
  wire n306;
  wire [31:0] n307;
  wire n309;
  wire [7:0] n310;
  wire n311;
  wire n312;
  wire [7:0] n313;
  wire n314;
  wire n315;
  wire [31:0] n316;
  wire n318;
  wire [7:0] n319;
  wire n320;
  wire n321;
  wire [7:0] n322;
  wire n323;
  wire n324;
  wire n327;
  wire n328;
  wire [8:0] n331;
  wire [8:0] n333;
  wire n334;
  wire [8:0] n335;
  wire [8:0] n337;
  wire n339;
  wire [7:0] n340;
  wire n342;
  wire n343;
  wire [7:0] n344;
  wire [7:0] n345;
  wire n347;
  wire n349;
  wire [18:0] n352;
  wire [19:0] n353;
  reg [19:0] n354;
  reg n355;
  assign macu_res = n340; //(module output)
  assign macu_valid = vpipe; //(module output)
  /*# new/MAC_Unit.vhd:70:12 */
  always @*
    acc = n354; // (isignal)
  initial
    acc = 20'b00000000000000000000;
  /*# new/MAC_Unit.vhd:71:12 */
  assign acc_fb = n166; // (signal)
  /*# new/MAC_Unit.vhd:73:12 */
  assign s = n182; // (signal)
  /*# new/MAC_Unit.vhd:76:12 */
  assign sticky = n352; // (signal)
  /*# new/MAC_Unit.vhd:78:12 */
  assign win = n322; // (signal)
  /*# new/MAC_Unit.vhd:79:12 */
  assign rbit = n323; // (signal)
  /*# new/MAC_Unit.vhd:80:12 */
  assign hi = n324; // (signal)
  /*# new/MAC_Unit.vhd:81:12 */
  assign rnd_en = n328; // (signal)
  /*# new/MAC_Unit.vhd:82:12 */
  assign sum9 = n335; // (signal)
  /*# new/MAC_Unit.vhd:84:12 */
  always @*
    vpipe = n355; // (isignal)
  initial
    vpipe = 1'b0;
  /*# new/MAC_Unit.vhd:92:31 */
  assign n166 = re_start ? 20'b00000000000000000000 : acc;
  /*# new/MAC_Unit.vhd:94:42 */
  assign n170 = {1'b0, macu_i};
  /*# new/MAC_Unit.vhd:94:29 */
  assign n171 = {{9{macu_h[5]}}, macu_h}; // sext
  /*# new/MAC_Unit.vhd:94:29 */
  assign n172 = {{6{n170[8]}}, n170}; // sext
  /*# new/MAC_Unit.vhd:94:29 */
  assign n173 = $signed(n171) * $signed(n172); // smul
  /*# new/MAC_Unit.vhd:94:15 */
  assign n174 = {{5{n173[14]}}, n173}; // sext
  /*# new/MAC_Unit.vhd:94:59 */
  assign n175 = n174 + acc_fb;
  /*# new/MAC_Unit.vhd:98:25 */
  assign n178 = {27'b0, shiftsel};  // uext
  /*# new/MAC_Unit.vhd:98:46 */
  assign n179 = {1'b0, n178};  // uext
  /*# new/MAC_Unit.vhd:98:46 */
  assign n181 = $signed(n179) > $signed(32'b00000000000000000000000000001000);
  /*# new/MAC_Unit.vhd:98:20 */
  assign n182 = n181 ? 4'b1000 : shiftsel;
  /*# new/MAC_Unit.vhd:102:26 */
  assign n184 = acc[18]; // extract
  /*# new/MAC_Unit.vhd:104:28 */
  assign n185 = sticky[18]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n186 = acc[17]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n187 = n185 | n186;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n188 = sticky[17]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n189 = acc[16]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n190 = n188 | n189;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n191 = sticky[16]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n192 = acc[15]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n193 = n191 | n192;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n194 = sticky[15]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n195 = acc[14]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n196 = n194 | n195;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n197 = sticky[14]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n198 = acc[13]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n199 = n197 | n198;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n200 = sticky[13]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n201 = acc[12]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n202 = n200 | n201;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n203 = sticky[12]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n204 = acc[11]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n205 = n203 | n204;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n206 = sticky[11]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n207 = acc[10]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n208 = n206 | n207;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n209 = sticky[10]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n210 = acc[9]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n211 = n209 | n210;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n212 = sticky[9]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n213 = acc[8]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n214 = n212 | n213;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n215 = sticky[8]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n216 = acc[7]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n217 = n215 | n216;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n218 = sticky[7]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n219 = acc[6]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n220 = n218 | n219;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n221 = sticky[6]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n222 = acc[5]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n223 = n221 | n222;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n224 = sticky[5]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n225 = acc[4]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n226 = n224 | n225;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n227 = sticky[4]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n228 = acc[3]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n229 = n227 | n228;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n230 = sticky[3]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n231 = acc[2]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n232 = n230 | n231;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n233 = sticky[2]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n234 = acc[1]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n235 = n233 | n234;
  /*# new/MAC_Unit.vhd:104:28 */
  assign n236 = sticky[1]; // extract
  /*# new/MAC_Unit.vhd:104:40 */
  assign n237 = acc[0]; // extract
  /*# new/MAC_Unit.vhd:104:34 */
  assign n238 = n236 | n237;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n240 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n242 = n240 == 32'b00000000000000000000000000000000;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n243 = acc[7:0]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n244 = sticky[8]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n246 = n242 ? n243 : 8'b00000000;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n249 = n242 ? n244 : 1'b0;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n251 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n253 = n251 == 32'b00000000000000000000000000000001;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n254 = acc[8:1]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n255 = sticky[9]; // extract
  /*# new/MAC_Unit.vhd:118:32 */
  assign n256 = acc[0]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n257 = n253 ? n254 : n246;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n259 = n253 ? n256 : 1'b0;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n261 = n253 ? n255 : n249;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n262 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n264 = n262 == 32'b00000000000000000000000000000010;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n265 = acc[9:2]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n266 = sticky[10]; // extract
  /*# new/MAC_Unit.vhd:118:32 */
  assign n267 = acc[1]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n268 = n264 ? n265 : n257;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n269 = n264 ? n267 : n259;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n270 = n264 ? n266 : n261;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n271 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n273 = n271 == 32'b00000000000000000000000000000011;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n274 = acc[10:3]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n275 = sticky[11]; // extract
  /*# new/MAC_Unit.vhd:118:32 */
  assign n276 = acc[2]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n277 = n273 ? n274 : n268;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n278 = n273 ? n276 : n269;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n279 = n273 ? n275 : n270;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n280 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n282 = n280 == 32'b00000000000000000000000000000100;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n283 = acc[11:4]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n284 = sticky[12]; // extract
  /*# new/MAC_Unit.vhd:118:32 */
  assign n285 = acc[3]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n286 = n282 ? n283 : n277;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n287 = n282 ? n285 : n278;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n288 = n282 ? n284 : n279;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n289 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n291 = n289 == 32'b00000000000000000000000000000101;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n292 = acc[12:5]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n293 = sticky[13]; // extract
  /*# new/MAC_Unit.vhd:118:32 */
  assign n294 = acc[4]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n295 = n291 ? n292 : n286;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n296 = n291 ? n294 : n287;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n297 = n291 ? n293 : n288;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n298 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n300 = n298 == 32'b00000000000000000000000000000110;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n301 = acc[13:6]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n302 = sticky[14]; // extract
  /*# new/MAC_Unit.vhd:118:32 */
  assign n303 = acc[5]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n304 = n300 ? n301 : n295;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n305 = n300 ? n303 : n296;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n306 = n300 ? n302 : n297;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n307 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n309 = n307 == 32'b00000000000000000000000000000111;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n310 = acc[14:7]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n311 = sticky[15]; // extract
  /*# new/MAC_Unit.vhd:118:32 */
  assign n312 = acc[6]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n313 = n309 ? n310 : n304;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n314 = n309 ? n312 : n305;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n315 = n309 ? n311 : n306;
  /*# new/MAC_Unit.vhd:114:18 */
  assign n316 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:114:18 */
  assign n318 = n316 == 32'b00000000000000000000000000001000;
  /*# new/MAC_Unit.vhd:115:36 */
  assign n319 = acc[15:8]; // extract
  /*# new/MAC_Unit.vhd:116:30 */
  assign n320 = sticky[16]; // extract
  /*# new/MAC_Unit.vhd:118:32 */
  assign n321 = acc[7]; // extract
  /*# new/MAC_Unit.vhd:114:13 */
  assign n322 = n318 ? n319 : n313;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n323 = n318 ? n321 : n314;
  /*# new/MAC_Unit.vhd:114:13 */
  assign n324 = n318 ? n320 : n315;
  /*# new/MAC_Unit.vhd:125:32 */
  assign n327 = ~rndgmod;
  /*# new/MAC_Unit.vhd:125:19 */
  assign n328 = n327 ? 1'b0 : 1'b1;
  /*# new/MAC_Unit.vhd:127:20 */
  assign n331 = {1'b0, win};
  /*# new/MAC_Unit.vhd:127:27 */
  assign n333 = n331 + 9'b000000001;
  /*# new/MAC_Unit.vhd:127:42 */
  assign n334 = rbit & rnd_en;
  /*# new/MAC_Unit.vhd:127:31 */
  assign n335 = n334 ? n333 : n337;
  /*# new/MAC_Unit.vhd:127:70 */
  assign n337 = {1'b0, win};
  /*# new/MAC_Unit.vhd:130:41 */
  assign n339 = acc[19]; // extract
  /*# new/MAC_Unit.vhd:130:33 */
  assign n340 = n339 ? 8'b00000000 : n344;
  /*# new/MAC_Unit.vhd:131:57 */
  assign n342 = sum9[8]; // extract
  /*# new/MAC_Unit.vhd:131:49 */
  assign n343 = hi | n342;
  /*# new/MAC_Unit.vhd:130:56 */
  assign n344 = n343 ? 8'b11111111 : n345;
  /*# new/MAC_Unit.vhd:132:21 */
  assign n345 = sum9[7:0]; // extract
  /*# new/MAC_Unit.vhd:135:31 */
  assign n347 = ~aresetn;
  /*# new/MAC_Unit.vhd:136:18 */
  assign n349 = en & re_last;
  /*# new/MAC_Unit.vhd:76:12 */
  assign n352 = {n184, n187, n190, n193, n196, n199, n202, n205, n208, n211, n214, n217, n220, n223, n226, n229, n232, n235, n238};
  /*# new/MAC_Unit.vhd:94:5 */
  assign n353 = en ? n175 : acc;
  /*# new/MAC_Unit.vhd:94:5 */
  always @(posedge clk)
    n354 <= n353;
  initial
    n354 = 20'b00000000000000000000;
  /*# new/MAC_Unit.vhd:135:37 */
  always @(posedge clk or posedge n347)
    if (n347)
      n355 <= 1'b0;
    else
      n355 <= n349;
endmodule

module front_end_Bgothic_8_8
  (input  clk,
   input  aresetn,
   input  wghupd,
   input  rndgset,
   input  s_axis_tuser,
   input  s_axis_tvalid,
   output s_axis_tready,
   input  [7:0] s_axis_tdata,
   input  s_axis_tlast,
   output m_axis_tvalid,
   input  m_axis_tready,
   output [7:0] m_axis_tdata);
  wire rndgmod;
  reg [3:0] shiftsel;
  reg [5:0] h_px11;
  reg [5:0] h_px10;
  reg [5:0] h_px01;
  reg [5:0] h_px1_1;
  reg [5:0] h_px00;
  reg [5:0] h_px_1_1;
  reg [5:0] h_px_10;
  reg [5:0] h_px0_1;
  reg [5:0] h_px_11;
  wire [7:0] macu_i;
  wire [5:0] macu_hpre;
  wire [5:0] macu_h;
  wire [7:0] macures;
  wire macuv;
  reg macuv_d;
  reg [7:0] tuserpipe;
  wire n39;
  wire [3:0] n43;
  wire [6:0] n46;
  wire [7:0] n47;
  wire n49;
  wire [5:0] n52;
  wire n54;
  wire n55;
  wire [5:0] n58;
  wire n60;
  wire n61;
  wire [5:0] n64;
  wire n66;
  wire n67;
  wire [5:0] n70;
  wire n72;
  wire n73;
  wire [5:0] n76;
  wire n78;
  wire n79;
  wire [5:0] n82;
  wire n84;
  wire n85;
  wire [5:0] n88;
  wire n90;
  wire n91;
  wire [5:0] n94;
  wire n96;
  wire n97;
  wire [5:0] n100;
  wire [8:0] n102;
  wire n104;
  wire n106;
  wire n108;
  wire n110;
  wire n112;
  wire n114;
  wire n116;
  wire n118;
  wire n120;
  wire [8:0] n122;
  reg [5:0] n123;
  wire [7:0] macunit_n124;
  wire macunit_n125;
  wire [7:0] n135;
  reg [7:0] n136;
  wire n137;
  reg n138;
  wire [3:0] n139;
  reg [3:0] n140;
  wire [5:0] n141;
  reg [5:0] n142;
  wire [5:0] n143;
  reg [5:0] n144;
  wire [5:0] n145;
  reg [5:0] n146;
  wire [5:0] n147;
  reg [5:0] n148;
  wire [5:0] n149;
  reg [5:0] n150;
  wire [5:0] n151;
  reg [5:0] n152;
  wire [5:0] n153;
  reg [5:0] n154;
  wire [5:0] n155;
  reg [5:0] n156;
  wire [5:0] n157;
  reg [5:0] n158;
  reg n159;
  reg [7:0] n160;
  assign s_axis_tready = m_axis_tready; //(module output)
  assign m_axis_tvalid = macuv_d; //(module output)
  assign m_axis_tdata = n136; //(module output)
  /*# imports/new/Front_End.vhd:64:8 */
  assign rndgmod = n138; // (signal)
  /*# imports/new/Front_End.vhd:65:8 */
  always @*
    shiftsel = n140; // (isignal)
  initial
    shiftsel = 4'b0000;
  /*# imports/new/Front_End.vhd:66:8 */
  always @*
    h_px11 = n142; // (isignal)
  initial
    h_px11 = 6'b111111;
  /*# imports/new/Front_End.vhd:67:8 */
  always @*
    h_px10 = n144; // (isignal)
  initial
    h_px10 = 6'b111111;
  /*# imports/new/Front_End.vhd:68:8 */
  always @*
    h_px01 = n146; // (isignal)
  initial
    h_px01 = 6'b111111;
  /*# imports/new/Front_End.vhd:69:8 */
  always @*
    h_px1_1 = n148; // (isignal)
  initial
    h_px1_1 = 6'b111111;
  /*# imports/new/Front_End.vhd:70:8 */
  always @*
    h_px00 = n150; // (isignal)
  initial
    h_px00 = 6'b001000;
  /*# imports/new/Front_End.vhd:71:8 */
  always @*
    h_px_1_1 = n152; // (isignal)
  initial
    h_px_1_1 = 6'b111111;
  /*# imports/new/Front_End.vhd:72:8 */
  always @*
    h_px_10 = n154; // (isignal)
  initial
    h_px_10 = 6'b111111;
  /*# imports/new/Front_End.vhd:73:8 */
  always @*
    h_px0_1 = n156; // (isignal)
  initial
    h_px0_1 = 6'b111111;
  /*# imports/new/Front_End.vhd:74:8 */
  always @*
    h_px_11 = n158; // (isignal)
  initial
    h_px_11 = 6'b111111;
  /*# imports/new/Front_End.vhd:75:8 */
  assign macu_i = s_axis_tdata; // (signal)
  /*# imports/new/Front_End.vhd:76:8 */
  assign macu_hpre = n123; // (signal)
  /*# imports/new/Front_End.vhd:77:8 */
  assign macu_h = macu_hpre; // (signal)
  /*# imports/new/Front_End.vhd:78:8 */
  assign macures = macunit_n124; // (signal)
  /*# imports/new/Front_End.vhd:79:8 */
  assign macuv = macunit_n125; // (signal)
  /*# imports/new/Front_End.vhd:80:8 */
  always @*
    macuv_d = n159; // (isignal)
  initial
    macuv_d = 1'b0;
  /*# imports/new/Front_End.vhd:81:8 */
  always @*
    tuserpipe = n160; // (isignal)
  initial
    tuserpipe = 8'b00000000;
  /*# imports/new/Front_End.vhd:112:25 */
  assign n39 = s_axis_tdata[0]; // extract
  /*# imports/new/Front_End.vhd:113:34 */
  assign n43 = s_axis_tdata[4:1]; // extract
  /*# imports/new/Front_End.vhd:115:38 */
  assign n46 = tuserpipe[7:1]; // extract
  /*# imports/new/Front_End.vhd:115:27 */
  assign n47 = {s_axis_tuser, n46};
  /*# imports/new/Front_End.vhd:117:64 */
  assign n49 = s_axis_tuser & wghupd;
  /*# imports/new/Front_End.vhd:117:32 */
  assign n52 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:118:78 */
  assign n54 = tuserpipe[7]; // extract
  /*# imports/new/Front_End.vhd:118:64 */
  assign n55 = n54 & wghupd;
  /*# imports/new/Front_End.vhd:118:32 */
  assign n58 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:119:78 */
  assign n60 = tuserpipe[6]; // extract
  /*# imports/new/Front_End.vhd:119:64 */
  assign n61 = n60 & wghupd;
  /*# imports/new/Front_End.vhd:119:32 */
  assign n64 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:120:78 */
  assign n66 = tuserpipe[5]; // extract
  /*# imports/new/Front_End.vhd:120:64 */
  assign n67 = n66 & wghupd;
  /*# imports/new/Front_End.vhd:120:32 */
  assign n70 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:121:78 */
  assign n72 = tuserpipe[4]; // extract
  /*# imports/new/Front_End.vhd:121:64 */
  assign n73 = n72 & wghupd;
  /*# imports/new/Front_End.vhd:121:32 */
  assign n76 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:122:78 */
  assign n78 = tuserpipe[3]; // extract
  /*# imports/new/Front_End.vhd:122:64 */
  assign n79 = n78 & wghupd;
  /*# imports/new/Front_End.vhd:122:32 */
  assign n82 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:123:78 */
  assign n84 = tuserpipe[2]; // extract
  /*# imports/new/Front_End.vhd:123:64 */
  assign n85 = n84 & wghupd;
  /*# imports/new/Front_End.vhd:123:32 */
  assign n88 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:124:78 */
  assign n90 = tuserpipe[1]; // extract
  /*# imports/new/Front_End.vhd:124:64 */
  assign n91 = n90 & wghupd;
  /*# imports/new/Front_End.vhd:124:32 */
  assign n94 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:125:78 */
  assign n96 = tuserpipe[0]; // extract
  /*# imports/new/Front_End.vhd:125:64 */
  assign n97 = n96 & wghupd;
  /*# imports/new/Front_End.vhd:125:32 */
  assign n100 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:127:37 */
  assign n102 = {s_axis_tuser, tuserpipe};
  /*# imports/new/Front_End.vhd:128:25 */
  assign n104 = n102 == 9'b100000000;
  /*# imports/new/Front_End.vhd:128:50 */
  assign n106 = n102 == 9'b010000000;
  /*# imports/new/Front_End.vhd:128:75 */
  assign n108 = n102 == 9'b001000000;
  /*# imports/new/Front_End.vhd:129:26 */
  assign n110 = n102 == 9'b000100000;
  /*# imports/new/Front_End.vhd:129:51 */
  assign n112 = n102 == 9'b000010000;
  /*# imports/new/Front_End.vhd:129:78 */
  assign n114 = n102 == 9'b000001000;
  /*# imports/new/Front_End.vhd:130:26 */
  assign n116 = n102 == 9'b000000100;
  /*# imports/new/Front_End.vhd:130:52 */
  assign n118 = n102 == 9'b000000010;
  /*# imports/new/Front_End.vhd:130:78 */
  assign n120 = n102 == 9'b000000001;
  /*# imports/new/Front_End.vhd:127:1 */
  assign n122 = {n120, n118, n116, n114, n112, n110, n108, n106, n104};
  /*# imports/new/Front_End.vhd:127:1 */
  always @*
    case (n122)
      9'b100000000: n123 = h_px_11;
      9'b010000000: n123 = h_px0_1;
      9'b001000000: n123 = h_px_10;
      9'b000100000: n123 = h_px_1_1;
      9'b000010000: n123 = h_px00;
      9'b000001000: n123 = h_px1_1;
      9'b000000100: n123 = h_px01;
      9'b000000010: n123 = h_px10;
      9'b000000001: n123 = h_px11;
      default: n123 = 6'b000000;
    endcase
  /*# imports/new/Front_End.vhd:136:1 */
  mac_unit_Brtl_8_8 macunit (
    .clk(clk),
    .aresetn(aresetn),
    .en(s_axis_tvalid),
    .re_start(s_axis_tuser),
    .re_last(s_axis_tlast),
    .rndgmod(rndgmod),
    .shiftsel(shiftsel),
    .macu_h(macu_h),
    .macu_i(macu_i),
    .macu_res(macunit_n124),
    .macu_valid(macunit_n125));
  /*# imports/new/Front_End.vhd:141:1 */
  assign n135 = macuv ? macures : n136;
  /*# imports/new/Front_End.vhd:141:1 */
  always @(posedge clk)
    n136 <= n135;
  /*# imports/new/Front_End.vhd:112:1 */
  assign n137 = rndgset ? n39 : rndgmod;
  /*# imports/new/Front_End.vhd:112:1 */
  always @(posedge clk)
    n138 <= n137;
  /*# imports/new/Front_End.vhd:113:1 */
  assign n139 = rndgset ? n43 : shiftsel;
  /*# imports/new/Front_End.vhd:113:1 */
  always @(posedge clk)
    n140 <= n139;
  initial
    n140 = 4'b0000;
  /*# imports/new/Front_End.vhd:117:1 */
  assign n141 = n49 ? n52 : h_px11;
  /*# imports/new/Front_End.vhd:117:1 */
  always @(posedge clk)
    n142 <= n141;
  initial
    n142 = 6'b111111;
  /*# imports/new/Front_End.vhd:118:1 */
  assign n143 = n55 ? n58 : h_px10;
  /*# imports/new/Front_End.vhd:118:1 */
  always @(posedge clk)
    n144 <= n143;
  initial
    n144 = 6'b111111;
  /*# imports/new/Front_End.vhd:119:1 */
  assign n145 = n61 ? n64 : h_px01;
  /*# imports/new/Front_End.vhd:119:1 */
  always @(posedge clk)
    n146 <= n145;
  initial
    n146 = 6'b111111;
  /*# imports/new/Front_End.vhd:120:1 */
  assign n147 = n67 ? n70 : h_px1_1;
  /*# imports/new/Front_End.vhd:120:1 */
  always @(posedge clk)
    n148 <= n147;
  initial
    n148 = 6'b111111;
  /*# imports/new/Front_End.vhd:121:1 */
  assign n149 = n73 ? n76 : h_px00;
  /*# imports/new/Front_End.vhd:121:1 */
  always @(posedge clk)
    n150 <= n149;
  initial
    n150 = 6'b001000;
  /*# imports/new/Front_End.vhd:122:1 */
  assign n151 = n79 ? n82 : h_px_1_1;
  /*# imports/new/Front_End.vhd:122:1 */
  always @(posedge clk)
    n152 <= n151;
  initial
    n152 = 6'b111111;
  /*# imports/new/Front_End.vhd:123:1 */
  assign n153 = n85 ? n88 : h_px_10;
  /*# imports/new/Front_End.vhd:123:1 */
  always @(posedge clk)
    n154 <= n153;
  initial
    n154 = 6'b111111;
  /*# imports/new/Front_End.vhd:124:1 */
  assign n155 = n91 ? n94 : h_px0_1;
  /*# imports/new/Front_End.vhd:124:1 */
  always @(posedge clk)
    n156 <= n155;
  initial
    n156 = 6'b111111;
  /*# imports/new/Front_End.vhd:125:1 */
  assign n157 = n97 ? n100 : h_px_11;
  /*# imports/new/Front_End.vhd:125:1 */
  always @(posedge clk)
    n158 <= n157;
  initial
    n158 = 6'b111111;
  /*# imports/new/Front_End.vhd:142:1 */
  always @(posedge clk)
    n159 <= macuv;
  initial
    n159 = 1'b0;
  /*# imports/new/Front_End.vhd:115:1 */
  always @(posedge clk)
    n160 <= n47;
  initial
    n160 = 8'b00000000;
endmodule

module tt_um_conv3x3
  (input  [7:0] ui_in,
   output [7:0] uo_out,
   input  [7:0] uio_in,
   output [7:0] uio_out,
   output [7:0] uio_oe,
   input  ena,
   input  clk,
   input  rst_n);
  wire [7:0] m_tdata;
  wire m_tvalid;
  wire s_tready;
  wire n3;
  wire n4;
  wire n5;
  wire n6;
  wire core_n7;
  wire n8;
  wire core_n9;
  wire n10;
  wire [7:0] core_n11;
  wire [1:0] n18;
  wire [7:0] n20;
  localparam [7:0] n21 = 8'b11000000;
  assign uo_out = m_tdata; //(module output)
  assign uio_out = n20; //(module output)
  assign uio_oe = n21; //(module output)
  /*# new/tt_um_Cicikush1_3x3.vhd:42:12 */
  assign m_tdata = core_n11; // (signal)
  /*# new/tt_um_Cicikush1_3x3.vhd:43:12 */
  assign m_tvalid = core_n9; // (signal)
  /*# new/tt_um_Cicikush1_3x3.vhd:44:12 */
  assign s_tready = core_n7; // (signal)
  /*# new/tt_um_Cicikush1_3x3.vhd:71:37 */
  assign n3 = uio_in[3]; // extract
  /*# new/tt_um_Cicikush1_3x3.vhd:72:37 */
  assign n4 = uio_in[4]; // extract
  /*# new/tt_um_Cicikush1_3x3.vhd:73:37 */
  assign n5 = uio_in[1]; // extract
  /*# new/tt_um_Cicikush1_3x3.vhd:74:37 */
  assign n6 = uio_in[0]; // extract
  /*# new/tt_um_Cicikush1_3x3.vhd:77:37 */
  assign n8 = uio_in[2]; // extract
  /*# new/tt_um_Cicikush1_3x3.vhd:79:37 */
  assign n10 = uio_in[5]; // extract
  /*# new/tt_um_Cicikush1_3x3.vhd:67:5 */
  front_end_Bgothic_8_8 core (
    .clk(clk),
    .aresetn(rst_n),
    .wghupd(n3),
    .rndgset(n4),
    .s_axis_tuser(n5),
    .s_axis_tvalid(n6),
    .s_axis_tdata(ui_in),
    .s_axis_tlast(n8),
    .m_axis_tready(n10),
    .s_axis_tready(core_n7),
    .m_axis_tvalid(core_n9),
    .m_axis_tdata(core_n11));
  /*# new/tt_um_Cicikush1_3x3.vhd:84:25 */
  assign n18 = {s_tready, m_tvalid};
  /*# new/tt_um_Cicikush1_3x3.vhd:84:36 */
  assign n20 = {n18, 6'b000000};
endmodule
