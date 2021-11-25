/// @description Insert description here
// You can write your code in this editor

ball_offset = {x: -2, y: 0};
ball = noone;
as_spawn = false;

var angle = degtorad(image_angle);
var xPrime = cos(angle) * ball_offset.x - sin(angle) * ball_offset.y;
var yPrime = sin(angle) * ball_offset.x + cos(angle) * ball_offset.y;
ball_offset = {x: xPrime, y: yPrime};
alarm[0] = (room_speed / 5) * 8;