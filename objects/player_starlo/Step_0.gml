// --- Bench Sitting Logic ---
var near_bench = (distance_to_object(obj_bench) < 32); // check if player is close to bench

if (keyboard_check_pressed(ord("E")) && near_bench) {
    if (!sitting) {
        sitting = true;
        sprite_index = player_sit;                       // switch to sit sprite
        image_speed = 0;                                 // stop animation
        with (obj_bench) { mask_index = -1; }           // disable bench collision
        x = obj_bench.x - 13;                           // adjust left/right on bench
        y = obj_bench.y - 25;                           // adjust up/down on bench
        depth = -y - 100;                               // force player to render above bench
    } else {
        sitting = false;
        sprite_index = ow_starlo_down;                  // switch back to stand sprite
        with (obj_bench) { mask_index = sprite_index; } // restore bench collision
        x = obj_bench.x + 40;                           // exit to the right of bench
        y = obj_bench.y;                                // reset Y position
    }
}

// block all movement and emotes while sitting
if (sitting) {
    exit;
}


// --- Input Handling ---
right_key = keyboard_check(vk_right);
left_key  = keyboard_check(vk_left);
up_key    = keyboard_check(vk_up);
down_key  = keyboard_check(vk_down);

// Checking "Z" and "X" keys for emotes
emote  = keyboard_check_pressed(ord("Z"));
emote2 = keyboard_check_pressed(ord("X"));

// --- Calculate Movement Speed ---
// xspd and yspd determine the direction and velocity
xspd = (right_key - left_key) * move_spd;
yspd = (down_key  - up_key)   * move_spd;

// --- State Management ---
// Initialize the global emote variable if it doesn't exist
if (!variable_global_exists("is_emoting")) {
    global.is_emoting = false;
}

// --- Emote Logic (Start) ---
// Trigger the first emote (Z key)
if (emote && !global.is_emoting) {
    global.is_emoting = true;
    sprite_index      = ow_starlo_emote;
    image_speed       = 1;
    image_index       = 0;
}

// Trigger the second emote (X key)
if (emote2 && !global.is_emoting) {
    global.is_emoting = true;
    sprite_index      = ow_starlo_emote2;
    image_speed       = 1;
    image_index       = 0;
    x -= 14;
}

// --- Emote Logic (Processing & End) ---
// Reset to idle state once the animation reaches the last frame
if (global.is_emoting) {
    if (image_index >= image_number - 1) {
        // If it was the second emote, return the X position to original
        if (sprite_index == ow_starlo_emote2) {
            x += 14;
        }
        sprite_index      = ow_starlo_down;
        global.is_emoting = false;
        image_speed       = 0;
        image_index       = 0;
    }
}

// --- Movement & Collision Logic ---
// Movement is only allowed if not currently performing an emote
if (!global.is_emoting) {

    // --- Horizontal Collision ---
    if (place_meeting(x + xspd, y,      owall))        { xspd = 0; }
    if (place_meeting(x + xspd, y + 25, obj_fountain)) { xspd = 0; }
	if (place_meeting(x + xspd, y, obj_bench))         { xspd = 0; }

    // --- Vertical Collision ---
    if (place_meeting(x, y + yspd,      owall))        { yspd = 0; }
    // This ensures the hat is ignored whether you move UP or DOWN
    if (place_meeting(x, y + yspd + 25, obj_fountain)) { yspd = 0; }
	if (place_meeting(x, y + yspd, obj_bench))         { yspd = 0; }

    if (xspd > 0)      { sprite_index = ow_starlo_right; }
    else if (xspd < 0) { sprite_index = ow_starlo_left;  }
    else if (yspd > 0) { sprite_index = ow_starlo_down;  }
    else if (yspd < 0) { sprite_index = ow_starlo_up;    }

    if (xspd != 0 || yspd != 0) {
        image_speed = 1;
    } else {
        image_index = 0;
        image_speed = 0;
    }

    x += xspd;
    y += yspd;
}

// Depth sorting (Crucial for visual layering)
depth = -y;