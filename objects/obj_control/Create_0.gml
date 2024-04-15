global.card_drag = noone;
global.card_picked = false;
global.hand_size = 1;
global.left_hand = 3;
global.right_hand = 3;
global.unit_to_move = noone;
global.wave = -1;
global.replace_used = false;
global.master_hp = 5;
global.master_hp_max = 5;
global.master_trinkets = [];
global.gameover = false;

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
		_cell.tile = (i + j) mod 2 * 2 + irandom(1);
	}
}

// previous power, in case we made too many powerful units in one turn
previous_power = 0;

// transition
transition = 0;
transition_speed = 0;
transition_room = noone;

// camera draw stuff
nudge_x = 0;
nudge_y = 0;
// screenshake stuff
screenshake      = 0;
screenshake_time = 0;
screenshake_less = 0;
screenshake_direction = 0;

// end turn button:
btn_create(__btn.END_TURN, 505, 60);
btn_create(__btn.RESHUFFLE, 505, 125);