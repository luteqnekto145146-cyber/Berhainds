draw_self()
var enemy_hp_percent = (hp / hp_max) * 100
if (hp < hp_max) {
var x1 = x - 20
var y1 = y - 40
var x2 = x + 20
var y2 = y - 35

  draw_healthbar(x1, y1, x2, y2, enemy_hp_percent, c_black, c_red, c_green, 0, true, true);
}




