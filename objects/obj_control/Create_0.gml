
global.card_drag = false;

alarm[0] = 1;

// create the board:
for (var i = 0; i < board_width; i++) {
	for (var j = 0; j < board_height; j++) {
		instance_create_depth(200 + i * cell_size, 50 + j * cell_size, 15, obj_cell);
	}
}