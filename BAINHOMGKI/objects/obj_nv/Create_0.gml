hp = 100; 
max_hp = 100
hp_smooth = hp;
is_poisoned = false;
poison_timers = [];
poison_tick = game_get_speed(gamespeed_fps) * 2.5;
is_dead = false;
death_phase = 0; // 0 = sống, 1 = ngã, 2 = tan biến
is_attacking = false;