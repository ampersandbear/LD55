/// @description gameover

transition_to(noone);
audio_pplay(mus_gameover);

instance_create_depth(game_width / 2,  game_height + 100, -10000, obj_gameover);

with (btn_create(__btn.RESTART, game_width / 2 - 50, -135)) {
	menu = true;
}
with (btn_create(__btn.TO_TITLE, game_width / 2 - 50, -170)) {
	menu = true;
}