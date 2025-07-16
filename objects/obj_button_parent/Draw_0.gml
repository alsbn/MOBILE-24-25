//button first draws itself
draw_self();

//we set the font
draw_set_font(fnt_ui);

//align the button to the hroizontal centre and vertical middle
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//we draw the text at the same position of the button
draw_text(x, y, button_text);

//we reset alignement to default (and font but we use the same)
draw_set_halign(fa_left);
draw_set_valign(fa_top);



