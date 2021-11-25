/// @desc gravity

if (!is_grabbed) {
	sprite_index = spr_box2;
	image_speed = 0;
	vsp += grv * (delta_time / ideal_delta_time);

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

	x += hsp;
	y += vsp;
}

else {
	sprite_index = spr_box2_grab;
	image_speed = 1;
	vsp = 0;
	hsp = 0;
}