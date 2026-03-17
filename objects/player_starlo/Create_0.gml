/// @description Insert description here
// You can write your code in this editor

xspd = 0;
yspd = 0;

move_spd = 3;

if (os_browser != browser_not_a_browser) {
    move_spd = 6; // speed in browser
}

can_move = true;

right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
emote_key = keyboard_check_pressed(ord("z"));

sitting = false; // player starts standing

