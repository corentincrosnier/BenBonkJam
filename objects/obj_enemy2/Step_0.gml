/// @desc Insert description here

if (!climbing) {
	sprite_index = spr_enemy2_2;
	if (instance_exists(obj_player1) && !obj_player1.is_dead && distance_to_object(obj_player1)<maxDist && abs(y-obj_player1.y)<=30){
		spd=70;
		dir=point_direction(x,y,obj_player1.x,obj_player1.y);
		hsp=lengthdir_x(spd/room_speed,dir);
		if (distance_to_object(obj_player1) < hitDist) {
			sprite_index = spr_enemy2Hit_2;
		}
		image_xscale=sign(hsp);
	}
	else {
		spd=50;
		hsp=walkDir*spd/room_speed;
		image_xscale=walkDir;
	}

	vsp+=grv/room_speed;
	if (!src_place_meeting(x, y, obj_player1))
		src_collision_panic(obj_collider1);
	src_collision_panic(obj_enemy);
	src_collision_panic(obj_wallEnemy);
	if ((!src_place_meeting(x + hsp, y, obj_player1)) && (src_place_meeting(x + hsp, y, obj_collider1) || src_place_meeting(x + hsp, y, obj_enemy) || src_place_meeting(x + hsp, y, obj_wallEnemy))){
		var otherEnemy=instance_place(x + hsp, y, obj_enemy);
		if(otherEnemy!=noone)
			otherEnemy.walkDir*=-1;
		while (!place_meeting(x + sign(hsp), y, obj_collider1) && !place_meeting(x + sign(hsp), y, obj_enemy) && !place_meeting(x + sign(hsp), y, obj_wallEnemy)) {
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
	if (src_place_meeting(x, y + vsp, obj_collider1) || place_meeting(x, y + vsp, obj_enemy) || place_meeting(x, y + vsp, obj_wallEnemy)){
		while (!place_meeting(x, y + sign(vsp), obj_collider1) && !place_meeting(x, y + sign(vsp), obj_enemy) && !place_meeting(x, y + sign(vsp), obj_wallEnemy)) {
			y += sign(vsp);
		}
		vsp = 0;
	}
}

else {
	sprite_index = spr_enemy2Climb_2;
	hsp = 0;
	climbing = src_ladder_climb(climbDir, climbSpeed);
}

x+=hsp;
y+=vsp;