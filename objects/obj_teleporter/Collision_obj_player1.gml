/// @desc ??

if(endTp && !collided){
	collided=true;
	instance_create_depth(0,0,0,obj_endRoomController);
	sprite_index = spr_teleporter_work;
	audio_play_sound(snd_teleport,1,false);
}