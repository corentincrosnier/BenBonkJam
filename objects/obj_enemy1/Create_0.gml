/// @description Insert description here
// You can write your code in this editor
event_inherited();

spd=40;
hsp=0;
vsp=0;
dir=0;
walkDir=choose(-1,1);
image_xscale=walkDir;
climbing=false;
climbCooldown=room_speed*5;
grv = 0.3*room_speed;
maxDist=100;
maxDist_y=60;
bubbleCooldown=5;
alarm[1]=random_range(1,3)*room_speed;