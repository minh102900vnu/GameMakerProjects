draw_self();

var bar_w = 40;
var bar_h = 6;

var xx = x - bar_w/2;
var yy = y - 35; // đã nâng cao

// đảm bảo hp không âm
hp = clamp(hp, 0, max_hp);

var hp_ratio = hp / max_hp;

// nền
draw_set_color(c_black);
draw_rectangle(xx, yy, xx + bar_w, yy + bar_h, false);

// chỉ vẽ máu khi hp > 0
if (hp > 0) {
    draw_set_color(c_red);
    draw_rectangle(xx, yy, xx + bar_w * hp_ratio, yy + bar_h, false);
}