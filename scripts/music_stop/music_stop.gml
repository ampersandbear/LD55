// 
function music_stop(_track,_fadeout = 0)
{
	var _music = global.music_tracks[_track];
	if _fadeout > 0 { audio_sound_gain(_music, 0, _fadeout); }
	else			{ audio_stop_sound(_music); }
}