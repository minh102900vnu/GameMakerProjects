var active_stacks = 0; 

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
        poison_tick = game_get_speed(gamespeed_fps) * 10; 
    }
} else {
    poison_tick = game_get_speed(gamespeed_fps) * 10;
}

//ĐÂY LÀ TƯƠNG TÁC VỚI CON 2SLIMES, KHÔNG CHỈNH SỬA