/// @description Insert description here
// You can write your code in this editor
if(audio_group_is_loaded(audiogroup1) && !musicPlaying){
	audio_play_sound(snd_puzzle1,1,true);
	audio_group_load(audiogroup_default);
	musicPlaying=true;
}