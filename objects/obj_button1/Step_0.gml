/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_player1) && !pressed){
	pressed=true;
	image_index=1;
	with(obj_door){
		if(buttonId==other.buttonId){
			state=(state)?false:true;
			image_index=(image_index+1)%2;
		}
	}
}
else{
	image_index=0;
	pressed=false;
}