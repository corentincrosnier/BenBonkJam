/// @description Insert description here
// You can write your code in this editor

hmove = keyboard_check(vk_right) - keyboard_check(vk_left);

hsp = hmove * walk_speed;
vsp += grv;

if (place_meeting(x + hsp, y, obj_collider1)) {
	while (!place_meeting(x + sign(hsp), y, obj_collider1)) {
		x += sign(hsp);
	}
	hsp = 0;
}

if (place_meeting(x, y + vsp, obj_collider1)) {
	while (!place_meeting(x, y + sign(vsp), obj_collider1)) {
		y += sign(vsp);
	}
	vsp = 0;
}

x += hsp;
y += vsp;