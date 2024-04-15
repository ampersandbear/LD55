function game_pause(){
	global.pause = !global.pause;

	if (global.pause) {
		with (obj_control) transition = 0.8; // darken the screen
		instance_create_depth(game_width / 2, 80, -10000, obj_pause);
	
		with (obj_card) if (drag) event_user(2);
		
		audio_sound_gain(global.music_tracks[1], 0.1, 0)
		
		with (btn_create(__btn.RESUME, game_width / 2 - 50, 140)) {
			menu = true;
		}
		with (btn_create(__btn.RESTART, game_width / 2 - 50, 175)) {
			menu = true;
		}
		with (btn_create(__btn.TO_TITLE, game_width / 2 - 50, 210)) {
			menu = true;
		}
	} else {
		with (obj_control) transition = 0;
		with (obj_pause) instance_destroy();
		with (obj_btn) if (menu) instance_destroy();
		
		audio_sound_gain(global.music_tracks[1], global.music_volume, 0)
	}
}