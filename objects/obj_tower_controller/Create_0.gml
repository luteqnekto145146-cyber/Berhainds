// Стартовые настройки
global.current_floor = 0; // Начинаем с 0 этажа (Хаб)

if (!variable_global_exists("max_floor_reached")) {
    global.max_floor_reached = 0; // Инициализация рекорда
}

// Переменные для красивой анимации текста этажа при старте уровня
splash_alpha = 0;  
splash_scale = 1.0;  
splash_speed_scale = 0.02; 
splash_speed_fade = 0.015; 
