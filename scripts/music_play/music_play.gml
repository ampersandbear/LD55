// 
function music_play(_music, _track = 0, _fade = 0)
{
	var _old_track = global.music_tracks[_track];
	if _old_track != noone { 
		audio_sound_gain(_old_track, 0, _fade)
		//audio_stop_sound(_old_track); 
	}
	
	var _new_track = audio_play_sound(_music, 10, true, 0)
	//audio_sound_gain(_new_track,  0, 0);
	audio_sound_gain(_new_track,  global.music_volume, _fade * 2);
	global.music_tracks[_track] = _new_track;
	
	return _new_track;
}