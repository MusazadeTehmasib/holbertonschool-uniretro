// Если игрок нажал на выключатель (флаг стал true), плавно исчезаем
if (global.light_repaired) {
    alpha -= 0.02;
    if (alpha <= 0) instance_destroy();
}