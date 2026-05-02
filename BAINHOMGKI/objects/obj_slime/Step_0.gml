event_inherited();
if (!instance_exists(obj_nv)) { speed = 0; exit; }

var dan = instance_place(x, y, obj_dan);
if (dan != noone) {
    hp -= 1; 
    instance_destroy(dan); 
    if (hp <= 0) { exit; }
}

var dist_to_player = distance_to_object(obj_nv);

if (shoot_cooldown > 0) shoot_cooldown--;

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

            if (dist_to_player <= 60 && shoot_cooldown <= 0) {
                var bullet = instance_create_layer(x, y, layer, obj_slimebullet);
                bullet.direction = point_direction(x, y, obj_nv.x, obj_nv.y);
                bullet.speed = 3; 
                shoot_cooldown = game_get_speed(gamespeed_fps) * 2;
            } 
            else {
                mp_potential_step(obj_nv.x, obj_nv.y, spd, false);
            }
        }
        break;
}