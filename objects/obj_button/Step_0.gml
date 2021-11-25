/// @description Insert description here
// You can write your code in this editor
if((place_meeting(x,y,obj_player1) || place_meeting(x,y,obj_box1) || place_meeting(x,y,obj_box2)) && !pressed){
	pressed=true;
	audio_sound_pitch(snd_click1,random_range(0.6,0.8));
	audio_play_sound(snd_click1,1,false);
	image_index=1;
	with(obj_door){
		if(buttonId==other.buttonId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
}
else if((!place_meeting(x,y,obj_player1) && !place_meeting(x,y,obj_box1) && !place_meeting(x,y,obj_box2)) && pressed){
	image_index=0;
	pressed=false;
	audio_sound_pitch(snd_click1,random_range(0.6,0.8));
	audio_play_sound(snd_click1,1,false);
	with(obj_door){
		if(buttonId==other.buttonId){
			state=(state)?false:true;
			//image_index=(image_index+1)%2;
		}
	}
}