// 
function screenshake_do(_shake, _time, _direction = noone)
{
	with obj_control
	{
		if(screenshake < _shake)
		{
			screenshake      = _shake;
			screenshake_time = _time;
			screenshake_less = _shake / _time ;
			screenshake_direction = _direction;
		}
	}
}