/// @description Insert description here
// You can write your code in this editor
alarm[1]=bubbleCooldown*room_speed;
if(random_range(0,99)<30){
	//with(instance_create_depth(x,y-14,depth,obj_bubble)){
	with(instance_create_depth(x,y,depth,obj_bubble)){
		callingObj=other;
	}
}