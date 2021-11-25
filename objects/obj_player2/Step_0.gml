/// @description Insert description here

var delta_x = 0;
var delta_y = 0;
var use = 0;

if (!side) {
	delta_x = keyboard_check(vk_left) - keyboard_check(vk_right) + keyboard_check(ord("A")) - keyboard_check(ord("D"));
	delta_y = keyboard_check(vk_down) - keyboard_check(vk_up) + keyboard_check(ord("S")) - keyboard_check(ord("W"));
	use = keyboard_check_pressed(ord("E"));

	var _closest_grab_obj = noone;
	src_magnet_range_reset();
	if (!grab_object) {
		_closest_grab_obj = src_grab_range_show(x + magnet_relx, y + magnet_rely, magnet_radius);
	}

	if (keyboard_check_pressed(vk_space)) {
		if (!grab_object) {
			object_grabbed = _closest_grab_obj;
			show_debug_message(_closest_grab_obj);
			if (object_grabbed != noone) {
				grab_object = true;
				audio_play_sound(snd_techNoise2, 1, true);
				with (object_grabbed)
					is_grabbed = true;
			}
		}
		else {
			grab_object = false;
			audio_stop_sound(snd_techNoise2);
			with (object_grabbed)
				is_grabbed = false;
			object_grabbed = noone;
		}
	}
}

else {
	if (grab_object && object_grabbed.object_index != obj_ball) {
		grab_object = false;
		audio_stop_sound(snd_techNoise2);
		src_magnet_clean();
	}
}

if (keyboard_check(ord("E")) == 0 && use_button != noone) {
	with(use_button)
		used = false;
}

if(delta_x !=0 || delta_y != 0) {
	if (bounce_first_frameX && delta_x != 0)
		x_speed = 0;
	if (bounce_first_frameY && delta_y != 0)
		y_speed = 0;
	var Dir = point_direction(0, 0, delta_x, delta_y);
	var instAcc = (delta_time / ideal_delta_time) * acc;
	var xx_spd = lengthdir_x(instAcc, Dir);
	var yy_spd = lengthdir_y(instAcc, Dir);

	if (abs(x_speed) < max_speed || sign(x_speed) != sign(xx_spd))
		x_speed += xx_spd;
	if (abs(y_speed) < max_speed || sign(y_speed) != sign(yy_spd))
		y_speed += yy_spd;
}

other.bounce_first_frameX = false;
other.bounce_first_frameY = false;

if (grab_object) {
	x_speed -= x_speed * fric_grab;
	y_speed -= y_speed * fric_grab;
	
	src_follow_magnet(x + magnet_relx, y + magnet_rely, object_grabbed, true);
}

else {
	if (use) {
		with (usable_by_player && instance_place(x, y, obj_usable))
			if (layer == layer_get_id("InstancesB"))
				state = !state;
		var _button = instance_place(x, y, obj_pushButton1);
		with (_button) {
			if (layer == layer_get_id("InstancesB")) {
				used = true;
				other.use_button = _button;
			}
		}
	}
	x_speed -= x_speed * fric;
	y_speed -= y_speed * fric;
}

if (place_meeting(x + x_speed, y, obj_collider2)) {
	while (!place_meeting(x + sign(x_speed), y, obj_collider2)) {
		x += sign(x_speed);
	}
	x_speed = 0;
}

if (!bounce_first_frameX)
	x += x_speed;

if (place_meeting(x, y + y_speed, obj_collider2)) {
	while (!place_meeting(x, y + sign(y_speed), obj_collider2)) {
		y += sign(y_speed);
	}
	y_speed = 0;
}

if (!bounce_first_frameY)
	y += y_speed;

src_collision_panic(obj_collider2);