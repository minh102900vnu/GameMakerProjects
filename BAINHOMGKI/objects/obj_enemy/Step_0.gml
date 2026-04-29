if (hp <= 0) {

    var p = instance_nearest(x, y, obj_nv);

    if (instance_exists(p)) {

        var old_hp = p.hp;

        p.hp += 3;
        p.hp = clamp(p.hp, 0, p.max_hp);

        // 🔥 chỉ tạo hiệu ứng nếu THỰC SỰ được hồi
        if (p.hp > old_hp) {
            var ef = instance_create_depth(p.x, p.y - 20, p.depth - 1, obj_hoimau);
            ef.target = p.id;
        }
    }

    instance_destroy();
}