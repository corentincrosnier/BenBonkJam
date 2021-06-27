/// @description Insert description here

var delta_x = 0;
var delta_y = 0;

if (!side) {
	delta_x = keyboard_check(vk_left) - keyboard_check(vk_right);
	delta_y = keyboard_check(vk_down) - keyboard_check(vk_up);
	if (keyboard_check_pressed(vk_space)) {
		if (!grab_object) {
			if ((object_grabbed = instance_place(x, y, obj_p2_grab)) != noone) {
				grab_object = true;
			}
		}
	}
}

else {
	grab_object = false;
	object_grabbed = noone;
}

if(delta_x !=0 || delta_y != 0) {
	var Dir = point_direction(0, 0, delta_x, delta_y);
	var instAcc = (delta_time / ideal_delta_time) * acc;
	var xx_spd = lengthdir_x(instAcc, Dir);
	var yy_spd = lengthdir_y(instAcc, Dir);

	if (abs(x_speed) < max_speed || sign(x_speed) != sign(xx_spd))
		x_speed += xx_spd;
	if (abs(y_speed) < max_speed || sign(y_speed) != sign(yy_spd))
		y_speed += yy_spd;
}

if (grab_object) {
	x_speed -= x_speed * fric_grab;
	y_speed -= y_speed * fric_grab;
}

else {
	x_speed -= x_speed * fric;
	y_speed -= y_speed * fric;
}

if (place_meeting(x + x_speed, y, obj_collider2)) {
	while (!place_meeting(x + sign(x_speed), y, obj_collider2)) {
		x += sign(x_speed);
	}
	x_speed = 0;
}

x += x_speed;

if (place_meeting(x, y + y_speed, obj_collider2)) {
	while (!place_meeting(x, y + sign(y_speed), obj_collider2)) {
		y += sign(y_speed);
	}
	y_speed = 0;
}

y += y_speed;