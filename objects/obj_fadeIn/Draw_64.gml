/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

var _alpha=(animcurve_channel_evaluate(animcurve_get_channel(ac_fadeIn, 0),alarm[0]/(fadeTime*room_speed))+1)/2;
//var _alpha=(fadeTime*room_speed-alarm[0])/(fadeTime*room_speed);
draw_set_alpha(_alpha);
draw_set_color(c_black);
draw_rectangle(0,0,480,270,false);
draw_set_alpha(1);
draw_set_color(c_black);
