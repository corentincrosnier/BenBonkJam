/// @desc ??

if (!as_activated) {
	instance_create_depth(x, y, -200, obj_endRoomController);
	with(obj_endRoomController)
		alarm[0]=fadeTime*room_speed;
}
as_activated = true;