//collision event with obj_attack

//if alarm[1]<0 then enemy hasn't received knockback/been attacked
if (alarm[1]<0){
    
    //reduce enemy's hp by obj_attack(other)'s damage
    hp-= other.damage;
    
    //turn enemy red after being hit
    image_blend = c_red;
    
    //knockback direction
    kb_x = sign(x - other.x);
    kb_y = sign(y - other.y);
    
    //knockback will last 20 frames
    alarm[1] = 20;
}