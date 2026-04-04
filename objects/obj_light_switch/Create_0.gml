depth = 10; // Оставляем твое
show_prompt = false; // Оставляем твое

// --- А ЭТО ДОБАВЛЯЕМ (самое важное) ---

// 1. Создаем переменную состояния света
if (!variable_global_exists("light_repaired")) {
    global.light_repaired = false; 
}

// 2. Создаем переменную для мыслей (чтобы были 1 раз)
if (!variable_global_exists("story_done")) {
    global.story_done = false;
}

// 3. Настройки спрайта (чтобы выключатель не "бежал" по кадрам сам)
image_speed = 0; 
image_index = 0;