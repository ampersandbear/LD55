function card_draw_from_deck(_vfx = true){
	
	if (ds_list_empty(temp_deck)) {
		global.card_picked = true;
		return;
	}
	var _card = temp_deck[| 0];
	ds_list_delete(temp_deck, 0);
	
	with (card_create(_card.type, card_draw_xstart, card_draw_ystart))
	{
		apply_trinkets(_card.trinkets);
		
		if _vfx
		{
			// flash!
			pulse = 7;
			pulse_color = c_white;
			pulse_alpha = 1;
			// make it look like it comes from above?
			nudge_y = -32;
			// card deck sound?
			audio_pplay( sfx_fast_woosh, 0.5,,0.5);
		}
	}
	global.card_picked = false;
}