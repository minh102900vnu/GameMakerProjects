if (sprite_index == Spr_nvtancong) {
    sprite_index = spr_nvdungyen;
}
if (is_dead) {

    if (death_phase == 1) {
        death_phase = 2;
        var dir = image_xscale;
        sprite_index = spr_nvtanbien;
        image_index = 0;
        image_speed = 0.5;
        image_xscale = dir;
    }
    else if (death_phase == 2) {
		instance_create_layer(0, 0, "Instances", obj_lose);
        instance_destroy();
    }

}
if (is_attacking) {
    is_attacking = false;
}