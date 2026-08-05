var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


if (position_meeting(_mx, _my, id)) {
    button_target_scale = 1.05; 
    image_blend = make_color_rgb(220, 220, 220); 
    
    if (mouse_check_button_pressed(mb_left)) {
        if (variable_global_exists("save_game")) {
            global.save_game();
            button_scale = 0.95; 
            image_blend = make_color_rgb(180, 180, 180); 
        }
    }
} else {
    button_target_scale = 1.0; 
    image_blend = c_white; 
}

button_scale = lerp(button_scale, button_target_scale, 0.15);

image_xscale = button_scale;
image_yscale = button_scale;
