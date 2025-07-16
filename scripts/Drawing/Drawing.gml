//function to draw a shadow that takes an optional parameter (0 by default)
function draw_shadow(_offset=0){
    draw_sprite_ext(spr_shadow, 0, x, y+_offset, 1, 1, 0, -1, 0.4)
}