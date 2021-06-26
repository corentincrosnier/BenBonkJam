/// @description Insert description here
// You can write your code in this editor

var hmove = keyboard_check(vk_right) - keyboard_check(vk_left);
var vmove = keyboard_check(vk_down) - keyboard_check(vk_up);
var jump = keyboard_check_pressed(vk_space);

hsp = 0;

if (vmove != 0 && !climb_ladder) {
	climb_ladder = scr_ladder_verif(vmove);
	if (climb_ladder)
		show_debug_message("success");
}

if (!climb_ladder) {
	hsp = hmove * walk_speed * (delta_time / ideal_delta_time);
	vsp += grv * (delta_time / ideal_delta_time);
}

if (jump && place_meeting(x, y + 1, obj_collider1)) {
	vsp = -jump_speed;
	climb_ladder = false;
}

if (climb_ladder) {
	climb_ladder = src_ladder_climb(vmove, climb_speed);
	show_debug_message(vsp);
}

if (!climb_ladder) {
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
}

x += hsp;
y += vsp;