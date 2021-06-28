/// @description Insert description here
// You can write your code in this editor

var hmove = 0;
var vmove = 0;
var jump = 0;
var use = 0;

if (killX != 0) {
	x += killX;
	sprite_index = spr_player1Hit;
	image_xscale = killX;
	exit;
}

if (side) {
	var hmove = keyboard_check(vk_right) - keyboard_check(vk_left);
	var vmove = keyboard_check(vk_down) - keyboard_check(vk_up);
	var jump = keyboard_check_pressed(vk_space);
	var use = keyboard_check_pressed(ord("E"));
}

hsp = 0;

if (vmove != 0 && !climb_ladder) {
	climb_ladder = scr_ladder_verif(vmove);
	if (climb_ladder) {
		sprite_index = spr_player1Climb;
	}
}

if (!climb_ladder) {
	if (hmove != 0) {
		image_speed = 1;
		sprite_index = spr_player1Walk;
		image_xscale = -hmove
	}
		
	else
		sprite_index = spr_player1Idle;
	hsp = hmove * walk_speed * (delta_time / ideal_delta_time);
	vsp += grv * (delta_time / ideal_delta_time);

	if (!place_meeting(x, y + 1, obj_collider1)) {
		sprite_index = spr_player1jump;
		if (vsp < -2)
			image_index = 0;
		else if (vsp > 2)
			image_index = 2;
		else
			image_index = 1;
	}
}

if (jump && place_meeting(x, y + 1, obj_collider1)) {
	vsp = -jump_speed;
	climb_ladder = false;
	sprite_index = spr_player1jump;
	image_index = 0;
}

if (climb_ladder) {
	if (image_speed == 0 && vmove != 0)
		image_index += vmove;
	image_speed = vmove * 2;
	climb_ladder = src_ladder_climb(vmove, climb_speed);
	show_debug_message(vsp);
}

if (!climb_ladder) {
	src_collision_panic(obj_collider1);
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

	if (use){
		with (instance_place(x, y, obj_usable))
			if (layer == layer_get_id("Instances"))
				state = !state;
	}
}

x += hsp;
y += vsp;