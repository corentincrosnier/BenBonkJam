/// @description Insert description here
// You can write your code in this editor
globalvar pause;
pause=false;

globalvar side;
side=true;

globalvar ideal_delta_time;
ideal_delta_time = 1000000 / room_speed;


audio_sound_gain(snd_puzzle1,3,0);
audio_sound_gain(snd_door,0.1,0);
audio_sound_gain(snd_techNoise2,15,0);
audio_sound_gain(snd_click1,0.6,0);
audio_sound_gain(snd_click2,0.6,0);
audio_sound_gain(snd_click3,0.6,0);
audio_sound_gain(snd_click4,0.6,0);
audio_sound_gain(snd_elevator,0.6,0);
audio_sound_gain(snd_teleport,1,0);
audio_sound_gain(snd_energyBall_F2,1,0);
audio_sound_gain(snd_energyBall2,1,0);
audio_sound_gain(snd_energyBall3,1,0);
audio_sound_gain(snd_energyBall4,1,0);
audio_sound_gain(snd_darkPluckDelay,1,0);

audio_play_sound(snd_puzzle1,1,true);


globalvar viewW;
globalvar viewH;
viewW=1280;
viewH=720;
resizedCam=false;

randomize();