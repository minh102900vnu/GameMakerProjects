if (!is_dead) {

    // luôn cho bắn
    instance_create_depth(x, y, depth+1, obj_dan);

    // reset animation mỗi lần click
    is_attacking = true;
    sprite_index = Spr_nvtancong;
    image_index = 0;
    image_speed = 1;
}