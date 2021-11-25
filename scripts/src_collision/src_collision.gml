// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function src_place_meeting(x, y, _obj) {
	obj_inst = instance_place(x, y, _obj);
	if (obj_inst != noone) {
		is_colliding = true;
		with (obj_inst) {
			is_colliding = true;
		}
		return (true);
	}
	return (false);
}

function src_instance_place(x, y, _obj) {
	obj_inst = instance_place(x, y, _obj);
	if (obj_inst != noone) {
		is_colliding = true;
		with (obj_inst) {
			is_colliding = true;
		}
	}
	return (obj_inst);
}

function src_place_meeting_elevator(x, y) {
	obj_inst = instance_place(x, y, obj_elevator);
	if (obj_inst != noone) {
		is_colliding = true;
		with (obj_inst) {
			is_colliding = true;
		}
		return (obj_inst.is_elevator);
	}
	return (false);
}


function src_collision_panic(_obj) {
	var obj_find = src_instance_place(x, y, _obj)
	if(obj_find != noone) {
		for(var i=0; i<1000; i++){
			if(!place_meeting(x+i,y,_obj)){
				x+=i;
				break;
			}
			if(!place_meeting(x-i,y,_obj)){
				x-=i;
				break;
			}
			if(!place_meeting(x,y+i,_obj)){
				y+=i;
				break;
			}
			if(!place_meeting(x,y-i,_obj)){
				y-=i;
				break;
			}
			if(!place_meeting(x+i,y+i,_obj)){
				x+=i;
				y+=i;
				break;
			}
			if(!place_meeting(x+i,y-i,_obj)){
				x+=i;
				y-=i;
				break;
			}
			if(!place_meeting(x-i,y+i,_obj)){
				x-=i;
				y+=i;
				break;
			}
			if(!place_meeting(x-i,y-i,_obj)){
				x-=i;
				y-=i;
				break;
			}
		}
	}
	return (obj_find);
}