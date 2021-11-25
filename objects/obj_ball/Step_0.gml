/// @desc gravity
if (is_colliding && is_physics && !is_capture)  {
	alarm[0] = 1;
}

if (!is_dead && !is_capture) {
	if (!is_grabbed && is_physics) {
		sprite_index = spr_boule_strip11;
		image_speed = 1;
		if (image_index >= 3)
			image_index = 0;
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

	else if (is_grabbed){
		is_physics = true;
		sprite_index = spr_boule_strip11;
		image_speed = 1;
		if (image_index >= 3)
			image_index = 0;
		vsp = 0;
		hsp = 0;
	}

	else {
		sprite_index = spr_boulespawn_strip4;
		image_speed = 1;
	}
}

if (is_dead == true && !is_capture) {
	if (image_index < 3) {
		image_index = 10;
		if (!is_capture)
			alarm[1] = 1;
	}
}

else if (is_capture) {
	image_speed = 1;
	if (image_index >= 3)
		image_index = 0;
}