draw_self();

var bar_w = 50;
var bar_h = 6;

var xx = x - bar_w/2;
var yy = y - 35;

// clamp
hp = clamp(hp, 0, max_hp);

// tỉ lệ
var hp_ratio = hp / max_hp;
var smooth_ratio = hp_smooth / max_hp;

// 🔳 nền
draw_set_color(make_color_rgb(30,30,30));
draw_rectangle(xx, yy, xx + bar_w, yy + bar_h, false);

// 🟥 máu "tụt chậm" (đỏ đậm phía sau)
draw_set_color(make_color_rgb(120,0,0));
draw_rectangle(xx, yy, xx + bar_w * smooth_ratio, yy + bar_h, false);

// ❤️ máu thật (đỏ tươi phía trước)
if (hp > 0) {
    draw_set_color(c_red);
    draw_rectangle(xx, yy, xx + bar_w * hp_ratio, yy + bar_h, false);
}

// 🟦 viền
draw_set_color(c_white);
draw_rectangle(xx, yy, xx + bar_w, yy + bar_h, true);