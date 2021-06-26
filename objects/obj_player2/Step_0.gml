/// @description Insert description here

var delta_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var delta_y = keyboard_check(vk_down) - keyboard_check(vk_up);

if(delta_x !=0 || delta_y != 0) {
	var Dir = point_direction(0, 0, delta_x, delta_y);
	var instAcc = delta_time/60000*acc;
	var xx_spd = lengthdir_x(instAcc,Dir);
	var yy_spd = lengthdir_y(instAcc,Dir);

	if (abs(x_speed) < max_speed || sign(x_speed) != sign(xx_spd))
		x_speed += xx_spd;
	if (abs(y_speed) < max_speed || sign(y_speed) != sign(yy_spd))
		y_speed += yy_spd;
}

if (place_meeting(x + x_speed, y, obj_wall)) {
	while (!place_meeting(x + sign(x_speed), y, obj_wall)) {
		x += sign(x_speed);
	}
	x_speed = 0;
}

x += x_speed;

if (place_meeting(x, y + y_speed, obj_wall)) {
	while (!place_meeting(x, y + sign(y_speed), obj_wall)) {
		y += sign(y_speed);
	}
	y_speed = 0;
}

y += y_speed;