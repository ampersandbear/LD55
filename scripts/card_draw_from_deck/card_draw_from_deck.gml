function card_draw_from_deck(){
	
	if (ds_list_empty(temp_deck)) {
		global.card_picked = true;
		return;
	}
	var _card = temp_deck[| 0];
	ds_list_delete(temp_deck, 0);
	
	with (card_create(_card.type, card_draw_xstart, card_draw_ystart)) {
		apply_trinkets(_card.trinkets);
	}
	global.card_picked = false;
}