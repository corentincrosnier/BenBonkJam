/// @description Insert description here
// You can write your code in this editor

if (is_grabbed) {
	with (obj_player2) {
		grab_object = false;
		audio_stop_sound(snd_energyBall_F2);
		src_magnet_clean();
	}
}

if (!is_capture)
	instance_destroy(id, true);