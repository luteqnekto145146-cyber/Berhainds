y -= spd;
alpha -= 0.015;
if (alpha <= 0) {
    instance_destroy();
}
