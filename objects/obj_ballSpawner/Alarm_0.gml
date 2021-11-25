/// @description Insert description here
// You can write your code in this editor

ball = instance_create_layer(x + ball_offset.x, y + ball_offset.y, "Instances", obj_ball);
audio_play_sound(snd_energyBall2, 1, false);
as_spawn = true;

image_index = 0;
image_speed = 0;