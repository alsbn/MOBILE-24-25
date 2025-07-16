//position of the dialogue box
var _dx = 0;
var _dy = gui_h * 0.7; //70% of the way down vertically

//size of the dialogue box
var _boxw = gui_w;
var _boxh = gui_h - _dy;

draw_sprite_stretched(spr_box, 0, _dx, _dy, _boxw, _boxh);

//position where the name will be drawn
_dx += 16;
_dy += 16;

draw_set_font(fnt_ui);

var _name = messages[current_message].name;
draw_set_color(global.char_colors[$ _name]); //to draw name in the correct color
draw_text(_dx, _dy, _name);
draw_set_color(c_white);

//text position
_dy += 40;

//draw the text and limit it to the width of the box minus a margin
draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx*2);

