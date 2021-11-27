/// @description Insert description here
// You can write your code in this editor
//audio_stop_all();
/*
if(room==Story){
	viewW=640;
	viewH=360;
	surface_resize(application_surface,viewW,viewH);
	resizedCam=true;
}
*/

if(room!=Story){
	audio_group_stop_all(audiogroup_default);
}
