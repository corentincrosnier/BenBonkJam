/// @desc ??

if(state && !switched){
	switched=true;
	image_index=1;
	with(obj_door){
		if(leverId==other.leverId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
	with(obj_elevatorPlat){
		if(leverId==other.leverId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
}

else if(!state && switched){
	switched=false;
	image_index=0;
	with(obj_door){
		if(leverId==other.leverId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
	with(obj_elevatorPlat){
		if(leverId==other.leverId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
}
