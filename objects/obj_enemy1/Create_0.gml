/// @description Insert description here
// You can write your code in this editor
spd=60;
hsp=0;
vsp=0;
dir=0;
walkDir=choose(-1,1);
image_xscale=walkDir;
climbing=false;
climbCooldown=room_speed*5;
grv = 0.3*room_speed;
maxDist=100;