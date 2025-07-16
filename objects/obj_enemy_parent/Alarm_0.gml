//check if player exists and is within range of the enemy
if(instance_exists(obj_player) && distance_to_object(obj_player)<distance_to_player){
    target_x = obj_player.x;
    target_y = obj_player.y;
}
//if not, then move to a random point within range
else {
	target_x = random_range(xstart-100, xstart+100);
    target_y = random_range(ystart-100, ystart+100);
}

//recall alarm[0] to create a loop every 60 frames (1 sec)
alarm[0] = 60;