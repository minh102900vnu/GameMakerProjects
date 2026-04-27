time--;

// bám theo player
if (instance_exists(target)) {
    x = target.x;
    y = target.y;
}

// hết hiệu ứng
if (time <= 0) {
    if (instance_exists(target)) {
        target.is_poisoned = false; // cho phép dính lại
    }
    instance_destroy();
}