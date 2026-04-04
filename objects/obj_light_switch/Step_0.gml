// 1. Проверяем расстояние до игрока (Старло)
if (instance_exists(player_starlo)) {
    var dist = distance_to_object(player_starlo);
    
    // Подсказка "Press E" появляется, если игрок просто РЯДОМ 
    // (нам неважно, горит свет или нет)
    if (dist < 45) {
        show_prompt = true;
    } else {
        show_prompt = false;
    }
}

// 2. Логика переключения (нажимаем E)
// Кусок кода внутри obj_light_switch (Step)
if (show_prompt && keyboard_check_pressed(ord("E"))) {
    global.light_repaired = !global.light_repaired;
    
    // ДОБАВЬ ЭТУ СТРОКУ:
    show_debug_message("СОСТОЯНИЕ СВЕТА: " + string(global.light_repaired));
    
    audio_play_sound(snd_switch_click, 10, false);
    // ... остальной код
}