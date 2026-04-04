if (instance_exists(player_starlo)) {
    // 1. Координаты GUI
    var cx = camera_get_view_x(view_camera[0]);
    var cy = camera_get_view_y(view_camera[0]);
    var cw = camera_get_view_width(view_camera[0]);
    var ch = camera_get_view_height(view_camera[0]);
    
    var gx = (player_starlo.x - cx) * (display_get_gui_width() / cw);
    var gy = (player_starlo.y - cy) * (display_get_gui_height() / ch);

    // 2. Настройки текста
    draw_set_font(-1); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // --- ГЛАВНЫЕ НАСТРОЙКИ ---
    var text_scale = 1.0;      // Сделаем чуть меньше (1.5 вместо 2), чтобы влезло
    var max_width = 300;     // МАКСИМАЛЬНАЯ ШИРИНА строки в пикселях (после которой будет перенос)
    var line_sep = 20;       // Расстояние между строками
    var ty = gy - 120;       // Высота над головой

    // 3. Рисуем тень (обводку) для читаемости
    draw_set_color(c_black);
    draw_text_ext_transformed(gx + 2, ty, text, line_sep, max_width, text_scale, text_scale, 0);
    draw_text_ext_transformed(gx - 2, ty, text, line_sep, max_width, text_scale, text_scale, 0);

    // 4. Рисуем сам белый текст с переносом строк
    draw_set_color(c_white);
    draw_text_ext_transformed(gx, ty, text, line_sep, max_width, text_scale, text_scale, 0);
}