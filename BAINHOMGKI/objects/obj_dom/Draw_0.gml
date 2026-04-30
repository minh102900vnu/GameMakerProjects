// độ sáng thay đổi theo sin
var alpha = 0.6 + sin(t * blink_speed + blink_offset) * 0.4;

// kích thước cũng thay đổi nhẹ (giống ánh sáng phồng ra)
var scale = 1 + sin(t * blink_speed + blink_offset) * 0.2;

// vẽ glow giả
draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, 0, c_yellow, alpha);

// sprite chính
draw_sprite(sprite_index, image_index, x, y);