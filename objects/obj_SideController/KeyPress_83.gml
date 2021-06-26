/// @description Insert description here
// You can write your code in this editor

//side=(side)?false:true;
if(side){
	side=false;
	layer_set_visible("BackgroundA",false);
	layer_set_visible("BackgroundB",true);
	layer_set_visible("DecksA",false);
	layer_set_visible("DecksB",true);
	application_surface_draw_enable(false);
}
else{
	side=true;
	layer_set_visible("BackgroundA",true);
	layer_set_visible("BackgroundB",false);
	layer_set_visible("DecksA",true);
	layer_set_visible("DecksB",false);
	application_surface_draw_enable(true);
}