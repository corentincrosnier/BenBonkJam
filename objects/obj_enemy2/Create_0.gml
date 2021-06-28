/// @desc Insert description here
spd=60;
climbSpeed = 2;
hsp=0;
vsp=0;
dir=0;
walkDir=choose(-1,1);
climbDir=0;
image_xscale=walkDir;
climbing=false;
climbCooldown=room_speed*5;
grv = 0.3*room_speed;
maxDist=100;
alarm[1]=random_range(1,3)*room_speed;