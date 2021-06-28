/// @description Insert description here
// You can write your code in this editor

if(vertical && state){
	if(forward){
		y_spd=-spd;
		if(y+y_spd<minY){
			forward=false;
			y=minY;
			y_spd=0;
		}
	}
	else{
		y_spd=spd;
		if(y+y_spd>maxY){
			forward=true;
			y=maxY;
			y_spd=0;
		}
	}
	y+=y_spd;
	if(place_meeting(x,y+2*sign(y_spd),obj_player1)){
		//obj_player1.y+=y_spd;
	}
}