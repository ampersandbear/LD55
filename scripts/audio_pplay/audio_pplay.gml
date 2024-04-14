// 
function audio_pplay(_sfx, _volume = 1, _pitch_range = 0.05, _pitch = 1)
{
	return audio_play_sound(_sfx, 0, false, _volume*global.sfx_volume, 0, _pitch + random_range(-_pitch_range,_pitch_range));
}