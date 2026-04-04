// Настройки темноты
alpha = 0.6; 
depth = -9999;

// Проверка: если свет еще НЕ починен
if (!global.light_repaired) {
    
    // ВАЖНО: используем твое точное имя объекта - player_starlo
    if (instance_exists(player_starlo)) {
        
        // Создаем мысль прямо на твоем герое
        instance_create_depth(player_starlo.x, player_starlo.y, -15000, obj_thought_bubble);
        
    }
}