/// @description Insert description here
// You can write your code in this editor
if(!climbing){

if(distance_to_object(obj_player1)<maxDist && abs(y-obj_player1.y)<=30){
	spd=70;
	dir=point_direction(x,y,obj_player1.x,obj_player1.y);
	hsp=lengthdir_x(spd/room_speed,dir);
}
else{
	spd=50;
	hsp=walkDir*spd/room_speed;
}

vsp+=grv/room_speed;
if (place_meeting(x + hsp, y, obj_collider1)){
	var otherEnemy=instance_place(x + hsp, y, obj_enemy1);
	if(otherEnemy!=noone)
		otherEnemy.walkDir*=-1;
	while (!place_meeting(x + sign(hsp), y, obj_collider1)) {
		x += sign(hsp);
	}
	if(distance_to_object(obj_player1)<maxDist && abs(y-obj_player1.y)<=30)
		hsp = 0;
	else{
		hsp*=-1;
		walkDir*=-1;
	image_xscale=walkDir;
	}
}
if (place_meeting(x, y + vsp, obj_collider1)){
	while (!place_meeting(x, y + sign(vsp), obj_collider1)) {
		y += sign(vsp);
	}
	vsp = 0;
}
x+=hsp;
y+=vsp;
}
else{
	
}