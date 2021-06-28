/// @desc Insert description here

if (!climbing && canClimb && instance_exists(obj_player1)) {
	if (src_ladder_verif(1)) {
		if (sign(obj_player1.y - y) == 1) {
			climbing = true;
			climbDir = 1;
			canClimb = false;
			alarm[0] = climbCooldown;
		}
	}

	else if (src_ladder_verif(-1)) {
		if (sign(obj_player1.y - y) == -1) {
			climbing = true;
			climbDir = -1;
			canClimb = false;
			alarm[0] = climbCooldown;
		}
	}
}