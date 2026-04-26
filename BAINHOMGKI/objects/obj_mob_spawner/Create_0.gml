randomize(); 

function spawn_quai(loai_quai, so_luong) {
    repeat (so_luong) {
        var rx = irandom_range(0, room_width);
        var ry = irandom_range(0, room_height);
        
        if (instance_exists(obj_nv)) {
            while (point_distance(rx, ry, obj_nv.x, obj_nv.y) < 200) {
                rx = irandom_range(0, room_width);
                ry = irandom_range(0, room_height);
            }
        }
        
        instance_create_layer(rx, ry, layer, loai_quai);
    }
}

spawn_quai(obj_slime, 10);
spawn_quai(obj_2slimes, 8);
spawn_quai(obj_mushroom, 7);
spawn_quai(obj_phantom, 5);