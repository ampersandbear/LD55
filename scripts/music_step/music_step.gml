// 
function music_step()
{
	for(var i= 0; i < 3; i++)
	{
		if global.music_pause[i] > 0
		{
			global.music_pause[i] -= 1;
			if global.music_pause[i] <= 0 { audio_pause_sound( global.music_tracks[i]); }
		}
		else if global.music_stop[i] > 0
		{
			global.music_stop[i] -= 1;
			if global.music_stop[i] <= 0 { audio_stop_sound( global.music_tracks[i]); }
		}
	}
}