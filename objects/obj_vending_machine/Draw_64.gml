if (show_ui) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    // 1. Фон
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1);

    // 2. Рисуем аппарат
    var _ax = _gui_w / 2;
    var _ay = _gui_h / 2;
    draw_sprite(spr_coffee_anim, is_pouring ? pour_frame : 0, _ax, _ay);

    // 3. Твои координаты 186 и 189
    // Вычитаем 545 и 480 (это центр спрайта 1091x960), чтобы найти левый верхний угол
    var _btn_x = _ax - 545 + 186; 
    var _btn_y = _ay - 480 + 189;

    if (coffee_count < 2) {
        if (!is_pouring) {
            // Рисуем кнопку СТАРТ прямо на место
            draw_sprite(spr_button_start, 0, _btn_x, _btn_y);

            // Клик мышкой
            if (mouse_check_button_pressed(mb_left)) {
                if (point_distance(_mx, _my, _btn_x, _btn_y) < 60) {
                    is_pouring = true;
                    pour_frame = 0;
                    if (audio_exists(snd_coffee_pour)) audio_play_sound(snd_coffee_pour, 10, false);
                }
            }
        } else {
            // Анимация (0.02 — это медленно и плавно)
            pour_frame += 0.02; 

            if (pour_frame >= 3) {
                is_pouring = false;
                coffee_count += 1;
                show_ui = false; 
                
                if (instance_exists(player_starlo)) {
                    player_starlo.can_move = true;      
                    player_starlo.move_speed = 23;     
                    player_starlo.alarm[0] = 600;      
                }
                audio_stop_sound(snd_coffee_pour);
            }
        }
    } else {
        // Текст (убедись, что создал шрифт fnt_main с кириллицей)
        draw_set_font(fnt_main);
        draw_set_color(c_red);
        draw_set_halign(fa_center);
        draw_text(_gui_w/2, _gui_h/2 + 280, "АППАРАТ ПУСТ!");
        draw_set_halign(fa_left);
    }
}
depth = -y;