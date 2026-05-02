event_inherited();
if (!instance_exists(obj_nv)) { speed = 0; exit; }

var dan = instance_place(x, y, obj_dan);
if (dan != noone) {
    hp -= 1; 
    instance_destroy(dan); 
    if (hp <= 0) { exit; }
}

var dist_to_player = point_distance(x, y, obj_nv.x, obj_nv.y);
if (attack_cooldown > 0) attack_cooldown--;

switch (state) {
    case "wander":
        if (dist_to_player <= 400) {
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
        if (dist_to_player > 500) {
            state = "wander"; 
        } else {
            if (abs(obj_nv.x - x) > 2) {
                if (obj_nv.x > x) image_xscale = 1; else image_xscale = -1;
            }
            
            if (dist_to_player > 15) {
                if (dist_to_player > 60) {
                    mp_potential_step(obj_nv.x, obj_nv.y, spd, false);
                } else {
                    var dir_to = point_direction(x, y, obj_nv.x, obj_nv.y);
                    x += lengthdir_x(spd, dir_to);
                    y += lengthdir_y(spd, dir_to);
                }
            }
            
            if (dist_to_player <= 15 && attack_cooldown <= 0) {
                obj_nv.hp -= 1; 
                
                if (!instance_exists(obj_trungquai)) {
                    var ef = instance_create_layer(obj_nv.x, obj_nv.y, layer, obj_trungquai);
                    ef.target = obj_nv.id;
                }
                
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