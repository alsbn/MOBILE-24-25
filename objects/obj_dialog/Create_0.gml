//messages array
messages = [];

//index of current message in the array (-1=dialogue hasn't started yet)
current_message = -1;

//number of characters having been drawn already
current_char = 0;

//variable that stores only the characters that need to be visible at one moment
draw_message = "";

char_speed = 0.5;
input_key = vk_space;

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

//to know when to switch to the next room
next_room = false;