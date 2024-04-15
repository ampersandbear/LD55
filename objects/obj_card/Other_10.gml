/// @description start drag

if (type == __card.MOVE && in_hand) {
	global.unit_to_move = unit_find_up(card_pos);
}

audio_pplay( sfx_card_pick);

active = true;
mouseover = true;
drag = true;
in_hand = false;
drag_x = mouse_x - x;
drag_y = mouse_y - y;
drag_xstart = x;
drag_ystart = y;

global.card_drag = id;

if (unit == noone && room == rm_game) {
	with (unit_create(type, 3, 4)) {
		owner = other.id;
		hp = owner.hp;
		hp_max = hp;
		other.unit = id;
	}
}

