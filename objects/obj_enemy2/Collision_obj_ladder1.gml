/// @desc Insert description here

if (!climbing) {
	if (src_ladder_verif(1)) {
		climbing = true;
		climbDir = 1;
	}

	else if (src_ladder_verif(-1)) {
		climbing = true;
		climbDir = -1;
	}
}