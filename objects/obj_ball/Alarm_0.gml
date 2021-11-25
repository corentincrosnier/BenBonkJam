/// @description Insert description here
// You can write your code in this editor

if (is_dead == false) {
	if (is_grabbed)
		audio_stop_sound(snd_energyBall_F2);
	is_dead = true;
	audio_play_sound(snd_energyBall4, 1, false);
	sprite_index = spr_boule_strip11;
	image_speed = 1;
	image_index = 3;
	is_physics = false;
}