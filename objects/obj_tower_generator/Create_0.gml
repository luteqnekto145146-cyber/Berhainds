var random_chunk = choose(obj_chunk_flat, obj_chunk_hills, obj_chunk_pits);
instance_create_layer(room_width / 2, room_height / 2, "Instances", random_chunk);

alarm[0] = 300; 
