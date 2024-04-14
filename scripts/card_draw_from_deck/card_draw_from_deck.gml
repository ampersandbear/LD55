function card_draw_from_deck(){
	
	if (ds_list_empty(temp_deck)) return;
	
	var _type = temp_deck[| 0];
	ds_list_delete(temp_deck, 0);
	
	card_create(_type, card_draw_xstart, card_draw_ystart);
	global.card_picked = false;
}