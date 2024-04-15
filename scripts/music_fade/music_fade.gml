function music_fade(_track = 0){
	audio_sound_gain(global.music_tracks[_track], 0, music_fade_time);
}

function music_fade_all(){
	for (var i = 0; i < array_length(global.music_tracks); i++) {
		var _track = global.music_tracks[i];
		if (_track != noone) audio_sound_gain(_track, 0, music_fade_time);
	}
}