// В Step у obj_thought_bubble
if (instance_exists(player_starlo)) {
    x = player_starlo.x;
    y = player_starlo.y;
} else {
    instance_destroy(); // Если игрока нет (умер/ушел), удаляем мысль от греха подальше
}