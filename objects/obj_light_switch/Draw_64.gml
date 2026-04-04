if (show_prompt && !global.light_repaired) {
    
    // Переводим мировые координаты объекта в координаты экрана GUI
    var cx = camera_get_view_x(view_camera[0]);
    var cy = camera_get_view_y(view_camera[0]);
    var cw = camera_get_view_width(view_camera[0]);
    var ch = camera_get_view_height(view_camera[0]);
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    // Коэффициенты масштабирования для перевода координат
    var scale_x_factor = gw / cw;
    var scale_y_factor = gh / ch;

    // Итоговые координаты GUI над выключателем
    var gx = (x - cx) * scale_x_factor;
    var gy = (y - cy) * scale_y_factor;

    // --- НАСТРОЙКА МАСШТАБА ---
    // Увеличено в 3 раза по сравнению с прошлым разом (было 0.1, стало 0.3)
    var scale = 0.3; 
    
    // Рисуем спрайт подсказки "Press Button E"
    // Мы подняли его чуть выше (gy - 50), чтобы крупный текст не перекрывал выключатель
    draw_sprite_ext(
        spr_ui_press_e, // Твой спрайт с текстом
        0,              // Кадр
        gx,             // Координата X на экране
        gy - 50,        // Координата Y на экране (чуть выше объекта)
        scale,          // Масштаб по X
        scale,          // Масштаб по Y
        0,              // Угол поворота
        c_white,        // Цвет
        1               // Прозрачность
    );
}