var start_x = 50;   
var start_y = 50;   
var slot_size = 64; 
var gap = 12;       
var max_item_size = slot_size - 8; 

var mx = device_mouse_x_to_gui(0); 
var my = device_mouse_y_to_gui(0);

hovered_slot = -1; 

// ==========================================
// 1. ОТРИСОВКА ХОТ-БАРА
// ==========================================
for (var i = 0; i < hotbar_slots; i++) {
    var xx = start_x + (i * (slot_size + gap));
    var yy = start_y;
    
    if (mx >= xx && mx <= xx + slot_size && my >= yy && my <= yy + slot_size) {
        hovered_slot = i;
    }
    
    if (i == selected_slot) draw_set_color(c_red);
    else if (hovered_slot == i) draw_set_color(c_yellow);
    else draw_set_color(c_white);
    
    draw_rectangle(xx, yy, xx + slot_size, yy + slot_size, true);
    
    var slot_data = inventory[i];
    if (slot_data != undefined && slot_data != noone && is_struct(slot_data) && struct_exists(slot_data, "item") && slot_data.item != undefined) {
        var _center_x = xx + (slot_size / 2);
        var _center_y = yy + (slot_size / 2);
        
        if (struct_exists(slot_data.item, "sprite")) {
            var _spr = slot_data.item.sprite;
            if (sprite_exists(_spr) && _spr > 0) {
                var _spr_w = sprite_get_width(_spr);
                var _spr_h = sprite_get_height(_spr);
                var _scale = min(max_item_size / _spr_w, max_item_size / _spr_h);
                var _angle = (hovered_slot == i) ? sin(current_time * 0.01) * 12 : 0;
                
                draw_sprite_ext(_spr, 0, _center_x, _center_y, _scale, _scale, _angle, c_white, 1); 
            } else {
                draw_set_color(c_red);
                draw_text(_center_x - 4, _center_y - 8, "?");
            }
        }
        
        if (slot_data.count > 1) {
            draw_set_color(c_white);
            draw_set_halign(fa_right);
            draw_text(xx + slot_size - 4, yy + slot_size - 14, string(slot_data.count));
            draw_set_halign(fa_left);
        }
    }
}

// ==========================================
// 2. ОТРИСОВКА ОСНОВНОЙ СУМКИ (ТЕПЕРЬ КАК ХОТ-БАР)
// ==========================================
if (show_inventory && inventory_slots > 0) {
    var columns = 7; 
    var bag_start_y = start_y + slot_size + 30; 
    var _total_slots = array_length(inventory);
    
    for (var i = hotbar_slots; i < _total_slots; i++) {
        var _bag_index = i - hotbar_slots;
        var _col = _bag_index % columns;
        var _row = _bag_index div columns;
        var xx = start_x + (_col * (slot_size + gap));
        var yy = bag_start_y + (_row * (slot_size + gap));
        
        if (mx >= xx && mx <= xx + slot_size && my >= yy && my <= yy + slot_size) {
            hovered_slot = i;
        }
        
        // Отрисовка линий ячеек точно так же, как у хот-бара!
        if (i == selected_slot) draw_set_color(c_red);
        else if (hovered_slot == i) draw_set_color(c_yellow);
        else draw_set_color(c_white);
        
        draw_rectangle(xx, yy, xx + slot_size, yy + slot_size, true); // true означает "только рамка"
        
        var slot_data = inventory[i];
        if (slot_data != undefined && slot_data != noone && is_struct(slot_data) && struct_exists(slot_data, "item") && slot_data.item != undefined) {
            var _center_x = xx + (slot_size / 2);
            var _center_y = yy + (slot_size / 2);
            
            if (struct_exists(slot_data.item, "sprite")) {
                var _spr = slot_data.item.sprite;
                if (sprite_exists(_spr) && _spr > 0) {
                    var _spr_w = sprite_get_width(_spr);
                    var _spr_h = sprite_get_height(_spr);
                    var _scale = min(max_item_size / _spr_w, max_item_size / _spr_h);
                    var _angle = (hovered_slot == i) ? sin(current_time * 0.01) * 12 : 0;
                    
                    draw_sprite_ext(_spr, 0, _center_x, _center_y, _scale, _scale, _angle, c_white, 1); 
                } else {
                    draw_set_color(c_red);
                    draw_text(_center_x - 4, _center_y - 8, "?");
                }
            }
            
            if (slot_data.count > 1) {
                draw_set_color(c_white);
                draw_set_halign(fa_right);
                draw_text(xx + slot_size - 4, yy + slot_size - 14, string(slot_data.count));
                draw_set_halign(fa_left);
            }
        }
    }
}

// ==========================================
// 3. ТЕКСТ ОПИСАНИЯ
// ==========================================
draw_set_color(c_white);
var info_slot = (hovered_slot != -1) ? hovered_slot : selected_slot;
var text_y = show_inventory ? start_y + 350 : start_y + slot_size + 20; 

if (info_slot < array_length(inventory)) {
    var current_slot = inventory[info_slot];
    if (current_slot != undefined && current_slot != noone && is_struct(current_slot) && struct_exists(current_slot, "item") && current_slot.item != undefined) {
        var item = current_slot.item;
        var _name = struct_exists(item, "name") ? string(item.name) : "Неизвестно";
        var _desc = struct_exists(item, "description") ? string(item.description) : "Нет описания";
        
        draw_text(start_x, text_y, "Предмет: " + _name);
        draw_text(start_x, text_y + 20, "Описание: " + _desc);
    } else {
        draw_text(start_x, text_y, "Ячейка пуста");
    }
}

// ==========================================
// 4. ОТРИСОВКА ПРЕДМЕТА НА КУРСОРЕ
// ==========================================
if (dragged_item_data != undefined && dragged_item_data != noone && is_struct(dragged_item_data) && struct_exists(dragged_item_data, "item") && dragged_item_data.item != undefined) {
    if (struct_exists(dragged_item_data.item, "sprite")) {
        var _spr = dragged_item_data.item.sprite;
        if (sprite_exists(_spr) && _spr > 0) {
            var _spr_w = sprite_get_width(_spr);
            var _spr_h = sprite_get_height(_spr);
            var _scale = min(max_item_size / _spr_w, max_item_size / _spr_h);
            
            draw_sprite_ext(_spr, 0, mx, my, _scale, _scale, 0, c_white, 0.8);
        } else {
            draw_set_color(c_red);
            draw_text(mx - 4, my - 8, "?");
        }
    }
    
    if (dragged_item_data.count > 1) {
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_text(mx + (slot_size / 2) - 4, my + (slot_size / 2) - 14, string(dragged_item_data.count));
        draw_set_halign(fa_left);
    }
}
