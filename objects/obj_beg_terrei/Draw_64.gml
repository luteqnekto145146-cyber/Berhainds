draw_set_font(fnt_main); // Включаем наш русский шрифт
// ---- РИСУЕМ ЗДОРОВЬЕ ИГРОКА ----
// Вычисляем процент здоровья игрока
var player_hp_percent = (player_hp / player_hp_max) * 100;

// Задаем координаты полоски в левом верхнем углу экрана
// Отступаем 20 пикселей сверху и слева. Длина шкалы будет 150 пикселей, толщина — 15 пикселей.
var hp_x1 = 50;
var hp_y1 = 50;
var hp_x2 = 170;
var hp_y2 = 35;

// Рисуем шкалу здоровья игрока
draw_healthbar(hp_x1, hp_y1, hp_x2, hp_y2, player_hp_percent, c_black, c_maroon, c_lime, 0, true, true);

// На всякий случай сбрасываем выравнивание, чтобы код монет ниже работал правильно
draw_set_halign(fa_left);
draw_set_valign(fa_top);
// Узнаем текущую ширину GUI-экрана
var gui_width = display_get_gui_width();

// Настраиваем цвет текста
draw_set_color(c_white);

// ВАЖНО: Выравниваем текст по ПРАВОМУ краю
draw_set_halign(fa_right);
draw_set_valign(fa_top);

// Рисуем счетчики с отступом в 20 пикселей от правого края экрана
draw_text(gui_width - 20, 20, "Монеты: " + string(global.coins));
draw_text(gui_width - 20, 50, "Опыт: " + string(global.xp));
// Получаем ширину экрана
var gui_width = display_get_gui_width();

// Рисуем надпись ниже монет и опыта (например, на высоте Y: 80)
draw_text(gui_width - 20, 80, "Сюрикены: " + string(shurikens));
