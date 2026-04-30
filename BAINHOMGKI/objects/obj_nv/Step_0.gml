if (poison_timer > 0) {
    poison_timer--;
    poison_tick--;
    
    if (poison_tick <= 0) {
        hp -= poison_stacks; 
        poison_tick = game_get_speed(gamespeed_fps) * 2.5; 
    }
    
    if (!instance_exists(obj_trungdoc)) {
        var ef = instance_create_layer(x, y, layer, obj_trungdoc);
        ef.target = id; 
    }
} else {
    poison_stacks = 0; 
    
    if (instance_exists(obj_trungdoc)) {
        instance_destroy(obj_trungdoc);
    }
}

// nếu đã chết → chỉ chạy animation
if (is_dead) {
    exit;
}

// kích hoạt chết
if (hp <= 0) {
    is_dead = true;
    death_phase = 1;

    sprite_index = spr_nvnga;
    image_index = 0;
    image_speed = 0.3;

    exit;
}

// input di chuyển
var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var spd = 8;

// lật hướng
if (h != 0) image_xscale = sign(h);

// di chuyển
x += h * spd;
y += v * spd;
if (shoot_cooldown > 0) shoot_cooldown--;
// 🔥 CHỈ đổi sprite khi KHÔNG tấn công
if (!is_attacking) {

    if (h != 0 || v != 0) {
        sprite_index = spr_nvdichuyen;
        image_speed = 0.5;
    } else {
        sprite_index = spr_nvdungyen;
        image_speed = 0.5;
    }

}