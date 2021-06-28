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
	
	if (y_spd > 0) {
		with(instance_place(x,y - 4,obj_collider1)){
			y += other.y_spd;
		}
		with(instance_place(x,y - 4,obj_ennemy)){
			y += other.y_spd;
		}
	}
}