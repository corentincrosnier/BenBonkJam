/// @description Insert description here
// You can write your code in this editor


if (!grab_object && !is_capture) {
	show_debug_message(other);
	if (other.is_grabbed == false) {
		show_debug_message("COLLISION WITH BALL")
		grab_object = true;
		object_grabbed = other;
		audio_play_sound(snd_techNoise2, 1, true);
		is_capture = true;
		with (other) {
			is_grabbed = true;
			is_capture = true;
			is_physics = false;
		}
		alarm[0] = (room_speed / 5.0) * 7;
		image_speed = 1;
	}
}