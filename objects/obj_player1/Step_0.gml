/// @description Insert description here
// You can write your code in this editor

var hmove = 0;
var vmove = 0;
var jump = 0;
var use = 0;

if (is_dead || killX != 0) {
	x += killX;
	sprite_index = spr_player1Hit;
	image_xscale = killX;
	exit;
}

if (side) {
	hmove = keyboard_check(vk_right) - keyboard_check(vk_left) + keyboard_check(ord("D")) - keyboard_check(ord("A"));
	vmove = keyboard_check(vk_down) - keyboard_check(vk_up) + keyboard_check(ord("S")) - keyboard_check(ord("W"));
	var jump = keyboard_check_pressed(vk_space);
	var use = keyboard_check_pressed(ord("E"));
	var use = keyboard_check_pressed(ord("E"));
}

if (keyboard_check(ord("E")) == 0 && use_button != noone) {
	with(use_button)
		used = false;
}

hsp = 0;

if (vmove != 0 && !climb_ladder) {
	climb_ladder = src_ladder_verif(vmove);
	if (climb_ladder) {
		sprite_index = spr_player1Climb;
	}
}

if (!climb_ladder) {
	if (hmove != 0) {
		image_speed = 1;
		sprite_index = spr_player1Walk;
		image_xscale = -hmove;
	}
		
	else{
		sprite_index = spr_player1Idle;
		image_speed = 1;
	}

	hsp = hmove * walk_speed * (delta_time / ideal_delta_time);
	vsp += grv * (delta_time / ideal_delta_time);

	if (!src_place_meeting(x, y + 1, obj_collider1) && !src_place_meeting_elevator(x, y + 4)) {
		sprite_index = spr_player1jump;
		if (vsp < -2)
			image_index = 0;
		else if (vsp > 2)
			image_index = 2;
		else
			image_index = 1;
	}
}

if (jump && src_place_meeting(x, y + 1, obj_collider1)) {
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
}

if (!climb_ladder) {
	src_collision_panic(obj_collider1);
	if (src_place_meeting(x + hsp, y, obj_collider1)) {
		while (!place_meeting(x + sign(hsp), y, obj_collider1)) {
			x += sign(hsp);
		}
		hsp = 0;
	}

	if (src_place_meeting(x, y + vsp, obj_collider1)) {
		while (!place_meeting(x, y + sign(vsp), obj_collider1)) {
			y += sign(vsp);
		}
		vsp = 0;
	}

	if (use){
		with (src_instance_place(x, y, obj_usable)) {
			if (usable_by_player && layer == layer_get_id("Instances"))
				state = !state;
		}
		var _button = src_instance_place(x, y, obj_pushButton1);
		with (_button) {
			if (layer == layer_get_id("Instances")) {
				used = true;
				other.use_button = _button;
			}
		}
	}
}

x += hsp;
y += vsp;