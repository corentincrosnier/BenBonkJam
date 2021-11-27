/// @desc Insert description here
event_inherited();

spd=60;
climbSpeed = 1.3;
hsp=0;
vsp=0;
dir=0;
//walkDir=choose(-1,1);
climbDir=0;
image_xscale=walkDir;
climbing=false;
canClimb=true;
climbCooldown=room_speed*5;
grv = 0.3*room_speed;
maxDist=100;
hitDist=15;
alarm[1]=random_range(1,3)*room_speed;