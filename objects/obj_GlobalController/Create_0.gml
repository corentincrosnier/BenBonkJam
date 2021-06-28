/// @description Insert description here
// You can write your code in this editor
globalvar pause;
pause=false;

globalvar side;
side=true;

globalvar ideal_delta_time;
ideal_delta_time = 1000000 / room_speed;

audio_sound_gain(snd_puzzle1,2,0);
audio_sound_gain(snd_door,0.1,0);
audio_sound_gain(snd_techNoise2,15,0);
audio_play_sound(snd_puzzle1,1,true);

randomize();