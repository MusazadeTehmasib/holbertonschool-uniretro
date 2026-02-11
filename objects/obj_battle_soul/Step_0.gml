/// @description Insert description here
// You can write your code in this editor

right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);


xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

if (place_meeting(x + xspd, y, owall)) {
        xspd = 0;
    }
if (place_meeting(x, y + yspd, owall)) {
        yspd = 0;
    }

    // Setting sprite based on movement direction


    // Controlling animation speed
    if (xspd != 0 || yspd != 0) {
        image_speed = 1;  // Play animation
    } else {
        image_index = 0;
        image_speed = 0;  // Stop animation
    }

    // Update position
    x += xspd;
    y += yspd;