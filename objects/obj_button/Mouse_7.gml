switch(button_id){
    case 0: //resume case (button_id=0)
        obj_pause_manager.paused = false;
        window_set_cursor(cr_none);
        obj_pause_manager.update_pause();
    break;
    
    case 1: //settings
        layer_set_visible("PauseLayer", false); //we make the pause UI invisible
        layer_set_visible("SettingsLayer", true); //Settings UI visible
    break;
    
    case 2: //quit
        layer_set_visible("PauseLayer", false);
        audio_stop_sound(snd_rooms);
        room_goto(rm_menu);
    break;
    
    case 3: //Back from Settings
        layer_set_visible("PauseLayer", true);
        layer_set_visible("SettingsLayer", false);
    break;
    
    case 4: //Close settings from menu
        layer_set_visible("MenuSettingsLayer", false);
    break;
}