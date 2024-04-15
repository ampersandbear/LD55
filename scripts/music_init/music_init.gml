// 
function music_init()
{
	global.music_volume = 0.5;
	global.sfx_volume = 0.25;
	
	global.music_tracks = array_create( 3, noone);
	global.music_pause  = array_create( 3, 0);
	global.music_stop   = array_create( 3, 0);
	//audio_sound_loop_start( mus_hydra, 6);
}