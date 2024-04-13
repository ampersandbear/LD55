/// @description mouse cursor

with (obj_selectable) if (mouseover) {
	window_set_cursor(cr_drag);
    exit;
}

window_set_cursor(cr_default);