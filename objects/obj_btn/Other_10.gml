audio_pplay(sfx_button_press);

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
	
	case __btn.RESTART:
		transition_to(rm_game);
		with (all) if (!persistent) instance_destroy();
		global.wave = -1;
		//with (obj_control) event_perform(ev_other, ev_room_start);
	break;
	
	case __btn.TO_TITLE:
	break;
	
	case __btn.START:
		transition_to(rm_game);
	break;
	
	case __btn.QUIT:
		game_end();
	break;
}