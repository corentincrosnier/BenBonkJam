function src_ladder_verif(_vmove) {
	if (position_meeting(x, y + sprite_height / 2 - 1, obj_ladder1)) {
		if (_vmove == 1 && ((!instance_position(x, y + sprite_height / 2 + 1, obj_collider1))
			|| (!position_meeting(x, y, obj_ladder1))))
			return (true);
		if (_vmove == -1 && position_meeting(x, y, obj_ladder1))
			return (true);
	}
	return (false);
}

function src_ladder_climb(_vmove, _climb_speed) {
	if (place_meeting(x, y, obj_ladder1)) {
		vsp = _vmove * _climb_speed * (delta_time / ideal_delta_time);
		if (_vmove == 1 && position_meeting(x, y + sprite_height / 2 + vsp, obj_collider1)
			&& (position_meeting(x, y, obj_ladder1))) {
			while (!place_meeting(x, y + sign(vsp), obj_collider1)) {
				y += sign(vsp);
			}
			vsp = 0;
			return (false);
		}
		return (true);
	}
	return (false);
}