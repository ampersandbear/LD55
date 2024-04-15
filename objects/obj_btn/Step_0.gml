if (type == __btn.END_TURN) {
	visible = global.card_picked && !global.gameover;
}
if (type == __btn.RESHUFFLE) {
	visible = !global.replace_used && !ds_list_empty(temp_deck) && !global.gameover;
}

active = visible;
var _was_mouseover = mouseover;
mouseover = false;
event_inherited();
if !_was_mouseover and mouseover { audio_pplay( sfx_button_hover, 0.25); }