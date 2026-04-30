// Kiểm tra xem sprite hiện tại có phải là sprite tấn công không
if (sprite_index == Spr_nvtancong) {
    // Nếu đúng là đang tấn công xong, thì đổi lại sprite đứng yên
    sprite_index = spr_nvdungyen;
}
if (is_dead) {

    if (death_phase == 1) {

        death_phase = 2;

        // lưu hướng trước đó
        var dir = image_xscale;

        sprite_index = spr_nvtanbien;
        image_index = 0;
        image_speed = 0.5;

        // áp lại hướng
        image_xscale = dir;
    }
    else if (death_phase == 2) {
        instance_destroy();
    }

}
if (is_attacking) {
    is_attacking = false;
}