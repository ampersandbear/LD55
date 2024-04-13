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
		depth = card_default_depth;
    }
}