if (other.has_shield == true) 
{
    var _reflect = 20
    var _block = 60
    
    if (other.my_shield_type == "wood") {
        _reflect = 0 
        _block = 25
    }
    else if (other.my_shield_type == "iron") {
        _reflect = 2
        _block = 50
    }
    else if (other.my_shield_type == "sapphire") {
        _reflect = 15
        _block = 80;   
    }
    
    var _chance = random(100);
    var _block_threshold = _reflect + _block;
    
    // Сбрасываем стартовые настройки анимации у игрока перед выводом текста
    other.text_y_offset = 0;
    other.text_alpha = 1.0;
    other.text_timer = 45; // 45 кадров вполне хватит для красивого эффекта
    
    if (_chance < _reflect) 
    {
        // --- ОТРАЖЕНИЕ ---
        other.shield_text = "reflect"
        other.text_color = c_lime; // Ярко-зеленый
        
        direction = direction + 180; 
        exit; 
    }
    else if (_chance < _block_threshold) 
    {
        // --- БЛОК ---
        other.shield_text = "block"
        other.text_color = c_aqua; // Голубой
        
        instance_destroy(); 
        exit; 
    }
    else 
    {
        // --- НЕУДАЧА (Щит не сработал) ---
        other.shield_text = "лох"
        other.text_color = c_red;       // Красный цвет
        
        // Код не прерывается (нет exit), пуля летит дальше и наносит урон ниже
    }
}


 other.player_hp -= 20
 instance_destroy();