global.card_drag = noone;
global.hand_size = 1;
global.left_hand = 3;
global.right_hand = 3;

alarm[0] = 1;

// create the board:
for (var i = 0; i < board_width; i++) {
	for (var j = 0; j < board_height; j++) {
		var _cell = instance_create_depth(
			cell_xstart + i * cell_width,
			cell_ystart + j * cell_height,
			15,
			obj_cell
		);
		_cell.xpos = i;
		_cell.ypos = j;
	}
}