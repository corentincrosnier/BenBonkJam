/// @description Insert description here
// You can write your code in this editor
if(side && alarm[0]<=fadeTime*room_speed/2){
	xPos=0;
	xScale=1;
	layer_set_visible("BackgroundA",true);
	layer_set_visible("BackgroundB",false);
	layer_set_visible("DecksA",true);
	layer_set_visible("DecksB",false);
	application_surface_draw_enable(true);
	exit;
}
gpu_set_blendenable(false);
if(!side && alarm[0]<=fadeTime*room_speed/2){
	layer_set_visible("BackgroundA",false);
	layer_set_visible("BackgroundB",true);
	layer_set_visible("DecksA",false);
	layer_set_visible("DecksB",true);
	xScale=-1;
	xPos=window_get_width();
	application_surface_draw_enable(false);
}
draw_surface_ext(application_surface, xPos , 0, xScale*window_get_width()/480, window_get_height()/270, 0, c_white, 1);
gpu_set_blendenable(true);
