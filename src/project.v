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
  wire [18:0] stickya;
  wire [7:0] win;
  wire rbit;
  wire hi_u;
  wire hi_s;
  wire all1_s;
  wire sgn;
  wire [8:0] sum9;
  reg vpipe;
  wire [19:0] n172;
  wire [8:0] n176;
  wire [14:0] n177;
  wire [14:0] n178;
  wire [14:0] n179;
  wire [19:0] n180;
  wire [19:0] n181;
  wire [30:0] n184;
  wire [31:0] n185;
  wire n187;
  wire [3:0] n188;
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
  wire n239;
  wire n240;
  wire n241;
  wire n242;
  wire n243;
  wire n244;
  wire n245;
  wire n246;
  wire n247;
  wire n248;
  wire n249;
  wire n250;
  wire n251;
  wire n252;
  wire n253;
  wire n254;
  wire n255;
  wire n256;
  wire n257;
  wire n258;
  wire n259;
  wire n260;
  wire n261;
  wire n262;
  wire n263;
  wire n264;
  wire n265;
  wire n266;
  wire n267;
  wire n268;
  wire n269;
  wire n270;
  wire n271;
  wire n272;
  wire n273;
  wire n274;
  wire n275;
  wire n276;
  wire n277;
  wire n278;
  wire n279;
  wire n280;
  wire n281;
  wire n282;
  wire n283;
  wire n284;
  wire n285;
  wire n286;
  wire n287;
  wire n288;
  wire n289;
  wire n290;
  wire n291;
  wire n292;
  wire n293;
  wire n294;
  wire n295;
  wire n296;
  wire n297;
  wire n298;
  wire n299;
  wire [31:0] n301;
  wire n303;
  wire [7:0] n304;
  wire n305;
  wire n306;
  wire n307;
  wire [7:0] n309;
  wire n312;
  wire n315;
  wire n318;
  wire [31:0] n320;
  wire n322;
  wire [7:0] n323;
  wire n324;
  wire n325;
  wire n326;
  wire n327;
  wire [7:0] n328;
  wire n330;
  wire n332;
  wire n333;
  wire n334;
  wire [31:0] n335;
  wire n337;
  wire [7:0] n338;
  wire n339;
  wire n340;
  wire n341;
  wire n342;
  wire [7:0] n343;
  wire n344;
  wire n345;
  wire n346;
  wire n347;
  wire [31:0] n348;
  wire n350;
  wire [7:0] n351;
  wire n352;
  wire n353;
  wire n354;
  wire n355;
  wire [7:0] n356;
  wire n357;
  wire n358;
  wire n359;
  wire n360;
  wire [31:0] n361;
  wire n363;
  wire [7:0] n364;
  wire n365;
  wire n366;
  wire n367;
  wire n368;
  wire [7:0] n369;
  wire n370;
  wire n371;
  wire n372;
  wire n373;
  wire [31:0] n374;
  wire n376;
  wire [7:0] n377;
  wire n378;
  wire n379;
  wire n380;
  wire n381;
  wire [7:0] n382;
  wire n383;
  wire n384;
  wire n385;
  wire n386;
  wire [31:0] n387;
  wire n389;
  wire [7:0] n390;
  wire n391;
  wire n392;
  wire n393;
  wire n394;
  wire [7:0] n395;
  wire n396;
  wire n397;
  wire n398;
  wire n399;
  wire [31:0] n400;
  wire n402;
  wire [7:0] n403;
  wire n404;
  wire n405;
  wire n406;
  wire n407;
  wire [7:0] n408;
  wire n409;
  wire n410;
  wire n411;
  wire n412;
  wire [31:0] n413;
  wire n415;
  wire [7:0] n416;
  wire n417;
  wire n418;
  wire n419;
  wire n420;
  wire [7:0] n421;
  wire n422;
  wire n423;
  wire n424;
  wire n425;
  wire [8:0] n428;
  wire [8:0] n430;
  wire [8:0] n431;
  wire [8:0] n433;
  wire n434;
  wire n436;
  wire n437;
  wire [7:0] n438;
  wire n440;
  wire n441;
  wire n442;
  wire n443;
  wire [7:0] n444;
  wire n446;
  wire n447;
  wire n448;
  wire n449;
  wire n450;
  wire [7:0] n451;
  wire n453;
  wire n454;
  wire n455;
  wire [7:0] n456;
  wire [7:0] n457;
  wire n459;
  wire n461;
  wire [18:0] n464;
  wire [18:0] n465;
  wire [19:0] n466;
  reg [19:0] n467;
  reg n468;
  assign macu_res = n438; //(module output)
  assign macu_valid = vpipe; //(module output)
  /*# new/MAC_Unit.vhd:70:12 */
  always @*
    acc = n467; // (isignal)
  initial
    acc = 20'b00000000000000000000;
  /*# new/MAC_Unit.vhd:71:12 */
  assign acc_fb = n172; // (signal)
  /*# new/MAC_Unit.vhd:73:12 */
  assign s = n188; // (signal)
  /*# new/MAC_Unit.vhd:77:12 */
  assign sticky = n464; // (signal)
  /*# new/MAC_Unit.vhd:78:12 */
  assign stickya = n465; // (signal)
  /*# new/MAC_Unit.vhd:80:12 */
  assign win = n421; // (signal)
  /*# new/MAC_Unit.vhd:81:12 */
  assign rbit = n422; // (signal)
  /*# new/MAC_Unit.vhd:82:12 */
  assign hi_u = n423; // (signal)
  /*# new/MAC_Unit.vhd:83:12 */
  assign hi_s = n424; // (signal)
  /*# new/MAC_Unit.vhd:84:12 */
  assign all1_s = n425; // (signal)
  /*# new/MAC_Unit.vhd:85:12 */
  assign sgn = n434; // (signal)
  /*# new/MAC_Unit.vhd:86:12 */
  assign sum9 = n431; // (signal)
  /*# new/MAC_Unit.vhd:88:12 */
  always @*
    vpipe = n468; // (isignal)
  initial
    vpipe = 1'b0;
  /*# new/MAC_Unit.vhd:96:31 */
  assign n172 = re_start ? 20'b00000000000000000000 : acc;
  /*# new/MAC_Unit.vhd:98:42 */
  assign n176 = {1'b0, macu_i};
  /*# new/MAC_Unit.vhd:98:29 */
  assign n177 = {{9{macu_h[5]}}, macu_h}; // sext
  /*# new/MAC_Unit.vhd:98:29 */
  assign n178 = {{6{n176[8]}}, n176}; // sext
  /*# new/MAC_Unit.vhd:98:29 */
  assign n179 = $signed(n177) * $signed(n178); // smul
  /*# new/MAC_Unit.vhd:98:15 */
  assign n180 = {{5{n179[14]}}, n179}; // sext
  /*# new/MAC_Unit.vhd:98:59 */
  assign n181 = n180 + acc_fb;
  /*# new/MAC_Unit.vhd:102:25 */
  assign n184 = {27'b0, shiftsel};  // uext
  /*# new/MAC_Unit.vhd:102:46 */
  assign n185 = {1'b0, n184};  // uext
  /*# new/MAC_Unit.vhd:102:46 */
  assign n187 = $signed(n185) > $signed(32'b00000000000000000000000000001000);
  /*# new/MAC_Unit.vhd:102:20 */
  assign n188 = n187 ? 4'b1000 : shiftsel;
  /*# new/MAC_Unit.vhd:106:26 */
  assign n190 = acc[18]; // extract
  /*# new/MAC_Unit.vhd:108:28 */
  assign n191 = sticky[18]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n192 = acc[17]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n193 = n191 | n192;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n194 = sticky[17]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n195 = acc[16]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n196 = n194 | n195;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n197 = sticky[16]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n198 = acc[15]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n199 = n197 | n198;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n200 = sticky[15]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n201 = acc[14]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n202 = n200 | n201;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n203 = sticky[14]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n204 = acc[13]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n205 = n203 | n204;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n206 = sticky[13]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n207 = acc[12]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n208 = n206 | n207;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n209 = sticky[12]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n210 = acc[11]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n211 = n209 | n210;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n212 = sticky[11]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n213 = acc[10]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n214 = n212 | n213;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n215 = sticky[10]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n216 = acc[9]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n217 = n215 | n216;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n218 = sticky[9]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n219 = acc[8]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n220 = n218 | n219;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n221 = sticky[8]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n222 = acc[7]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n223 = n221 | n222;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n224 = sticky[7]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n225 = acc[6]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n226 = n224 | n225;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n227 = sticky[6]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n228 = acc[5]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n229 = n227 | n228;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n230 = sticky[5]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n231 = acc[4]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n232 = n230 | n231;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n233 = sticky[4]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n234 = acc[3]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n235 = n233 | n234;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n236 = sticky[3]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n237 = acc[2]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n238 = n236 | n237;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n239 = sticky[2]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n240 = acc[1]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n241 = n239 | n240;
  /*# new/MAC_Unit.vhd:108:28 */
  assign n242 = sticky[1]; // extract
  /*# new/MAC_Unit.vhd:108:40 */
  assign n243 = acc[0]; // extract
  /*# new/MAC_Unit.vhd:108:34 */
  assign n244 = n242 | n243;
  /*# new/MAC_Unit.vhd:111:27 */
  assign n245 = acc[18]; // extract
  /*# new/MAC_Unit.vhd:113:30 */
  assign n246 = stickya[18]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n247 = acc[17]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n248 = n246 & n247;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n249 = stickya[17]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n250 = acc[16]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n251 = n249 & n250;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n252 = stickya[16]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n253 = acc[15]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n254 = n252 & n253;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n255 = stickya[15]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n256 = acc[14]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n257 = n255 & n256;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n258 = stickya[14]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n259 = acc[13]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n260 = n258 & n259;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n261 = stickya[13]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n262 = acc[12]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n263 = n261 & n262;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n264 = stickya[12]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n265 = acc[11]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n266 = n264 & n265;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n267 = stickya[11]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n268 = acc[10]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n269 = n267 & n268;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n270 = stickya[10]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n271 = acc[9]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n272 = n270 & n271;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n273 = stickya[9]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n274 = acc[8]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n275 = n273 & n274;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n276 = stickya[8]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n277 = acc[7]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n278 = n276 & n277;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n279 = stickya[7]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n280 = acc[6]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n281 = n279 & n280;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n282 = stickya[6]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n283 = acc[5]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n284 = n282 & n283;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n285 = stickya[5]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n286 = acc[4]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n287 = n285 & n286;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n288 = stickya[4]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n289 = acc[3]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n290 = n288 & n289;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n291 = stickya[3]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n292 = acc[2]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n293 = n291 & n292;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n294 = stickya[2]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n295 = acc[1]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n296 = n294 & n295;
  /*# new/MAC_Unit.vhd:113:30 */
  assign n297 = stickya[1]; // extract
  /*# new/MAC_Unit.vhd:113:43 */
  assign n298 = acc[0]; // extract
  /*# new/MAC_Unit.vhd:113:36 */
  assign n299 = n297 & n298;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n301 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n303 = n301 == 32'b00000000000000000000000000000000;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n304 = acc[7:0]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n305 = sticky[8]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n306 = sticky[7]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n307 = stickya[7]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n309 = n303 ? n304 : 8'b00000000;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n312 = n303 ? n305 : 1'b0;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n315 = n303 ? n306 : 1'b0;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n318 = n303 ? n307 : 1'b0;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n320 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n322 = n320 == 32'b00000000000000000000000000000001;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n323 = acc[8:1]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n324 = sticky[9]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n325 = sticky[8]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n326 = stickya[8]; // extract
  /*# new/MAC_Unit.vhd:131:32 */
  assign n327 = acc[0]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n328 = n322 ? n323 : n309;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n330 = n322 ? n327 : 1'b0;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n332 = n322 ? n324 : n312;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n333 = n322 ? n325 : n315;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n334 = n322 ? n326 : n318;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n335 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n337 = n335 == 32'b00000000000000000000000000000010;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n338 = acc[9:2]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n339 = sticky[10]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n340 = sticky[9]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n341 = stickya[9]; // extract
  /*# new/MAC_Unit.vhd:131:32 */
  assign n342 = acc[1]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n343 = n337 ? n338 : n328;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n344 = n337 ? n342 : n330;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n345 = n337 ? n339 : n332;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n346 = n337 ? n340 : n333;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n347 = n337 ? n341 : n334;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n348 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n350 = n348 == 32'b00000000000000000000000000000011;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n351 = acc[10:3]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n352 = sticky[11]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n353 = sticky[10]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n354 = stickya[10]; // extract
  /*# new/MAC_Unit.vhd:131:32 */
  assign n355 = acc[2]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n356 = n350 ? n351 : n343;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n357 = n350 ? n355 : n344;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n358 = n350 ? n352 : n345;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n359 = n350 ? n353 : n346;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n360 = n350 ? n354 : n347;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n361 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n363 = n361 == 32'b00000000000000000000000000000100;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n364 = acc[11:4]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n365 = sticky[12]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n366 = sticky[11]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n367 = stickya[11]; // extract
  /*# new/MAC_Unit.vhd:131:32 */
  assign n368 = acc[3]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n369 = n363 ? n364 : n356;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n370 = n363 ? n368 : n357;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n371 = n363 ? n365 : n358;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n372 = n363 ? n366 : n359;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n373 = n363 ? n367 : n360;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n374 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n376 = n374 == 32'b00000000000000000000000000000101;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n377 = acc[12:5]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n378 = sticky[13]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n379 = sticky[12]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n380 = stickya[12]; // extract
  /*# new/MAC_Unit.vhd:131:32 */
  assign n381 = acc[4]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n382 = n376 ? n377 : n369;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n383 = n376 ? n381 : n370;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n384 = n376 ? n378 : n371;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n385 = n376 ? n379 : n372;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n386 = n376 ? n380 : n373;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n387 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n389 = n387 == 32'b00000000000000000000000000000110;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n390 = acc[13:6]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n391 = sticky[14]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n392 = sticky[13]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n393 = stickya[13]; // extract
  /*# new/MAC_Unit.vhd:131:32 */
  assign n394 = acc[5]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n395 = n389 ? n390 : n382;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n396 = n389 ? n394 : n383;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n397 = n389 ? n391 : n384;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n398 = n389 ? n392 : n385;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n399 = n389 ? n393 : n386;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n400 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n402 = n400 == 32'b00000000000000000000000000000111;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n403 = acc[14:7]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n404 = sticky[15]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n405 = sticky[14]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n406 = stickya[14]; // extract
  /*# new/MAC_Unit.vhd:131:32 */
  assign n407 = acc[6]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n408 = n402 ? n403 : n395;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n409 = n402 ? n407 : n396;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n410 = n402 ? n404 : n397;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n411 = n402 ? n405 : n398;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n412 = n402 ? n406 : n399;
  /*# new/MAC_Unit.vhd:125:18 */
  assign n413 = {28'b0, s};  // uext
  /*# new/MAC_Unit.vhd:125:18 */
  assign n415 = n413 == 32'b00000000000000000000000000001000;
  /*# new/MAC_Unit.vhd:126:39 */
  assign n416 = acc[15:8]; // extract
  /*# new/MAC_Unit.vhd:127:34 */
  assign n417 = sticky[16]; // extract
  /*# new/MAC_Unit.vhd:128:34 */
  assign n418 = sticky[15]; // extract
  /*# new/MAC_Unit.vhd:129:34 */
  assign n419 = stickya[15]; // extract
  /*# new/MAC_Unit.vhd:131:32 */
  assign n420 = acc[7]; // extract
  /*# new/MAC_Unit.vhd:125:13 */
  assign n421 = n415 ? n416 : n408;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n422 = n415 ? n420 : n409;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n423 = n415 ? n417 : n410;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n424 = n415 ? n418 : n411;
  /*# new/MAC_Unit.vhd:125:13 */
  assign n425 = n415 ? n419 : n412;
  /*# new/MAC_Unit.vhd:138:18 */
  assign n428 = {1'b0, win};
  /*# new/MAC_Unit.vhd:138:25 */
  assign n430 = n428 + 9'b000000001;
  /*# new/MAC_Unit.vhd:138:29 */
  assign n431 = rbit ? n430 : n433;
  /*# new/MAC_Unit.vhd:138:55 */
  assign n433 = {1'b0, win};
  /*# new/MAC_Unit.vhd:139:16 */
  assign n434 = acc[19]; // extract
  /*# new/MAC_Unit.vhd:150:39 */
  assign n436 = ~rndgmod;
  /*# new/MAC_Unit.vhd:150:45 */
  assign n437 = sgn & n436;
  /*# new/MAC_Unit.vhd:150:26 */
  assign n438 = n437 ? 8'b00000000 : n444;
  /*# new/MAC_Unit.vhd:151:39 */
  assign n440 = ~rndgmod;
  /*# new/MAC_Unit.vhd:151:68 */
  assign n441 = sum9[8]; // extract
  /*# new/MAC_Unit.vhd:151:61 */
  assign n442 = hi_u | n441;
  /*# new/MAC_Unit.vhd:151:45 */
  assign n443 = n442 & n440;
  /*# new/MAC_Unit.vhd:150:59 */
  assign n444 = n443 ? 8'b11111111 : n451;
  /*# new/MAC_Unit.vhd:152:74 */
  assign n446 = ~sgn;
  /*# new/MAC_Unit.vhd:152:66 */
  assign n447 = n446 & rndgmod;
  /*# new/MAC_Unit.vhd:152:103 */
  assign n448 = sum9[7]; // extract
  /*# new/MAC_Unit.vhd:152:96 */
  assign n449 = hi_s | n448;
  /*# new/MAC_Unit.vhd:152:80 */
  assign n450 = n449 & n447;
  /*# new/MAC_Unit.vhd:151:89 */
  assign n451 = n450 ? 8'b01111111 : n456;
  /*# new/MAC_Unit.vhd:153:66 */
  assign n453 = sgn & rndgmod;
  /*# new/MAC_Unit.vhd:153:91 */
  assign n454 = ~all1_s;
  /*# new/MAC_Unit.vhd:153:80 */
  assign n455 = n454 & n453;
  /*# new/MAC_Unit.vhd:152:126 */
  assign n456 = n455 ? 8'b10000000 : n457;
  /*# new/MAC_Unit.vhd:154:13 */
  assign n457 = sum9[7:0]; // extract
  /*# new/MAC_Unit.vhd:157:31 */
  assign n459 = ~aresetn;
  /*# new/MAC_Unit.vhd:158:18 */
  assign n461 = en & re_last;
  /*# new/MAC_Unit.vhd:77:12 */
  assign n464 = {n190, n193, n196, n199, n202, n205, n208, n211, n214, n217, n220, n223, n226, n229, n232, n235, n238, n241, n244};
  /*# new/MAC_Unit.vhd:78:12 */
  assign n465 = {n245, n248, n251, n254, n257, n260, n263, n266, n269, n272, n275, n278, n281, n284, n287, n290, n293, n296, n299};
  /*# new/MAC_Unit.vhd:98:5 */
  assign n466 = en ? n181 : acc;
  /*# new/MAC_Unit.vhd:98:5 */
  always @(posedge clk)
    n467 <= n466;
  initial
    n467 = 20'b00000000000000000000;
  /*# new/MAC_Unit.vhd:157:37 */
  always @(posedge clk or posedge n459)
    if (n459)
      n468 <= 1'b0;
    else
      n468 <= n461;
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
  wire n46;
  wire [6:0] n48;
  wire [7:0] n49;
  wire n50;
  wire n54;
  wire [5:0] n57;
  wire n59;
  wire n60;
  wire [5:0] n63;
  wire n65;
  wire n66;
  wire [5:0] n69;
  wire n71;
  wire n72;
  wire [5:0] n75;
  wire n77;
  wire n78;
  wire [5:0] n81;
  wire n83;
  wire n84;
  wire [5:0] n87;
  wire n89;
  wire n90;
  wire [5:0] n93;
  wire n95;
  wire n96;
  wire [5:0] n99;
  wire n101;
  wire n102;
  wire [5:0] n105;
  wire [8:0] n107;
  wire n109;
  wire n111;
  wire n113;
  wire n115;
  wire n117;
  wire n119;
  wire n121;
  wire n123;
  wire n125;
  wire [8:0] n127;
  reg [5:0] n128;
  wire [7:0] macunit_n129;
  wire macunit_n130;
  wire [7:0] n140;
  reg [7:0] n141;
  wire n142;
  reg n143;
  wire [3:0] n144;
  reg [3:0] n145;
  wire [5:0] n146;
  reg [5:0] n147;
  wire [5:0] n148;
  reg [5:0] n149;
  wire [5:0] n150;
  reg [5:0] n151;
  wire [5:0] n152;
  reg [5:0] n153;
  wire [5:0] n154;
  reg [5:0] n155;
  wire [5:0] n156;
  reg [5:0] n157;
  wire [5:0] n158;
  reg [5:0] n159;
  wire [5:0] n160;
  reg [5:0] n161;
  wire [5:0] n162;
  reg [5:0] n163;
  reg n164;
  wire [7:0] n165;
  reg [7:0] n166;
  assign s_axis_tready = m_axis_tready; //(module output)
  assign m_axis_tvalid = macuv_d; //(module output)
  assign m_axis_tdata = n141; //(module output)
  /*# imports/new/Front_End.vhd:64:8 */
  assign rndgmod = n143; // (signal)
  /*# imports/new/Front_End.vhd:65:8 */
  always @*
    shiftsel = n145; // (isignal)
  initial
    shiftsel = 4'b0000;
  /*# imports/new/Front_End.vhd:66:8 */
  always @*
    h_px11 = n147; // (isignal)
  initial
    h_px11 = 6'b111111;
  /*# imports/new/Front_End.vhd:67:8 */
  always @*
    h_px10 = n149; // (isignal)
  initial
    h_px10 = 6'b111111;
  /*# imports/new/Front_End.vhd:68:8 */
  always @*
    h_px01 = n151; // (isignal)
  initial
    h_px01 = 6'b111111;
  /*# imports/new/Front_End.vhd:69:8 */
  always @*
    h_px1_1 = n153; // (isignal)
  initial
    h_px1_1 = 6'b111111;
  /*# imports/new/Front_End.vhd:70:8 */
  always @*
    h_px00 = n155; // (isignal)
  initial
    h_px00 = 6'b001000;
  /*# imports/new/Front_End.vhd:71:8 */
  always @*
    h_px_1_1 = n157; // (isignal)
  initial
    h_px_1_1 = 6'b111111;
  /*# imports/new/Front_End.vhd:72:8 */
  always @*
    h_px_10 = n159; // (isignal)
  initial
    h_px_10 = 6'b111111;
  /*# imports/new/Front_End.vhd:73:8 */
  always @*
    h_px0_1 = n161; // (isignal)
  initial
    h_px0_1 = 6'b111111;
  /*# imports/new/Front_End.vhd:74:8 */
  always @*
    h_px_11 = n163; // (isignal)
  initial
    h_px_11 = 6'b111111;
  /*# imports/new/Front_End.vhd:75:8 */
  assign macu_i = s_axis_tdata; // (signal)
  /*# imports/new/Front_End.vhd:76:8 */
  assign macu_hpre = n128; // (signal)
  /*# imports/new/Front_End.vhd:77:8 */
  assign macu_h = macu_hpre; // (signal)
  /*# imports/new/Front_End.vhd:78:8 */
  assign macures = macunit_n129; // (signal)
  /*# imports/new/Front_End.vhd:79:8 */
  assign macuv = macunit_n130; // (signal)
  /*# imports/new/Front_End.vhd:80:8 */
  always @*
    macuv_d = n164; // (isignal)
  initial
    macuv_d = 1'b0;
  /*# imports/new/Front_End.vhd:81:8 */
  always @*
    tuserpipe = n166; // (isignal)
  initial
    tuserpipe = 8'b00000000;
  /*# imports/new/Front_End.vhd:112:25 */
  assign n39 = s_axis_tdata[0]; // extract
  /*# imports/new/Front_End.vhd:113:34 */
  assign n43 = s_axis_tdata[4:1]; // extract
  /*# imports/new/Front_End.vhd:115:43 */
  assign n46 = ~aresetn;
  /*# imports/new/Front_End.vhd:116:38 */
  assign n48 = tuserpipe[7:1]; // extract
  /*# imports/new/Front_End.vhd:116:27 */
  assign n49 = {s_axis_tuser, n48};
  /*# imports/new/Front_End.vhd:116:77 */
  assign n50 = s_axis_tvalid | wghupd;
  /*# imports/new/Front_End.vhd:118:64 */
  assign n54 = s_axis_tuser & wghupd;
  /*# imports/new/Front_End.vhd:118:32 */
  assign n57 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:119:78 */
  assign n59 = tuserpipe[7]; // extract
  /*# imports/new/Front_End.vhd:119:64 */
  assign n60 = n59 & wghupd;
  /*# imports/new/Front_End.vhd:119:32 */
  assign n63 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:120:78 */
  assign n65 = tuserpipe[6]; // extract
  /*# imports/new/Front_End.vhd:120:64 */
  assign n66 = n65 & wghupd;
  /*# imports/new/Front_End.vhd:120:32 */
  assign n69 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:121:78 */
  assign n71 = tuserpipe[5]; // extract
  /*# imports/new/Front_End.vhd:121:64 */
  assign n72 = n71 & wghupd;
  /*# imports/new/Front_End.vhd:121:32 */
  assign n75 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:122:78 */
  assign n77 = tuserpipe[4]; // extract
  /*# imports/new/Front_End.vhd:122:64 */
  assign n78 = n77 & wghupd;
  /*# imports/new/Front_End.vhd:122:32 */
  assign n81 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:123:78 */
  assign n83 = tuserpipe[3]; // extract
  /*# imports/new/Front_End.vhd:123:64 */
  assign n84 = n83 & wghupd;
  /*# imports/new/Front_End.vhd:123:32 */
  assign n87 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:124:78 */
  assign n89 = tuserpipe[2]; // extract
  /*# imports/new/Front_End.vhd:124:64 */
  assign n90 = n89 & wghupd;
  /*# imports/new/Front_End.vhd:124:32 */
  assign n93 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:125:78 */
  assign n95 = tuserpipe[1]; // extract
  /*# imports/new/Front_End.vhd:125:64 */
  assign n96 = n95 & wghupd;
  /*# imports/new/Front_End.vhd:125:32 */
  assign n99 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:126:78 */
  assign n101 = tuserpipe[0]; // extract
  /*# imports/new/Front_End.vhd:126:64 */
  assign n102 = n101 & wghupd;
  /*# imports/new/Front_End.vhd:126:32 */
  assign n105 = s_axis_tdata[5:0]; // extract
  /*# imports/new/Front_End.vhd:128:37 */
  assign n107 = {s_axis_tuser, tuserpipe};
  /*# imports/new/Front_End.vhd:129:25 */
  assign n109 = n107 == 9'b100000000;
  /*# imports/new/Front_End.vhd:129:50 */
  assign n111 = n107 == 9'b010000000;
  /*# imports/new/Front_End.vhd:129:75 */
  assign n113 = n107 == 9'b001000000;
  /*# imports/new/Front_End.vhd:130:26 */
  assign n115 = n107 == 9'b000100000;
  /*# imports/new/Front_End.vhd:130:51 */
  assign n117 = n107 == 9'b000010000;
  /*# imports/new/Front_End.vhd:130:78 */
  assign n119 = n107 == 9'b000001000;
  /*# imports/new/Front_End.vhd:131:26 */
  assign n121 = n107 == 9'b000000100;
  /*# imports/new/Front_End.vhd:131:52 */
  assign n123 = n107 == 9'b000000010;
  /*# imports/new/Front_End.vhd:131:78 */
  assign n125 = n107 == 9'b000000001;
  /*# imports/new/Front_End.vhd:128:1 */
  assign n127 = {n125, n123, n121, n119, n117, n115, n113, n111, n109};
  /*# imports/new/Front_End.vhd:128:1 */
  always @*
    case (n127)
      9'b100000000: n128 = h_px_11;
      9'b010000000: n128 = h_px0_1;
      9'b001000000: n128 = h_px_10;
      9'b000100000: n128 = h_px_1_1;
      9'b000010000: n128 = h_px00;
      9'b000001000: n128 = h_px1_1;
      9'b000000100: n128 = h_px01;
      9'b000000010: n128 = h_px10;
      9'b000000001: n128 = h_px11;
      default: n128 = 6'b000000;
    endcase
  /*# imports/new/Front_End.vhd:137:1 */
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
    .macu_res(macunit_n129),
    .macu_valid(macunit_n130));
  /*# imports/new/Front_End.vhd:142:1 */
  assign n140 = macuv ? macures : n141;
  /*# imports/new/Front_End.vhd:142:1 */
  always @(posedge clk)
    n141 <= n140;
  /*# imports/new/Front_End.vhd:112:1 */
  assign n142 = rndgset ? n39 : rndgmod;
  /*# imports/new/Front_End.vhd:112:1 */
  always @(posedge clk)
    n143 <= n142;
  /*# imports/new/Front_End.vhd:113:1 */
  assign n144 = rndgset ? n43 : shiftsel;
  /*# imports/new/Front_End.vhd:113:1 */
  always @(posedge clk)
    n145 <= n144;
  initial
    n145 = 4'b0000;
  /*# imports/new/Front_End.vhd:118:1 */
  assign n146 = n54 ? n57 : h_px11;
  /*# imports/new/Front_End.vhd:118:1 */
  always @(posedge clk)
    n147 <= n146;
  initial
    n147 = 6'b111111;
  /*# imports/new/Front_End.vhd:119:1 */
  assign n148 = n60 ? n63 : h_px10;
  /*# imports/new/Front_End.vhd:119:1 */
  always @(posedge clk)
    n149 <= n148;
  initial
    n149 = 6'b111111;
  /*# imports/new/Front_End.vhd:120:1 */
  assign n150 = n66 ? n69 : h_px01;
  /*# imports/new/Front_End.vhd:120:1 */
  always @(posedge clk)
    n151 <= n150;
  initial
    n151 = 6'b111111;
  /*# imports/new/Front_End.vhd:121:1 */
  assign n152 = n72 ? n75 : h_px1_1;
  /*# imports/new/Front_End.vhd:121:1 */
  always @(posedge clk)
    n153 <= n152;
  initial
    n153 = 6'b111111;
  /*# imports/new/Front_End.vhd:122:1 */
  assign n154 = n78 ? n81 : h_px00;
  /*# imports/new/Front_End.vhd:122:1 */
  always @(posedge clk)
    n155 <= n154;
  initial
    n155 = 6'b001000;
  /*# imports/new/Front_End.vhd:123:1 */
  assign n156 = n84 ? n87 : h_px_1_1;
  /*# imports/new/Front_End.vhd:123:1 */
  always @(posedge clk)
    n157 <= n156;
  initial
    n157 = 6'b111111;
  /*# imports/new/Front_End.vhd:124:1 */
  assign n158 = n90 ? n93 : h_px_10;
  /*# imports/new/Front_End.vhd:124:1 */
  always @(posedge clk)
    n159 <= n158;
  initial
    n159 = 6'b111111;
  /*# imports/new/Front_End.vhd:125:1 */
  assign n160 = n96 ? n99 : h_px0_1;
  /*# imports/new/Front_End.vhd:125:1 */
  always @(posedge clk)
    n161 <= n160;
  initial
    n161 = 6'b111111;
  /*# imports/new/Front_End.vhd:126:1 */
  assign n162 = n102 ? n105 : h_px_11;
  /*# imports/new/Front_End.vhd:126:1 */
  always @(posedge clk)
    n163 <= n162;
  initial
    n163 = 6'b111111;
  /*# imports/new/Front_End.vhd:143:1 */
  always @(posedge clk)
    n164 <= macuv;
  initial
    n164 = 1'b0;
  /*# imports/new/Front_End.vhd:115:49 */
  assign n165 = n50 ? n49 : tuserpipe;
  /*# imports/new/Front_End.vhd:115:49 */
  always @(posedge clk or posedge n46)
    if (n46)
      n166 <= 8'b00000000;
    else
      n166 <= n165;
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

