// đổi hướng ngẫu nhiên
change_dir_timer--;

if (change_dir_timer <= 0) {
    dir += random_range(-60, 60);
    change_dir_timer = irandom_range(30, 90);
}

// di chuyển
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

// bay lượn nhẹ
t += 0.1;
y += sin(t + offset) * 0.3;

// 🔥 tự xoá nếu quá xa player (tránh lag)
if (instance_exists(obj_nv)) {
    if (distance_to_object(obj_nv) > 800) {
        instance_destroy();
    }
}