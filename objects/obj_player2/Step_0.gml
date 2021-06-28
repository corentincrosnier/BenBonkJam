/// @description Insert description here

var delta_x = 0;
var delta_y = 0;
var use = 0;

if (!side) {
	delta_x = keyboard_check(vk_left) - keyboard_check(vk_right);
	delta_y = keyboard_check(vk_down) - keyboard_check(vk_up);
	use = keyboard_check_pressed(ord("E"));
	if (keyboard_check_pressed(vk_space)) {
		if (!grab_object) {
			object_grabbed = instance_place(x, y, obj_p2_grab);
			if (object_grabbed != noone) {
				grab_object = true;
				with (object_grabbed) {
					is_grabbed = true;
					x = other.x - other.sprite_width / 2 - sprite_width / 2;
					y = other.y;
					src_collision_panic(obj_collider1);
					src_collision_panic(obj_ennemy);
				}
			}
		}
		else {
			grab_object = false;
			if (object_grabbed != noone) {
				with (object_grabbed)
					is_grabbed = false;
				object_grabbed = noone;
			}
		}
	}
}

else {
	grab_object = false;
	if (object_grabbed != noone) {
		with (object_grabbed)
			is_grabbed = false;
		object_grabbed = noone;
	}
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

	with (object_grabbed) {
		src_collision_panic(obj_collider1);
		src_collision_panic(obj_ennemy);
		if (place_meeting(x + other.x_speed, y, obj_collider1) || place_meeting(x + other.x_speed, y, obj_ennemy)) {
			while (!place_meeting(x + sign(other.x_speed), y, obj_collider1) && !place_meeting(x + sign(other.x_speed), y, obj_ennemy)) {
				x += sign(other.x_speed);
				other.x += sign(other.x_speed);
			}
			other.x_speed *= -bounce_ratio;
			other.bounce_first_frameX = true;
		}
		else
			x += other.x_speed;
		if (place_meeting(x, y + other.y_speed, obj_collider1) || place_meeting(x, y + other.y_speed, obj_ennemy)) {
			while (!place_meeting(x, y + sign(other.y_speed), obj_collider1) && !place_meeting(x, y + sign(other.y_speed), obj_ennemy)) {
				y += sign(other.y_speed);
				other.y += sign(other.y_speed);
			}
			other.y_speed *= -bounce_ratio;
			other.bounce_first_frameY = true;
		}
		else
			y += other.y_speed;
	}
}

else {
	if (use) {
		with (instance_place(x, y, obj_usable))
			if (layer == layer_get_id("InstancesB"))
				state = !state;
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
