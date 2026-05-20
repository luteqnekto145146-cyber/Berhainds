// Проверяем, ранен ли игрок
if (other.player_hp < other.player_hp_max) {
    
    other.player_hp += 30; // Лечим игрока на 30 единиц здоровья
    
    // Если здоровье после лечения превысило максимум, принудительно возвращаем его к сотне
    if (other.player_hp > other.player_hp_max) {
        other.player_hp = other.player_hp_max;
    }
    
    instance_destroy(); // Уничтожаем аптечку, так как она использована
}
