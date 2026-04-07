if (instance_exists(player_starlo)) {
    var _dist = distance_to_object(player_starlo);
    
    if (_dist < 60 && keyboard_check_pressed(ord("E"))) {
        show_ui = true;
        player_starlo.can_move = false;
        player_starlo.move_spd = 3; // Сброс при открытии
        
        if (coffee_count >= 2) {
            empty_timer = 300; // 5 секунд ожидания, если пусто
        }
    }
}

if (show_ui && coffee_count >= 2) {
    empty_timer -= 1;
    if (empty_timer <= 0) {
        show_ui = false;
        if (instance_exists(player_starlo)) player_starlo.can_move = true;
    }
}

if (show_ui && keyboard_check_pressed(vk_escape)) {
    show_ui = false;
    if (instance_exists(player_starlo)) player_starlo.can_move = true;
    is_pouring = false;
}