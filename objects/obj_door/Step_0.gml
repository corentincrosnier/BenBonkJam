/// @description Insert description here
// You can write your code in this editor
if(state && !opened){
	audio_play_sound(snd_door,1,false);
	opened=true;
	closed=false;
	image_speed=1;
}
if(!state && !closed){
	audio_play_sound(snd_door,1,false);
	closed=true;
	opened=false;
	image_speed=-1;
}