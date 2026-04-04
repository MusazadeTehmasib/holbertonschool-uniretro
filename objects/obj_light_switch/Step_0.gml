// Проверяем, существует ли игрок, чтобы избежать ошибок
if (instance_exists(player_starlo)) {
    // 1. Проверяем расстояние от центра выключателя до игрока (например, 40 пикселей)
    var dist = distance_to_object(player_starlo);
    
    // 2. Логика подсказки: показываем, если близко и свет ЕЩЕ НЕ ПОЧИНЕН
    if (dist < 40 && !global.light_repaired) {
        show_prompt = true;
    } else {
        show_prompt = false; // Если отошел или свет уже горит — скрываем
    }
}

// 3. Логика нажатия: если подсказка видна и нажали 'E'
if (show_prompt && keyboard_check_pressed(ord("E"))) {
    // Проверяем, не включен ли свет уже, чтобы звук не дублировался
    if (!global.light_repaired) {
        global.light_repaired = true;
        
        // Попробуй проиграть звук с более высоким приоритетом (например, 10)
        audio_play_sound(snd_switch_click, 10, false);
        
        image_index = 1; 
    }
}