/// @desc gravity

vsp += grv * (delta_time / ideal_delta_time);

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