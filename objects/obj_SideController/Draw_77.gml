/// @description Insert description here
// You can write your code in this editor
gpu_set_blendenable(false);
draw_surface_ext(application_surface, window_get_width() , 0, -window_get_width()/480, window_get_height()/270, 0, c_white, 1);
gpu_set_blendenable(true);