/// @description Insert description here
// You can write your code in this editor
	
gpu_set_blendenable(false);
if(side && alarm[0]<=fadeTime*room_speed/2){
	xPos=0;
	xScale=1;
	layer_set_visible("BackgroundA",true);
	layer_set_visible("TileDeckA",true);
	layer_set_visible("TileDecorA",true);
	layer_set_visible("TileDecorA2",true);
	layer_set_visible("BackgroundB",false);
	layer_set_visible("TileDeckB",false);
	layer_set_visible("TileDecorB",false);
	layer_depth("Distort", 2700);
	layer_depth("Blur", 2800);
	layer_depth("InstancesB", 2900);
	layer_depth("BackgroundA",3000);
	
	if(layer_exists("Rails_A"))
		layer_set_visible("Rails_A",true);
	if(layer_exists("Rails_B"))
		layer_set_visible("Rails_B",false);
	
	with (obj_box1)
		image_index = 0;
	with (obj_box2) {
		if (!is_grabbed)
			image_index = 1;
	}
	application_surface_draw_enable(true);
}

if(!side && alarm[0]<=fadeTime*room_speed/2){
	layer_set_visible("BackgroundA",false);
	layer_set_visible("TileDeckA",false);
	layer_set_visible("TileDecorA",false);
	layer_set_visible("TileDecorA2",false);
	layer_set_visible("BackgroundB",true);
	layer_set_visible("TileDeckB",true);
	layer_depth("TileDeckB", -2800);
	layer_depth("Distort", -2600);
	layer_depth("Blur", -2700);
	layer_depth("InstancesB", -2900);
	layer_depth("BackgroundB",3000);
	//layer_set_visible("TileDecorB",true);
	
	if(layer_exists("Rails_A"))
		layer_set_visible("Rails_A",false);
	if(layer_exists("Rails_B"))
		layer_set_visible("Rails_B",true);
	
	with (obj_box1)
		image_index = 1;
	with (obj_box2) {
		if (!is_grabbed)
			image_index = 1;
	}
	xScale=-1;
	xPos=window_get_width();
	application_surface_draw_enable(false);
}
draw_surface_ext(application_surface, xPos , 0, xScale*window_get_width()/viewW, window_get_height()/viewH, 0, c_white, 1);
gpu_set_blendenable(true);
