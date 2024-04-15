if (room == rm_game) {
	ds_list_shuffle(deck);
	ds_list_copy(temp_deck, deck);
	card_draw_from_deck( false);
	global.wave++;
	global.replace_used = false;
	spawn_enemy();
	
	with (obj_unit) if (head) {
		if (type == __card.SUPERHEAD) { // move the head in the middle:
			owner.card_pos = 3;
			owner.x = card_xstart + owner.card_pos * card_width;
			owner.lerp_x = owner.x;
			xpos = owner.card_pos;
			owner.trinkets = global.master_trinkets;
			hp = global.master_hp;
			hp_max = global.master_hp_max;
		} else { // destroy all heads:
			instance_destroy();
		}
	}
}