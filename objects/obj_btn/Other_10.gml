audio_pplay( sfx_melee_attack, 0.9,, 1.25);

switch (type) {
	case __btn.END_TURN:
		with (obj_unit) acted = false;
		global.card_picked = false;
		with (obj_control) alarm[1] = 12;
	break;
	
	case __btn.EXIT_SHOP:
		transition_to(rm_game);
	break;
	
	case __btn.RESHUFFLE:
		global.replace_used = true;
		with (obj_card) if (!in_hand) {
			ds_list_add(temp_deck, new card(type, trinkets));
			instance_destroy();
		}
		card_draw_from_deck();
	break;
}