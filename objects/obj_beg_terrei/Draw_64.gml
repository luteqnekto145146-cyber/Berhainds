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


draw_text(gui_width - 20, 20, "Опыт: " + string(global.xp));
// Получаем ширину экрана
var gui_width = display_get_gui_width();



var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_halign(fa_right);

if (current_weapon == "revolver") {
    draw_text(gui_w - 40, gui_h - 60, "ОРУЖИЕ: Револьвер");
    
// СЧИТАЕМ ПАТРОНЫ В ИНВЕНТАРЕ:
var total_ammo_in_bag = 0;

if (instance_exists(obj_inventory)) {
    // ИСПРАВЛЕНИЕ: Берем реальную длину всего массива, включая хот-бар и рюкзак
    var _total_slots = array_length(obj_inventory.inventory); 
    
    for (var i = 0; i < _total_slots; i++) {
        var slot = obj_inventory.inventory[i];
           
        if (slot != undefined && slot != noone && is_struct(slot) && struct_exists(slot, "item") && slot.item != undefined) {
            if (slot.item.item_id == 2) {
                total_ammo_in_bag += slot.count; 
            }
        }
	}
	}
};