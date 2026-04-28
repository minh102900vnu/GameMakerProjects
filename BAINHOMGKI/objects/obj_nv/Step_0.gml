var active_stacks = 0;
hp_smooth = lerp(hp_smooth, hp, 0.1);
for (var i = array_length(poison_timers) - 1; i >= 0; i--) {
    poison_timers[i]--;
    
    if (poison_timers[i] <= 0) {
        array_delete(poison_timers, i, 1); 
    } else {
        active_stacks++; 
    }
}

if (active_stacks > 0) {
    poison_tick--;
    if (poison_tick <= 0) {
        hp -= active_stacks; 
        poison_tick = game_get_speed(gamespeed_fps); 
    }
    
    if (!instance_exists(obj_trungdoc)) {
        var ef = instance_create_layer(x, y, layer, obj_trungdoc);
        ef.target = id; 
    }
} else {
    poison_tick = game_get_speed(gamespeed_fps);
    if (instance_exists(obj_trungdoc)) {
        instance_destroy(obj_trungdoc);
    }
}

var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var move_speed = 5;

x += h * speed;
y += v * speed;