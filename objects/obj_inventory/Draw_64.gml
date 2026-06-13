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
    
    
    if (inventory[i] != undefined) {
        draw_sprite(inventory[i].item.sprite, 0, xx, yy); 
        
       
        if (inventory[i].count > 1) {
            draw_set_color(c_white);
            draw_text(xx + slot_size - 18, yy + slot_size - 20, string(inventory[i].count));
        }
    }
}

// 2.  ОСНОВНОЙ ИНВЕНТАРЬ 
if (show_inventory) {
    var slots_per_row = 5;
    for (var i = hotbar_slots; i < inventory_slots; i++) {
        var index_in_menu = i - hotbar_slots;
        var row = floor(index_in_menu / slots_per_row);
        var col = index_in_menu % slots_per_row;
        
        var xx = start_x + (col * (slot_size + gap));
        var yy = start_y + slot_size + 40 + (row * (slot_size + gap));
        
       
        if (mx >= xx && mx <= xx + slot_size && my >= yy && my <= yy + slot_size) {
            hovered_slot = i;
        }
        
        if (i == selected_slot) draw_set_color(c_red);
        else if (hovered_slot == i) draw_set_color(c_yellow);
        else draw_set_color(c_white);
        
        draw_rectangle(xx, yy, xx + slot_size, yy + slot_size, true);
        
        
        if (inventory[i] != undefined) {
            draw_sprite(inventory[i].item.sprite, 0, xx, yy);
            
            if (inventory[i].count > 1) {
                draw_set_color(c_white);
                draw_text(xx + slot_size - 18, yy + slot_size - 20, string(inventory[i].count));
            }
        }
    }
}

// 3. ТЕКСТ ОПИСАНИЯ И ХАРАКТЕРИСТИК 
draw_set_color(c_white);
var slot_data = inventory[selected_slot];
var text_y = show_inventory ? start_y + 240 : start_y + 90; 

if (slot_data != undefined) {
    var item = slot_data.item;
    draw_text(start_x, text_y, "Выбрано: " + string(item.name));
    draw_text(start_x, text_y + 20, "Описание: " + string(item.description));
} else {
    draw_text(start_x, text_y, "Ячейка пуста");
}