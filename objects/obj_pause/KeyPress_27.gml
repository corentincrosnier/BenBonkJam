/// @description Insert description here
// You can write your code in this editor
if(pause){
	pause=false;
	instance_activate_all();
}
else{
	pause=true;
	instance_deactivate_all(true);
}