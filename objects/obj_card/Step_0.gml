active = !global.card_drag;
event_inherited();

if (drag) {
    x = mouse_x - drag_x;
    y = mouse_y - drag_y;
    depth = -10000;

    if (mouse_check_button_released(mb_left)) {
        drag = false;
        global.card_drag = false;
		
		x = drag_xstart;
		y = drag_ystart;
		draw_x = x;
    }
	exit;
}

depth = mouseover ? -10000 : card_default_depth;

var _card = instance_place(x, y, obj_card);
// move cards to account for the one that is dragged:
if (_card != noone && _card.drag && !_card.in_hand) {
	draw_x = drag_xstart + card_width;
} else {
	draw_x = drag_xstart;
}