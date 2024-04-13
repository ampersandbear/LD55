/// @description start drag

active = true;
mouseover = true;
drag = true;
in_hand = false;
drag_x = mouse_x - x;
drag_y = mouse_y - y;
drag_xstart = x;
drag_ystart = y;

global.card_drag = id;

if (unit == noone) {
	with (unit_create(type, 3, 3)) {
		owner = other.id;
		other.unit = id;
	}
}