/// @desc ??

if(state && !switched){
	switched=true;
	audio_sound_pitch(snd_click4,random_range(0.7,1.2));
	audio_play_sound(snd_click4,1,false);
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
	audio_sound_pitch(snd_click4,random_range(0.7,1.2));
	audio_play_sound(snd_click4,1,false);
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
