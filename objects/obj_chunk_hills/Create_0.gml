// Строим нижнее основание холма (длина 5 блоков)
instance_create_layer(x - 64, y, "Instances", obj_wall);
instance_create_layer(x - 32, y, "Instances", obj_wall);
instance_create_layer(x,      y, "Instances", obj_wall);
instance_create_layer(x + 32, y, "Instances", obj_wall);
instance_create_layer(x + 64, y, "Instances", obj_wall);

// Строим средний ряд холма (длина 3 блока, на 32 пикселя выше)
instance_create_layer(x - 32, y - 32, "Instances", obj_wall);
instance_create_layer(x,      y - 32, "Instances", obj_wall);
instance_create_layer(x + 32, y - 32, "Instances", obj_wall);

// Строим вершину холма (1 блок на самом верху)
instance_create_layer(x,      y - 64, "Instances", obj_wall);
