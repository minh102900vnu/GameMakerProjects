draw_self();

gpu_set_blendmode(bm_add);

draw_sprite_ext(spr_light, 0, x, y, 0.6, 0.6, 0, c_orange, 0.3); 

draw_sprite_ext(spr_light, 0, x, y, 0.15, 0.15, 0, c_yellow, 0.8); 

gpu_set_blendmode(bm_normal);