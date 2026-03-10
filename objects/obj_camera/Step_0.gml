if follow != noone {         // Check if follow target still exists
    xto = follow.x;          // Update target X to follow object's X
    yto = follow.y;          // Update target Y to follow object's Y
}

x += (xto - x) * 0.1;       // Smoothly move camera X toward target (lerp)
y += (yto - y) * 0.1;       // Smoothly move camera Y toward target (lerp)

// Clamp camera position so it never goes outside the room boundaries
var cx = clamp(round(x) - camwidth * 0.5, 0, room_width - camwidth);  // Center X, clamp to room
var cy = clamp(round(y) - camheight * 0.5, 0, room_height - camheight);  // Center Y, clamp to room 


camera_set_view_pos(view_camera[0], cx, cy); // Apply final camera position

