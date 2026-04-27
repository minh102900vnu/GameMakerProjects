if (!instance_exists(obj_nv)) { speed = 0; exit; }

var dan = instance_place(x, y, obj_dan);
if (dan != noone) {
    hp -= 1; 
    instance_destroy(dan); 
    if (hp <= 0) { instance_destroy(); exit; }
}

var dist_to_player = distance_to_object(obj_nv);
if (attack_cooldown > 0) attack_cooldown--;

switch (state) {
    case "wander":
        if (dist_to_player <= 300) {
            state = "chase"; 
        } else {
            if (wander_timer <= 0) {
                direction = random(360);
                speed = 0.3; 
                wander_timer = game_get_speed(gamespeed_fps) * 2; 
            } else {
                wander_timer--;
            }
            if (hspeed > 0) image_xscale = 1; else if (hspeed < 0) image_xscale = -1;
        }
        break;

    case "chase":
        speed = 0; 
        if (dist_to_player > 300) {
            state = "wander"; 
        } else {
            if (abs(obj_nv.x - x) > 2) {
                if (obj_nv.x > x) image_xscale = 1; else image_xscale = -1;
            }
            mp_potential_step(obj_nv.x, obj_nv.y, spd, false);
            
            // Chạm vào người thì bơm độc
            if (place_meeting(x, y, obj_nv) && attack_cooldown <= 0) {
                var thoi_gian_doc = game_get_speed(gamespeed_fps) * 20; // Trúng độc 20 giây
                array_push(obj_nv.poison_timers, thoi_gian_doc);
                
                attack_cooldown = game_get_speed(gamespeed_fps); 
                state = "retreat";
                retreat_timer = game_get_speed(gamespeed_fps) * 0.5; 
            }
        }
        break;

    case "retreat":
        if (abs(obj_nv.x - x) > 2) { 
            if (obj_nv.x > x) image_xscale = 1; else image_xscale = -1; 
        }
        if (retreat_timer > 0) {
            var dir_away = point_direction(obj_nv.x, obj_nv.y, x, y);
            x += lengthdir_x(spd, dir_away);
            y += lengthdir_y(spd, dir_away);
            retreat_timer--;
        } else {
            state = "chase";
        }
        break;
}