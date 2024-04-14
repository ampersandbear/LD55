if (type == __btn.END_TURN) {
	visible = global.card_picked;
}
if (type == __btn.RESHUFFLE) {
	visible = !global.replace_used && !ds_list_empty(temp_deck);
}

active = visible;
mouseover = false;
event_inherited();