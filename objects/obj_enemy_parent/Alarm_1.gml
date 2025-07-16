//once alarm[1] runs, knockback state ends and enemy turn back white
image_blend = c_white;

//in case hp runs out, enemy is destroyed
if(hp<=0){
    instance_destroy();
    audio_play_sound(snd_monsterDeath, 0, false, 1, 0, random_range(0.8, 1.2));
    if(object_exists(obj_player))
        obj_player.add_xp(xp_value);
}