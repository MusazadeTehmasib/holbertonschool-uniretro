
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
var emote = keyboard_check_pressed(ord("Z"))
var emote2 = keyboard_check_pressed(ord("X"))

xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;


if (!variable_global_exists("is_emoting")) {
    global.is_emoting = false;
}


// Handle emote state
if (emote && !global.is_emoting) {
    global.is_emoting = true;
    sprite_index = ow_starlo_emote;
    image_speed = 1;
    image_index = 0; // Start the emote animation from the first frame
}

if (emote2 && !global.is_emoting) {
    global.is_emoting = true;
    sprite_index = ow_starlo_emote2;
	player_starlo.x -= 14;
    image_speed = 1;
    image_index = 0;
    global.emote2_direction = 1;
	if (global.emote2_direction == 1 && image_index >= image_number - 1) {
            global.emote2_direction = -1;
            image_speed = -1; 
        } else if (global.emote2_direction == -1 && image_index <= 0) {
			
            sprite_index = ow_starlo_down;
            global.is_emoting = false;
            image_speed = 0;
            image_index = 0;
			
		}
	
}



if (global.is_emoting) {
   if image_index >= image_number-1 {
     sprite_index = ow_starlo_down;
	 player_starlo.x += 14;
	 global.is_emoting = false;
   }
}




if (!global.is_emoting) {
    // Collision detection
    if (place_meeting(x + xspd, y, owall)) {
        xspd = 0;
    }
    if (place_meeting(x, y + yspd, owall)) {
        yspd = 0;
    }

    // Setting sprite based on movement direction
    if (xspd > 0) {
        sprite_index = ow_starlo_right;
    } else if (xspd < 0) {
        sprite_index = ow_starlo_left;
    } else if (yspd > 0) {
        sprite_index = ow_starlo_down;
    } else if (yspd < 0) {
        sprite_index = ow_starlo_up;
    }

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
}

