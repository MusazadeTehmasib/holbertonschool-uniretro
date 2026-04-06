// Проверяем расстояние до игрока
var _dist = distance_to_object(player_starlo);

// Если игрок рядом и нажал E
if (_dist < 60 && keyboard_check_pressed(ord("E"))) {
    show_ui = true;
    player_starlo.can_move = false; // Замораживаем игрока
}

// Если меню открыто и нажали Escape — закрываем
if (show_ui && keyboard_check_pressed(vk_escape)) {
    show_ui = false;
    player_starlo.can_move = true;
    is_pouring = false;
}