//we use end step so that when pressing spacebar to close the dialogue a new one isn't opened in the same fram

//dialogue hasn't started yet so we exit
if (current_message<0) exit;
    
var _str = messages[current_message].msg;

//check if message has been fully displayed
if(current_char<string_length(_str)){
    
    //increase number of characters drawn (faster if input key is being pressed)
    current_char += char_speed * (1 + keyboard_check(input_key));
    
    //message to be drawn, equal to the total string - the one already drawn
    draw_message = string_copy(_str, 0, current_char);
}
//if string has been drawn completely we want to move to the next message
else if (keyboard_check_pressed(input_key)){
    
    //move to the next message
	current_message++;
    
    //if we reach the end of the array the dialogue is over
    if(current_message>=array_length(messages)){
        instance_destroy();
        audio_stop_sound(snd_dialogue);
        if(next_room == true) room_goto_next();
    }
    //else we start the next message
    else {
    	current_char = 0;
    }
}