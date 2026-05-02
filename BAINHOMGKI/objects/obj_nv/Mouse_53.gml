
if (!is_dead && shoot_cooldown <= 0) {
    instance_create_depth(x, y, depth+1, obj_dan);
	
	audio_play_sound(lasershoot, 50, false);
	
    sprite_index = Spr_nvtancong;
    image_index = 0;
    image_speed = 1;
	is_attacking = true; 
    shoot_cooldown = 30;
}

