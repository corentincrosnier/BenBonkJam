// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function src_place_meeting(x, y, _obj) {
	if (variable_instance_exists(id, "is_physics") && !is_physics)
		return (false);
	var b_collide = false;
	var obj_inst = instance_place(x, y, _obj);

	if (obj_inst != noone) {
		with (obj_inst) {
			if (!variable_instance_exists(id, "is_physics") || is_physics) {
				b_collide = true;
				is_colliding = true;
			}
		}
		if (b_collide) {
			is_colliding = true;
			return (true);
		}
	}
	return (false);
}

function src_instance_place(x, y, _obj) {
	if (variable_instance_exists(id, "is_physics") && !is_physics)
		return (false);
	var obj_inst = instance_place(x, y, _obj);
	var b_collide = false;
	
	if (obj_inst != noone) {
		with (obj_inst) {
			if (!variable_instance_exists(id, "is_physics") || is_physics) {
				b_collide = true;
				is_colliding = true;
			}
			if (object_index == obj_ball) {
				show_debug_message("BALL");
				show_debug_message(self);
				show_debug_message(b_collide)
			}
		}
		if (b_collide) {
			is_colliding = true;
			return (obj_inst);
		}
	}
	return (noone);
}

function src_place_meeting_elevator(x, y) {
	if (variable_instance_exists(id, "is_physics") && !is_physics)
		return (noone);
	var b_collide = false;
	var obj_inst = instance_place(x, y, obj_elevator);
	if (obj_inst != noone) {
		with (obj_inst) {
			if (is_physics) {
				is_colliding = true;
				b_collide = true;
			}
		}
		if (b_collide) {
			is_colliding = true;
			return (obj_inst.is_elevator);
		}
	}
	return (false);
}


function src_collision_panic(_obj) {
	if (variable_instance_exists(id, "is_physics") && !is_physics)
		return (noone);
	var obj_find = src_instance_place(x, y, _obj)
	if(obj_find != noone) {
		for(var i=0; i<1000; i++){
			if(!src_place_meeting(x+i,y,_obj)){
				x+=i;
				break;
			}
			if(!src_place_meeting(x-i,y,_obj)){
				x-=i;
				break;
			}
			if(!src_place_meeting(x,y+i,_obj)){
				y+=i;
				break;
			}
			if(!src_place_meeting(x,y-i,_obj)){
				y-=i;
				break;
			}
			if(!src_place_meeting(x+i,y+i,_obj)){
				x+=i;
				y+=i;
				break;
			}
			if(!src_place_meeting(x+i,y-i,_obj)){
				x+=i;
				y-=i;
				break;
			}
			if(!src_place_meeting(x-i,y+i,_obj)){
				x-=i;
				y+=i;
				break;
			}
			if(!src_place_meeting(x-i,y-i,_obj)){
				x-=i;
				y-=i;
				break;
			}
		}
	}
	return (obj_find);
}