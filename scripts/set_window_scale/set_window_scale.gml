function set_window_scale() {
	//
	var wndm = window_scale;
	var wndw = game_width * wndm;
	var wndh = game_height * wndm;
	window_set_size(wndw, wndh);
	window_set_position(display_get_width() - wndw >> 1, display_get_height() - wndh >> 1);
}
