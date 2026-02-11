/// @description Insert description here
// You can write your code in this editor


if follow != noone{
	xto = follow.x;
	yto = follow.y;
}

x += (xto - x)/2;
y += (yto - y)/2;

camera_set_view_pos(view_camera[0], x - (camwidth * 0.25), y -(camheight * 0.25));

