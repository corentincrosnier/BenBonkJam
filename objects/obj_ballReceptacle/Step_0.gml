/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

var image_index_save = image_index;
event_inherited();
image_index = image_index_save;

if (grab_object)
	src_follow_magnet(x + magnet_offset.x, y + magnet_offset.y, object_grabbed, false);