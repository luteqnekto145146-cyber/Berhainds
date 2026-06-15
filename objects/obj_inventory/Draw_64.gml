if (!show_inventory && hovered_slot == -1) {
    
}

var start_x = 50;   
var start_y = 50;   
var slot_size = 64; 
var gap = 12;       
var mx = device_mouse_x_to_gui(0); 
var my = device_mouse_y_to_gui(0);

hovered_slot = -1; 

// 1.  ХОТ-БАР 
for (var i = 0; i < hotbar_slots; i++) {
    var xx = start_x + (i * (slot_size + gap));
    var yy = start_y;
    
 
    if (mx >= xx && mx <= xx + slot_size && my >= yy && my <= yy + slot_size) {
        hovered_slot = i;
    }
    
   
    if (i == selected_slot) draw_set_color(c_red);
    else if (hovered_slot == i && show_inventory) draw_set_color(c_yellow);
    else draw_set_color(c_white);
    
    draw_rectangle(xx, yy, xx + slot_size, yy + slot_size, true);
    
    if (inventory[i] != noone && inventory[i] != undefined) {
        draw_sprite(inventory[i].item.sprite, 0, xx, yy); 
        
       
        if (inventory[i].count > 1) {
            draw_set_color(c_white);
            draw_text(xx + slot_size - 18, yy + slot_size - 20, string(inventory[i].count));
        }
    }
}

// 2.  ОСНОВНОЙ ИНВЕНТАРЬ 
if (inventory[i] != undefined) {
    // Вычисляем центр ячейки для отрисовки предмета
    var _center_x = xx + (slot_size / 2);
    var _center_y = yy + (slot_size / 2);
    
 // Проверяем, что в слоте действительно что-то лежит, и это не noone/undefined
if (inventory[i] != noone && inventory[i] != undefined) {
    
    // Вычисляем центр ячейки (код центрования, который мы делали)
    var _center_x = xx + (slot_size / 2);
    var _center_y = yy + (slot_size / 2);
    
    // Рисуем спрайт предмета, ТОЛЬКО если ячейка заполнена
    draw_sprite(inventory[i].item.sprite, 0, _center_x, _center_y);
    
    // Отрисовка количества предметов
    if (inventory[i].count > 1) {
        draw_set_color(c_white);
        var _text_x = xx + slot_size - 4;
        var _text_y = yy + slot_size - 12;
        
        draw_set_halign(fa_right);
        draw_text(_text_x, _text_y, string(inventory[i].count));
        draw_set_halign(fa_left);
    }
}
    draw_sprite(inventory[i].item.sprite, 0, _center_x, _center_y);
    
    // Отрисовка количества предметов (цифр)
    if (inventory[i].count > 1) {
        draw_set_color(c_white);
        
        // Смещаем цифры в правый нижний угол, оставляя небольшой отступ в 4 пикселя от краев ячейки
        var _text_x = xx + slot_size - 4;
        var _text_y = yy + slot_size - 12; // 12 — примерная высота шрифта, чтобы он не улетал вниз
        
        // Выравниваем текст по правому краю, чтобы двухзначные числа (например, 10, 52) не вылезали за рамку
        draw_set_halign(fa_right);
        draw_text(_text_x, _text_y, string(inventory[i].count));
        draw_set_halign(fa_left); // Обязательно сбрасываем выравнивание обратно!
    }
}

// 3. ТЕКСТ ОПИСАНИЯ И ХАРАКТЕРИСТИК 
draw_set_color(c_white);
var slot_data = inventory[selected_slot];
var text_y = show_inventory ? start_y + 240 : start_y + 90; 
var slot_data = inventory[i];
if (slot_data != noone and slot_data != undefined) {

    var item = slot_data.item;
    draw_text(start_x, text_y, "Выбрано: " + string(item.name));
    draw_text(start_x, text_y + 20, "Описание: " + string(item.description));
} else {
    draw_text(start_x, text_y, "Ячейка пуста");
}