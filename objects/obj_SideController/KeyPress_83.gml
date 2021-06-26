/// @description Insert description here
// You can write your code in this editor

//side=(side)?false:true;
if(alarm[0]<=0){
	if(side){
		side=false;
		
	}
	else{
		side=true;
		//application_surface_draw_enable(true);
	}
	alarm[0]=fadeTime*room_speed;
}