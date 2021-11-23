/// @description Insert description here
// You can write your code in this editor

var posx;
if(alarm[0]<=0){
	posx=0;
}
else{
	posx=alarm[0]/(fadeTime*room_speed);
}
var _alpha=(animcurve_channel_evaluate(animcurve_get_channel(ac_alphaCurve, 0),posx)+1)/2;
draw_set_alpha(_alpha);
draw_set_color(c_black);
draw_rectangle(0,0,viewW,viewH,false);
draw_set_alpha(1);
draw_set_color(c_black);

