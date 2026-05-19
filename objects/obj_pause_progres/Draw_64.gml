var player_asset = asset_get_index("obj_beg_terrei");
var finish_asset = asset_get_index("perehod_na_sled_kom");

if (player_asset != -1 && instance_number(player_asset) > 0 && finish_asset != -1 && instance_number(finish_asset) > 0)
{
    var player = instance_find(player_asset, 0);
    var finish = instance_find(finish_asset, 0);
    
    if (player != noone && finish != noone)
    {
        // Вычисляем, сколько всего расстояния по X между стартом комнаты (0) и финишем
        var total_distance = finish.x;
        
        // Вычисляем текущий прогресс игрока относительно финиша
        var progress_pct = (player.x / total_distance) * 100;
        progress_pct = clamp(progress_pct, 0, 100);
        
        var view_w = display_get_gui_width();
        var view_h = display_get_gui_height();
        
        var bar_w = 300; 
        var bar_h = 20;  
        
        var x1 = (view_w / 2) - (bar_w / 2);
        var y1 = (view_h / 2) + 120; 
        var x2 = x1 + bar_w;
        var y2 = y1 + bar_h;
        
        draw_set_color(c_dkgray);
        draw_rectangle(x1, y1, x2, y2, false);
        
        var current_x2 = x1 + (bar_w * (progress_pct / 100));
        draw_set_color(c_lime);
        draw_rectangle(x1, y1, current_x2, y2, false);
        
        draw_set_color(c_white);
        draw_rectangle(x1, y1, x2, y2, true);
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(view_w / 2, y1 - 15, "ДО ФИНИША: " + string(round(progress_pct)) + "%");
    }
}
