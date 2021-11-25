/// @description Insert description here
// You can write your code in this editor
event_inherited();

magnet_offset = {x: 15, y: 0};
ball = noone;
as_spawn = false;
image_speed = 0;
usable_by_player = false;

grab_object = false;
object_grabbed = noone;
magnet_radius = 70;
magnet_radius_max = 100;
follow_speed = 0.002;
is_capture = false;

var angle = degtorad(image_angle);
var xPrime = cos(angle) * magnet_offset.x - sin(angle) * magnet_offset.y;
var yPrime = sin(angle) * magnet_offset.x + cos(angle) * magnet_offset.y;
magnet_offset = {x: xPrime, y: -yPrime};
show_debug_message(magnet_offset);