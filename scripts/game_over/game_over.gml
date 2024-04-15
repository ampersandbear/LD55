function game_over(){
	global.gameover = true;
	if (global.wave > global.best_wave) global.best_wave = global.wave;
	save_game();
	audio_sound_gain(global.music_tracks[1], 0, 1000);
	with (obj_control) alarm[2] = 60;
}