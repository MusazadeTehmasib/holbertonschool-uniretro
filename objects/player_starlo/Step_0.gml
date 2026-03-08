// --- Input Handling ---
// Checking arrow keys for movement
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

// Checking "Z" and "X" keys for emotes
emote = keyboard_check_pressed(ord("Z"));
emote2 = keyboard_check_pressed(ord("X"));

// --- Calculate Movement Speed ---
// xspd and yspd determine the direction and velocity
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

// --- State Management ---
// Initialize the global emote variable if it doesn't exist
if (!variable_global_exists("is_emoting")) {
    global.is_emoting = false;
}

// --- Emote Logic (Start) ---
// Trigger the first emote (Z key)
if (emote && !global.is_emoting) {
    global.is_emoting = true;
    sprite_index = ow_starlo_emote; // Set to emote animation
    image_speed = 1;
    image_index = 0; // Start animation from the first frame
}

// Trigger the second emote (X key)
if (emote2 && !global.is_emoting) {
    global.is_emoting = true;
    sprite_index = ow_starlo_emote2;
    x -= 14; // Horizontal offset for the second emote
    image_speed = 1;
    image_index = 0;
}

// --- Emote Logic (Processing & End) ---
// Reset to idle state once the animation reaches the last frame
if (global.is_emoting) {
    if (image_index >= image_number - 1) {
        // If it was the second emote, return the X position to original
        if (sprite_index == ow_starlo_emote2) {
            x += 14;
        }
        sprite_index = ow_starlo_down; // Default idle sprite
        global.is_emoting = false;
        image_speed = 0;
        image_index = 0;
    }
}

// --- Movement & Collision Logic ---
// Movement is only allowed if not currently performing an emote
if (!global.is_emoting) {
    
    // Horizontal Collision: checking for walls and the fountain object
    if (place_meeting(x + xspd, y, owall) || place_meeting(x + xspd, y, obj_fountain)) {
        xspd = 0; // Stop horizontal movement
    }
    
    // Vertical Collision: checking for walls and the fountain object
    if (place_meeting(x, y + yspd, owall) || place_meeting(x, y + yspd, obj_fountain)) {
        yspd = 0; // Stop vertical movement
    }

    // --- Sprite Directional Updates ---
    if (xspd > 0) {
        sprite_index = ow_starlo_right;
    } else if (xspd < 0) {
        sprite_index = ow_starlo_left;
    } else if (yspd > 0) {
        sprite_index = ow_starlo_down;
    } else if (yspd < 0) {
        sprite_index = ow_starlo_up;
    }

    // --- Animation Control ---
    if (xspd != 0 || yspd != 0) {
        image_speed = 1;  // Play movement animation
    } else {
        image_index = 0;
        image_speed = 0;  // Freeze on the first frame if standing still
    }

    // Apply the calculated speed to the object's coordinates
    x += xspd;
    y += yspd;
}

// --- Pseudo-3D Depth Sorting ---
// This ensures Starlo can walk in front of or behind objects based on his Y position
depth = -y;