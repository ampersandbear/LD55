function tutorial_proceed(_stage){
	
	if (global.tutorial != _stage) return;
	
	global.tutorial++;
	switch(_stage) {
		case 0: 
			with (obj_tutorial_box) {
				text = tutorial_text[global.tutorial];
				height -= 20;
				y += 10;
			}
			card_draw_from_deck();
		break;
		
		case 1:
			btn_create(__btn.END_TURN, 505, 60);
			with (obj_tutorial_box) {
				text = tutorial_text[global.tutorial];
				height += 10;
				y -= 5;
			}
		break;
		
		case 2:
			do {
				var _x = irandom(6);
			} until (unit_find(_x, 4) == noone);
			unit_create(__unit.PEASANT, _x, 0);
			with (obj_tutorial_box) {
				text = tutorial_text[global.tutorial];
				height -= 10;
				y += 5;
			}
		break;
		
		case 3:
			with (obj_tutorial_box) instance_destroy();
			ds_list_add(deck, new card(__card.STUN, []));
			ds_list_add(temp_deck, new card(__card.STUN, []));
			with (btn_create(__btn.RESHUFFLE, 505, 125)) visible = false;
			global.replace_used = true;
			save_game();
		break;
	}
}