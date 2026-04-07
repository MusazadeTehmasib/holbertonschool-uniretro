// 1. Проверка дистанции до игрока и нажатия E
if (instance_exists(player_starlo)) {
    var _dist = distance_to_object(player_starlo);
    
    // Если игрок рядом и нажал E
    if (_dist < 60 && keyboard_check_pressed(ord("E"))) {
        show_ui = true;
        player_starlo.can_move = false;
        player_starlo.move_spd = 3; // Сбрасываем скорость на всякий случай
        
        // Если бак пуст (уже выпито 2 чашки), запускаем таймер на 5 секунд
        if (coffee_count >= 2) {
            empty_timer = 300; // 300 кадров = 5 секунд при 60 FPS
        }
    }
}

// 2. Логика таймера (работает только когда меню открыто и кофе нет)
if (show_ui && coffee_count >= 2) {
    empty_timer -= 1; // Уменьшаем таймер каждый кадр
    
    // Когда время вышло
    if (empty_timer <= 0) {
        show_ui = false;
        if (instance_exists(player_starlo)) player_starlo.can_move = true;
    }
}

// 3. Закрытие меню на Escape
if (show_ui && keyboard_check_pressed(vk_escape)) {
    show_ui = false;
    if (instance_exists(player_starlo)) player_starlo.can_move = true;
    is_pouring = false;
}