/// @desc Insert description here
/// @description Insert description here
// You can write your code in this editor

if(!pressed && used){
	pressed=true;
	image_index=1;
	with(obj_door){
		if(buttonId==other.buttonId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
	with(obj_elevatorPlat){
		if(buttonId==other.buttonId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
}

else if(pressed && !used){
	image_index=0;
	pressed=false;
	with(obj_door){
		if(buttonId==other.buttonId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
	with(obj_elevatorPlat){
		if(buttonId==other.buttonId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
}