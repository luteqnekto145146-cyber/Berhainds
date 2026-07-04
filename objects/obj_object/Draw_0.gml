draw_set_colour(c_black)
for (i = 0; i < array_length(array_2d); i++){
	for (j = 0; j < array_length(array_2d[i]); j++){
		draw_text(x + j*32, y + i *32, array_2d[i][j])
	}
}