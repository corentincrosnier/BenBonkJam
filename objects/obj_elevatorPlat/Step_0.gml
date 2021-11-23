/// @description Insert description here
// You can write your code in this editor

if(state && !running) {
	x = path_begin_pos.x;
	y = path_begin_pos.y;
	path_start(pathId, spd, path_action_reverse, false);
	path_position = last_path_pos;
	running = true;
}

else if(!state && running) {
	last_path_pos = path_position;
	path_end();
	running = false;
}