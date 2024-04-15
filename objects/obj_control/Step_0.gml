/// @description mouse cursor
global.img_idx += 0.05;
if global.img_idx >= 2 { global.img_idx -= 2; }

with (obj_selectable) if (mouseover) {
	window_set_cursor(cr_drag);
    exit;
}

window_set_cursor(cr_default);