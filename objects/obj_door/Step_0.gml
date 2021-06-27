/// @description Insert description here
// You can write your code in this editor
if(state && !opened){
	opened=true;
	closed=false;
	image_speed=1;
}
if(!state && !closed){
	closed=true;
	opened=false;
	image_speed=-1;
}