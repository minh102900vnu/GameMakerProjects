spawn_timer--;

if (spawn_timer <= 0) {

    spawn_timer = spawn_delay;

    if (instance_number(obj_dom) < max_fireflies) {

        // spawn gần player (để chắc chắn nhìn thấy)
        var xx = random(room_width);
		var yy = random(room_height);

        instance_create_depth(xx, yy, -100, obj_dom);
    }
}