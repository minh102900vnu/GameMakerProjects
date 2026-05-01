var chet_slime = !instance_exists(obj_slime);
var chet_2slimes = !instance_exists(obj_2slimes);
var chet_mushroom = !instance_exists(obj_mushroom);
var chet_phantom = !instance_exists(obj_phantom);

if (chet_slime && chet_2slimes && chet_mushroom && chet_phantom) {
    
    if (victory_triggered == false) {
        victory_triggered = true; 
		global.game_ended = true; 
        
        
        instance_create_layer(0, 0, "Instances", obj_win);
    }
}