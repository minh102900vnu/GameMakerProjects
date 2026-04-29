
if (!is_dead && shoot_cooldown <= 0) {

    instance_create_depth(x, y, depth+1, obj_dan);

    sprite_index = Spr_nvtancong;
    image_index = 0;
    image_speed = 1;
	is_attacking = true; 
    shoot_cooldown = 30; // ~1 giây (60 frame)
}