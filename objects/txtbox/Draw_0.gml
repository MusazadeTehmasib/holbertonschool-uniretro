/// @description Insert description here
// You can write your code in this editor

confirm_key = keyboard_check_pressed(ord("A"));
skip = keyboard_check_pressed(ord("S"));
txtbox_x = camera_get_view_x(view_camera[0]);
txtbox_y = camera_get_view_y(view_camera[0])+ 148;
var emote = keyboard_check_pressed(ord("Z"))
var emote2 = keyboard_check_pressed(ord("X"))

if setup == false {
	
	setup = true;
	
	player_starlo.can_move = false;
	
	draw_set_font(Font1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	pagenum = array_length(text);
	for (var p = 0; p < pagenum; p++){
		text_length[p] = string_length(text[p]);
		text_x_offset[p] = 17;
	}
}


if draw_char < text_length[page]{
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

if confirm_key{
	player_starlo.move_spd = 0;
	if draw_char == text_length[page]{
		if page < pagenum - 1{
			page++
			draw_char = 0;
		}else {
			player_starlo.move_spd = 1;
			player_starlo.can_move = true;
			instance_destroy()
		}
	}
}else if skip and draw_char != text_length[page]{
	draw_char = text_length[page];	
}

txtbox_image += txtbox_image_spd;

txtbox_spr_w = sprite_get_width(spr_txtbox);
txtbox_spr_h = sprite_get_height(spr_txtbox);

draw_sprite_ext(spr_txtbox, txtbox_image, txtbox_x + text_x_offset[page], txtbox_y, txtboxW / txtbox_spr_w, txtboxH / txtbox_spr_h, 0, c_white, 1);

var draw_txt = string_copy(text[page], 1, draw_char);
draw_text_ext(txtbox_x + text_x_offset[page] + border, txtbox_y + border,draw_txt, linesep, lineW);