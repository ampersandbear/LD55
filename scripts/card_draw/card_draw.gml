function card_draw(){
	card_create(choose(1, 2), card_draw_xstart, card_draw_ystart);
	global.card_picked = false;
}