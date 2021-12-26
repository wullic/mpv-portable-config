// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

//!DESC RAVU-Zoom (chroma, r4, compute)
//!HOOK CHROMA
//!BIND HOOKED
//!BIND ravu_zoom_lut4
//!BIND LUMA
//!WIDTH LUMA.w
//!HEIGHT LUMA.h
//!OFFSET ALIGN
//!WHEN HOOKED.w LUMA.w < HOOKED.h LUMA.h < *
//!COMPUTE 32 8
shared vec3 samples[640];
void hook() {
ivec2 group_begin = ivec2(gl_WorkGroupID) * ivec2(gl_WorkGroupSize);
ivec2 group_end = group_begin + ivec2(gl_WorkGroupSize) - ivec2(1);
ivec2 rectl = ivec2(floor(HOOKED_size * HOOKED_map(group_begin) - 0.5)) - 3;
ivec2 rectr = ivec2(floor(HOOKED_size * HOOKED_map(group_end) - 0.5)) + 4;
ivec2 rect = rectr - rectl + 1;
for (int id = int(gl_LocalInvocationIndex); id < rect.x * rect.y; id += int(gl_WorkGroupSize.x * gl_WorkGroupSize.y)) {
int y = id / rect.x, x = id % rect.x;
samples[x + y * 40] = vec3(HOOKED_tex(HOOKED_pt * (vec2(rectl + ivec2(x, y)) + vec2(0.5,0.5) + HOOKED_off)).xy, LUMA_tex(HOOKED_pt * (vec2(rectl + ivec2(x, y)) + vec2(0.5,0.5)) + LUMA_pt * tex_offset).x);
}
groupMemoryBarrier();
barrier();
vec2 pos = HOOKED_size * HOOKED_map(ivec2(gl_GlobalInvocationID));
vec2 subpix = fract(pos - 0.5);
pos -= subpix;
subpix = LUT_POS(subpix, vec2(9.0));
vec2 subpix_inv = 1.0 - subpix;
subpix /= vec2(8.0, 288.0);
subpix_inv /= vec2(8.0, 288.0);
ivec2 ipos = ivec2(floor(pos)) - rectl;
int lpos = ipos.x + ipos.y * 40;
vec3 sample0 = samples[-123 + lpos];
vec3 sample1 = samples[-83 + lpos];
vec3 sample2 = samples[-43 + lpos];
vec3 sample3 = samples[-3 + lpos];
vec3 sample4 = samples[37 + lpos];
vec3 sample5 = samples[77 + lpos];
vec3 sample6 = samples[117 + lpos];
vec3 sample7 = samples[157 + lpos];
vec3 sample8 = samples[-122 + lpos];
vec3 sample9 = samples[-82 + lpos];
vec3 sample10 = samples[-42 + lpos];
vec3 sample11 = samples[-2 + lpos];
vec3 sample12 = samples[38 + lpos];
vec3 sample13 = samples[78 + lpos];
vec3 sample14 = samples[118 + lpos];
vec3 sample15 = samples[158 + lpos];
vec3 sample16 = samples[-121 + lpos];
vec3 sample17 = samples[-81 + lpos];
vec3 sample18 = samples[-41 + lpos];
vec3 sample19 = samples[-1 + lpos];
vec3 sample20 = samples[39 + lpos];
vec3 sample21 = samples[79 + lpos];
vec3 sample22 = samples[119 + lpos];
vec3 sample23 = samples[159 + lpos];
vec3 sample24 = samples[-120 + lpos];
vec3 sample25 = samples[-80 + lpos];
vec3 sample26 = samples[-40 + lpos];
vec3 sample27 = samples[0 + lpos];
vec3 sample28 = samples[40 + lpos];
vec3 sample29 = samples[80 + lpos];
vec3 sample30 = samples[120 + lpos];
vec3 sample31 = samples[160 + lpos];
vec3 sample32 = samples[-119 + lpos];
vec3 sample33 = samples[-79 + lpos];
vec3 sample34 = samples[-39 + lpos];
vec3 sample35 = samples[1 + lpos];
vec3 sample36 = samples[41 + lpos];
vec3 sample37 = samples[81 + lpos];
vec3 sample38 = samples[121 + lpos];
vec3 sample39 = samples[161 + lpos];
vec3 sample40 = samples[-118 + lpos];
vec3 sample41 = samples[-78 + lpos];
vec3 sample42 = samples[-38 + lpos];
vec3 sample43 = samples[2 + lpos];
vec3 sample44 = samples[42 + lpos];
vec3 sample45 = samples[82 + lpos];
vec3 sample46 = samples[122 + lpos];
vec3 sample47 = samples[162 + lpos];
vec3 sample48 = samples[-117 + lpos];
vec3 sample49 = samples[-77 + lpos];
vec3 sample50 = samples[-37 + lpos];
vec3 sample51 = samples[3 + lpos];
vec3 sample52 = samples[43 + lpos];
vec3 sample53 = samples[83 + lpos];
vec3 sample54 = samples[123 + lpos];
vec3 sample55 = samples[163 + lpos];
vec3 sample56 = samples[-116 + lpos];
vec3 sample57 = samples[-76 + lpos];
vec3 sample58 = samples[-36 + lpos];
vec3 sample59 = samples[4 + lpos];
vec3 sample60 = samples[44 + lpos];
vec3 sample61 = samples[84 + lpos];
vec3 sample62 = samples[124 + lpos];
vec3 sample63 = samples[164 + lpos];
vec3 abd = vec3(0.0);
float gx, gy;
gx = (sample17.z-sample1.z)/2.0;
gy = (sample10.z-sample8.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.011007348802298533;
gx = (sample18.z-sample2.z)/2.0;
gy = (-sample12.z+8.0*sample11.z-8.0*sample9.z+sample8.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (sample19.z-sample3.z)/2.0;
gy = (-sample13.z+8.0*sample12.z-8.0*sample10.z+sample9.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (sample20.z-sample4.z)/2.0;
gy = (-sample14.z+8.0*sample13.z-8.0*sample11.z+sample10.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (sample21.z-sample5.z)/2.0;
gy = (-sample15.z+8.0*sample14.z-8.0*sample12.z+sample11.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (sample22.z-sample6.z)/2.0;
gy = (sample15.z-sample13.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.011007348802298533;
gx = (-sample33.z+8.0*sample25.z-8.0*sample9.z+sample1.z)/12.0;
gy = (sample18.z-sample16.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (-sample34.z+8.0*sample26.z-8.0*sample10.z+sample2.z)/12.0;
gy = (-sample20.z+8.0*sample19.z-8.0*sample17.z+sample16.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.02992107622879854;
gx = (-sample35.z+8.0*sample27.z-8.0*sample11.z+sample3.z)/12.0;
gy = (-sample21.z+8.0*sample20.z-8.0*sample18.z+sample17.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-sample36.z+8.0*sample28.z-8.0*sample12.z+sample4.z)/12.0;
gy = (-sample22.z+8.0*sample21.z-8.0*sample19.z+sample18.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-sample37.z+8.0*sample29.z-8.0*sample13.z+sample5.z)/12.0;
gy = (-sample23.z+8.0*sample22.z-8.0*sample20.z+sample19.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.02992107622879854;
gx = (-sample38.z+8.0*sample30.z-8.0*sample14.z+sample6.z)/12.0;
gy = (sample23.z-sample21.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (-sample41.z+8.0*sample33.z-8.0*sample17.z+sample9.z)/12.0;
gy = (sample26.z-sample24.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (-sample42.z+8.0*sample34.z-8.0*sample18.z+sample10.z)/12.0;
gy = (-sample28.z+8.0*sample27.z-8.0*sample25.z+sample24.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-sample43.z+8.0*sample35.z-8.0*sample19.z+sample11.z)/12.0;
gy = (-sample29.z+8.0*sample28.z-8.0*sample26.z+sample25.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04933151482066013;
gx = (-sample44.z+8.0*sample36.z-8.0*sample20.z+sample12.z)/12.0;
gy = (-sample30.z+8.0*sample29.z-8.0*sample27.z+sample26.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04933151482066013;
gx = (-sample45.z+8.0*sample37.z-8.0*sample21.z+sample13.z)/12.0;
gy = (-sample31.z+8.0*sample30.z-8.0*sample28.z+sample27.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-sample46.z+8.0*sample38.z-8.0*sample22.z+sample14.z)/12.0;
gy = (sample31.z-sample29.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (-sample49.z+8.0*sample41.z-8.0*sample25.z+sample17.z)/12.0;
gy = (sample34.z-sample32.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (-sample50.z+8.0*sample42.z-8.0*sample26.z+sample18.z)/12.0;
gy = (-sample36.z+8.0*sample35.z-8.0*sample33.z+sample32.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-sample51.z+8.0*sample43.z-8.0*sample27.z+sample19.z)/12.0;
gy = (-sample37.z+8.0*sample36.z-8.0*sample34.z+sample33.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04933151482066013;
gx = (-sample52.z+8.0*sample44.z-8.0*sample28.z+sample20.z)/12.0;
gy = (-sample38.z+8.0*sample37.z-8.0*sample35.z+sample34.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04933151482066013;
gx = (-sample53.z+8.0*sample45.z-8.0*sample29.z+sample21.z)/12.0;
gy = (-sample39.z+8.0*sample38.z-8.0*sample36.z+sample35.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-sample54.z+8.0*sample46.z-8.0*sample30.z+sample22.z)/12.0;
gy = (sample39.z-sample37.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (-sample57.z+8.0*sample49.z-8.0*sample33.z+sample25.z)/12.0;
gy = (sample42.z-sample40.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (-sample58.z+8.0*sample50.z-8.0*sample34.z+sample26.z)/12.0;
gy = (-sample44.z+8.0*sample43.z-8.0*sample41.z+sample40.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.02992107622879854;
gx = (-sample59.z+8.0*sample51.z-8.0*sample35.z+sample27.z)/12.0;
gy = (-sample45.z+8.0*sample44.z-8.0*sample42.z+sample41.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-sample60.z+8.0*sample52.z-8.0*sample36.z+sample28.z)/12.0;
gy = (-sample46.z+8.0*sample45.z-8.0*sample43.z+sample42.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-sample61.z+8.0*sample53.z-8.0*sample37.z+sample29.z)/12.0;
gy = (-sample47.z+8.0*sample46.z-8.0*sample44.z+sample43.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.02992107622879854;
gx = (-sample62.z+8.0*sample54.z-8.0*sample38.z+sample30.z)/12.0;
gy = (sample47.z-sample45.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (sample57.z-sample41.z)/2.0;
gy = (sample50.z-sample48.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.011007348802298533;
gx = (sample58.z-sample42.z)/2.0;
gy = (-sample52.z+8.0*sample51.z-8.0*sample49.z+sample48.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (sample59.z-sample43.z)/2.0;
gy = (-sample53.z+8.0*sample52.z-8.0*sample50.z+sample49.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (sample60.z-sample44.z)/2.0;
gy = (-sample54.z+8.0*sample53.z-8.0*sample51.z+sample50.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (sample61.z-sample45.z)/2.0;
gy = (-sample55.z+8.0*sample54.z-8.0*sample52.z+sample51.z)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (sample62.z-sample46.z)/2.0;
gy = (sample55.z-sample53.z)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.011007348802298533;
float a = abd.x, b = abd.y, d = abd.z;
float T = a + d, D = a * d - b * b;
float delta = sqrt(max(T * T / 4.0 - D, 0.0));
float L1 = T / 2.0 + delta, L2 = T / 2.0 - delta;
float sqrtL1 = sqrt(L1), sqrtL2 = sqrt(L2);
float theta = mix(mod(atan(L1 - a, b) + 3.141592653589793, 3.141592653589793), 0.0, abs(b) < 1.192092896e-7);
float lambda = sqrtL1;
float mu = mix((sqrtL1 - sqrtL2) / (sqrtL1 + sqrtL2), 0.0, sqrtL1 + sqrtL2 < 1.192092896e-7);
float angle = floor(theta * 24.0 / 3.141592653589793);
float strength = mix(mix(0.0, 1.0, lambda >= 0.004), mix(2.0, 3.0, lambda >= 0.05), lambda >= 0.016);
float coherence = mix(mix(0.0, 1.0, mu >= 0.25), 2.0, mu >= 0.5);
float coord_y = ((angle * 4.0 + strength) * 3.0 + coherence) / 288.0;
vec2 res = vec2(0.0);
vec4 w;
w = texture(ravu_zoom_lut4, vec2(0.0, coord_y) + subpix);
res += sample0.xy * w[0];
res += sample1.xy * w[1];
res += sample2.xy * w[2];
res += sample3.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.125, coord_y) + subpix);
res += sample4.xy * w[0];
res += sample5.xy * w[1];
res += sample6.xy * w[2];
res += sample7.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.25, coord_y) + subpix);
res += sample8.xy * w[0];
res += sample9.xy * w[1];
res += sample10.xy * w[2];
res += sample11.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.375, coord_y) + subpix);
res += sample12.xy * w[0];
res += sample13.xy * w[1];
res += sample14.xy * w[2];
res += sample15.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.5, coord_y) + subpix);
res += sample16.xy * w[0];
res += sample17.xy * w[1];
res += sample18.xy * w[2];
res += sample19.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.625, coord_y) + subpix);
res += sample20.xy * w[0];
res += sample21.xy * w[1];
res += sample22.xy * w[2];
res += sample23.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.75, coord_y) + subpix);
res += sample24.xy * w[0];
res += sample25.xy * w[1];
res += sample26.xy * w[2];
res += sample27.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.875, coord_y) + subpix);
res += sample28.xy * w[0];
res += sample29.xy * w[1];
res += sample30.xy * w[2];
res += sample31.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.0, coord_y) + subpix_inv);
res += sample63.xy * w[0];
res += sample62.xy * w[1];
res += sample61.xy * w[2];
res += sample60.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.125, coord_y) + subpix_inv);
res += sample59.xy * w[0];
res += sample58.xy * w[1];
res += sample57.xy * w[2];
res += sample56.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.25, coord_y) + subpix_inv);
res += sample55.xy * w[0];
res += sample54.xy * w[1];
res += sample53.xy * w[2];
res += sample52.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.375, coord_y) + subpix_inv);
res += sample51.xy * w[0];
res += sample50.xy * w[1];
res += sample49.xy * w[2];
res += sample48.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.5, coord_y) + subpix_inv);
res += sample47.xy * w[0];
res += sample46.xy * w[1];
res += sample45.xy * w[2];
res += sample44.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.625, coord_y) + subpix_inv);
res += sample43.xy * w[0];
res += sample42.xy * w[1];
res += sample41.xy * w[2];
res += sample40.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.75, coord_y) + subpix_inv);
res += sample39.xy * w[0];
res += sample38.xy * w[1];
res += sample37.xy * w[2];
res += sample36.xy * w[3];
w = texture(ravu_zoom_lut4, vec2(0.875, coord_y) + subpix_inv);
res += sample35.xy * w[0];
res += sample34.xy * w[1];
res += sample33.xy * w[2];
res += sample32.xy * w[3];
res = clamp(res, 0.0, 1.0);
imageStore(out_image, ivec2(gl_GlobalInvocationID), vec4(res, 0.0, 0.0));
}
//!TEXTURE ravu_zoom_lut4
//!SIZE 72 2592
//!FORMAT rgba16hf
//!FILTER LINEAR