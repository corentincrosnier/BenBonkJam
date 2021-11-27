/// @description Insert description here
// You can write your code in this editor
var xPrime = 0;
var yPrime = 0;
var xElePrime = x;
var yElePrime = y;

if (abs(gravity_axis.y) > abs(gravity_axis.x)) {
	xPrime = x + sign(walkDir) * (abs(sprite_width) / 2 + 2);
	yPrime = y + sign(gravity_axis.y) * (abs(sprite_height) / 2 + 7);
	yElePrime = yPrime;
}
else {
	yPrime = y + sign(walkDir) * (abs(sprite_width) / 2 + 7);
	xPrime = x + sign(gravity_axis.x) * (abs(sprite_height) / 2 + 2);
	xElePrime = xPrime;
}

if (collision_point(xPrime, yPrime, obj_collider1, false, true) == noone) {
	if (collision_point(xElePrime, yElePrime, obj_elevator, false, true) != noone) {
		if (abs(gravity_axis.y) > abs(gravity_axis.x))
			x = xprevious;
		else
			y = yprevious;
		if (!elevatorDirChange) {
			elevatorDirChange = true;
			alarm[11] = (room_speed / 5) * 2;
		}
	}
	else
		walkDir = -walkDir;
}