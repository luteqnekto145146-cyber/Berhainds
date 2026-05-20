// 1. Рисуем сам магазин
draw_self();

// 2. Проверяем, существует ли игрок и близко ли он
if (instance_exists(obj_beg_terrei)) {
    var dist_to_player = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);

    if (dist_to_player <= 60) {
        // Рисуем подсказку чуть выше магазина
        draw_set_color(c_yellow);
        draw_set_halign(fa_center);
        draw_text(x, y - 40, "Нажми [E], чтобы купить аптечку (" + string(medkit_price) + " монет)");
    }
}
