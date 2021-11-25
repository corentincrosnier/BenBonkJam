/// @description Insert description here
// You can write your code in this editor
if (as_spawn && !instance_exists(ball)) {
	as_spawn = false;
	alarm[0] = (room_speed / 5) * 8;
	image_index = 0;
	image_speed = 1;
}