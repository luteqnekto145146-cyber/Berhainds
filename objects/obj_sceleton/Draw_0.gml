hp_percent = 0; 
draw_self(); 
if (hp < hp_max) {
    hp_percent = (hp / hp_max) * 100;
    
    // Задаем координаты для шкалы над головой зомби
    var x1 = x - 20;
    var y1 = y - 40;
    var x2 = x + 20;
    var y2 = y - 34; // Толщина полоски будет 6 пикселей
    
    // Встроенная функция GameMaker для рисования шкалы здоровья
    draw_healthbar(x1, y1, x2, y2, hp_percent, c_black, c_red, c_green, 0, true, true);
}