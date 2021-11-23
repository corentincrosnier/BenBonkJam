// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function src_collision_panic(_obj) {
	var obj_find = instance_place(x, y, _obj)
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