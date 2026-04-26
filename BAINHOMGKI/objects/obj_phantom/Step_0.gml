if (!instance_exists(obj_nv)) { speed = 0; exit; }

var dan = instance_place(x, y, obj_dan);
if (dan != noone) {
    hp -= 1; 
    instance_destroy(dan); 
    if (hp <= 0) { 
        instance_destroy(); 
        exit; 
    }
}

var dist_to_player = distance_to_object(obj_nv);

if (damage_cooldown > 0) damage_cooldown--;

switch(state) {
    case "wander":
        if (dist_to_player <= 150) {
            var rand_dir = random(360);
            var ban_kinh = 80; 
            
            x = obj_nv.x + lengthdir_x(ban_kinh, rand_dir);
            y = obj_nv.y + lengthdir_y(ban_kinh, rand_dir);
            
            chase_timer = game_get_speed(gamespeed_fps) * 15;
            retreat_timer = 0; 
            state = "chase";
        } else {
            if (wander_timer <= 0) {
                direction = random(360);
                speed = 0.3; 
                wander_timer = game_get_speed(gamespeed_fps) * 3; 
            } else {
                wander_timer--;
            }
            if (hspeed > 0) image_xscale = 1; 
            else if (hspeed < 0) image_xscale = -1;
        }
        break;

    case "chase":
        if (dist_to_player > 300) {
            speed = 0;
            hp = max_hp;      
            state = "wander"; 
        } 
        

        else if (chase_timer > 0) {
            chase_timer--; 
            
            if (abs(obj_nv.x - x) > 2) {
                if (obj_nv.x > x) image_xscale = 1; else image_xscale = -1;
            }
            
            
            if (retreat_timer > 0) {
                retreat_timer--;
                speed = 0; 
                var dir_away = point_direction(obj_nv.x, obj_nv.y, x, y);

                x += lengthdir_x(spd * 2, dir_away);
                y += lengthdir_y(spd * 2, dir_away);
            } 
            else {
                mp_potential_step(obj_nv.x, obj_nv.y, spd, false);
                
                if (place_meeting(x, y, obj_nv) && damage_cooldown <= 0) {
                    obj_nv.hp -= 2; 
                    
                    damage_cooldown = game_get_speed(gamespeed_fps) * 1.5; 

                    retreat_timer = game_get_speed(gamespeed_fps) * 0.5; 
                }
            }
        } 
        
        else {
            hp = max_hp; 
            state = "wander"; 
            
            var escape_dir = random(360);
            x = obj_nv.x + lengthdir_x(300, escape_dir); 
            y = obj_nv.y + lengthdir_y(300, escape_dir);
        }
        break;
}