price_medkit = 2;    // Цена аптечки
price_shurikens = 5; // Цена за 3 сюрикена

// Эффект паузы: деактивируем (замораживаем) все объекты на карте, кроме игрока и самого меню
instance_deactivate_all(true);
instance_activate_object(obj_beg_terrei); // Оставляем игрока активным, чтобы читать его баланс
