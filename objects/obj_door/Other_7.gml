/// @description Insert description here
// You can write your code in this editor
if(state && opened){
	image_index=image_number-1;
	image_speed=0;
}
/*if(!state && !closed){
	image_index=image_number-2;
}*/
if(!state && closed){
	image_index=0;
	image_speed=0;
}