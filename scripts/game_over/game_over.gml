function game_over(){
	global.gameover = true;
	if (global.wave > global.best_wave) global.best_wave = global.wave;
	save_game();
	with (obj_control) alarm[2] = 60;
}