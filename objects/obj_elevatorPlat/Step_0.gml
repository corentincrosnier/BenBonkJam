/// @description Insert description here
// You can write your code in this editor

if(state && !running) {
	x = path_begin_pos.x;
	y = path_begin_pos.y;
	path_start(pathId, spd, path_action, false);
	path_position = last_path_pos;
	path_positionprevious = last_path_pos;
	running = true;
	audio_play_sound(snd_elevator,1,true);
}

else if(!state && running) {
	audio_stop_sound(snd_elevator);
	show_debug_message(path_position);
	last_path_pos = path_position;
	path_end();
	running = false;
}
