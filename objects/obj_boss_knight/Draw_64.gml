if (boss_hp > 0 && state != KNIGHT_STATE.DEATH) {
    var _gui_w = display_get_gui_width();
    var _bar_w = 600; 
    var _bar_h = 24;  
    
    var _x1 = (_gui_w / 2) - (_bar_w / 2); 
    var _y1 = 40;                          
    var _x2 = _x1 + _bar_w;                
    var _y2 = _y1 + _bar_h;                
    
    draw_set_color(c_black);
    draw_rectangle(_x1 - 4, _y1 - 4, _x2 + 4, _y2 + 4, false);
    
    draw_set_color(make_color_rgb(40, 40, 40));
    draw_rectangle(_x1, _y1, _x2, _y2, false);
    
    var _pct_delayed = boss_hp_delayed / boss_hp_max;
    var _pct_real = boss_hp / boss_hp_max;
    
    draw_set_color(c_white);
    draw_rectangle(_x1, _y1, _x1 + (_bar_w * _pct_delayed), _y2, false);
    
    draw_set_color(make_color_rgb(180, 20, 20));
    draw_rectangle(_x1, _y1, _x1 + (_bar_w * _pct_real), _y2, false);
    
    draw_set_color(c_white);
    draw_rectangle(_x1 - 2, _y1 - 2, _x2 + 2, _y2 + 2, true);
    
    draw_set_color(c_white);
    draw_set_halign(fa_center); 
    draw_text(_gui_w / 2, _y1 - 25, "РЫЦАРЬ-ОСКВЕРНИТЕЛЬ"); 
    draw_set_halign(fa_left);
}
