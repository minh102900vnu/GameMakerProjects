
time--;

// bám theo player
if (instance_exists(target)) {
    x = target.x + irandom_range(-5,5);
    y = target.y + irandom_range(-5,5);
}

// hết thời gian thì xoá
if (time <= 0) {
    instance_destroy();
}