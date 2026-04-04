alpha = 0.6;
depth = -9999;

// Проверяем, существует ли переменная "сюжет выполнен", если нет — создаем
if (!variable_global_exists("story_done")) {
    global.story_done = false;
}

// СОЗДАЕМ МЫСЛЬ ТОЛЬКО ОДИН РАЗ ЗА ВСЮ ИГРУ
if (!global.light_repaired && global.story_done == false) {
    if (instance_exists(player_starlo)) {
        instance_create_depth(player_starlo.x, player_starlo.y, -15000, obj_thought_bubble);
        global.story_done = true; // Теперь это условие больше никогда не выполнится
    }
}