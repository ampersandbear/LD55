function card_draw(){
	
	if (ds_list_empty(deck)) return;
	
	var _type = deck[| 0];
	ds_list_delete(deck, 0);
	
	card_create(_type, card_draw_xstart, card_draw_ystart);
	global.card_picked = false;
}