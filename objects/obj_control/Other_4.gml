if (room == rm_game) {
	card_draw_from_deck();
	global.wave++;
	spawn_enemy();
	with (obj_unit) if (head) {
		if (type == __card.SUPERHEAD) { // move the head in the middle:
			owner.card_pos = 3;
			owner.x = card_xstart + owner.card_pos * card_width;
			xpos = owner.card_pos;
		} else { // destroy all heads:
			instance_destroy();
		}
	}
}