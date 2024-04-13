function game_init(){
	
	window_set_caption(game_name + " v" + string(game_version));
	set_window_scale();
	
	scribble_font_set_default("fnt_main");
	build_data();
}