audio_pplay(sfx_button_press);

switch (type) {
	case __btn.END_TURN:
		with (obj_unit) {
			acted = false;
			can_act_again = 1;
		}
		global.card_picked = false;
		with (obj_control) alarm[1] = 12;
		tutorial_proceed(2);
	break;
	
	case __btn.EXIT_SHOP:
		transition_to(rm_game);
		music_fade();
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
		audio_stop_sound(mus_gameover);
		transition_to(rm_game);
		with (all) if (!persistent) instance_destroy();
		global.wave = -1;
		//with (obj_control) event_perform(ev_other, ev_room_start);
	break;
	
	case __btn.TO_TITLE:
		transition_to(rm_title);
		with (obj_gameover) depth = 1;
		with (obj_pause) depth = 1;
		music_fade_all();
	break;
	
	case __btn.START:
		global.wave = -1;
		transition_to(rm_game);
		music_fade();
	break;
	
	case __btn.QUIT:
		game_end();
	break;
	
	case __btn.RESUME:
		game_pause();
	break;
	
	case __btn.TUTORIAL_NEXT:
		tutorial_proceed(0);
		instance_destroy();
	break;
}