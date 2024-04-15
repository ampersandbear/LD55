// 
function music_play(_music, _track = 0, _fade = 0)
{
	var _old_track = global.music_tracks[_track];
	if _old_track != noone { audio_stop_sound(_old_track); }
	
	var _new_track = audio_play_sound(_music, 10, true, 0)
	audio_sound_gain(_new_track,  global.music_volume, _fade);
	
	return _new_track;
}