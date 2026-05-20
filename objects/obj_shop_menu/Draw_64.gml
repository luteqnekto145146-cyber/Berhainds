draw_set_font(fnt_main); // Включаем наш новый русский шрифт перед отрисовкой текста
// Находим центр экрана
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var cx = screen_w / 2;
var cy = screen_h / 2;

// 1. Рисуем задний серый фон магазина (c_dkgray вместо c_darkgray)
draw_set_color(c_dkgray);
draw_rectangle(cx - 200, cy - 150, cx + 200, cy + 150, false);
draw_set_color(c_black);
draw_rectangle(cx - 200, cy - 150, cx + 200, cy + 150, true); // Черная рамка

// Заголовок
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(cx, cy - 130, "--- ЛАРЁК ---");

// 2. КНОПКА 1: Аптечка
var b1_x1 = cx - 180; var b1_y1 = cy - 60;
var b1_x2 = cx + 180; var b1_y2 = cy - 10;
draw_set_color(c_gray);
draw_rectangle(b1_x1, b1_y1, b1_x2, b1_y2, false); // Фон кнопки 1
draw_set_color(c_white);
draw_text(cx, cy - 50, "Купить Аптечку (" + string(price_medkit) + " мон.)");

// 3. КНОПКА 2: Сюрикены
var b2_x1 = cx - 180; var b2_y1 = cy + 20;
var b2_x2 = cx + 180; var b2_y2 = cy + 70;
draw_set_color(c_gray);
draw_rectangle(b2_x1, b2_y1, b2_x2, b2_y2, false); // Фон кнопки 2
draw_set_color(c_white);
draw_text(cx, cy + 30, "Сюрикены x3 (" + string(price_shurikens) + " мон.)");

// Подсказка снизу
draw_set_color(c_yellow);
draw_text(cx, cy + 110, "Нажми [E] или кликни мимо, чтобы выйти");
