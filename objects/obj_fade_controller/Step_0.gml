if (state == "fade_in") {
    alpha += fade_speed; // Делаем экран темнее
    if (alpha >= 1) {
        alpha = 1;
        state = "fade_out"; // Переключаем состояние на просветление
        room_goto(target_room); // Переходим в нужную комнату!
    }
} else if (state == "fade_out") {
    alpha -= fade_speed; // Делаем экран светлее
    if (alpha <= 0) {
        instance_destroy(); // Экран полностью посветлел, удаляем контроллер
    }
}