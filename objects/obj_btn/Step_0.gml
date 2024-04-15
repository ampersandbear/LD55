if (type == __btn.END_TURN) {
	visible = global.card_picked;
}
if (type == __btn.RESHUFFLE) {
	visible = !global.replace_used && !ds_list_empty(temp_deck);
}

active = visible;
if (!menu && (global.gameover || global.pause)) active = false;

var _was_mouseover = mouseover;
mouseover = false;
event_inherited();
if !_was_mouseover and mouseover { audio_pplay( sfx_button_hover, 0.25); }