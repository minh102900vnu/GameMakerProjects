draw_self();
gpu_set_blendmode(bm_add);

draw_sprite_ext(spr_light, 0, x, y, 0.5, 0.5, 0, c_orange, 0.3);

gpu_set_blendmode(bm_normal); 