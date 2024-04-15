// 
function music_pause(_track = 0, _fadeout = 0)
{
	var _music = global.music_tracks[_track];
	if _fadeout > 0 { audio_sound_gain(_music, 0, _fadeout); }
	else			{ audio_pause_sound(_music); }
}