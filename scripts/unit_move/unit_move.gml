function unit_move(_unit, _x, _y){
	
	var _spot_to_move = unit_find(_x, _y);
	if (_spot_to_move != noone)
	{
		_unit.nudge_x = sign(_x - _unit.xpos)*5;
		_unit.nudge_y = sign(_y - _unit.ypos)*5;
		audio_pplay( sfx_bonk, 0.55,, 1.25);
		return false;
	}
	
	with (_unit)
	{
		xpos = _x;
		ypos = _y;
		x = unit_get_x(xpos);
		y = unit_get_y(ypos);
		depth = -ypos;
		
		if type == __unit.CHAMPION
		{
			screenshake_do( 7, 7);
			audio_pplay( sfx_rock_impact);
		}
		audio_pplay( choose( sfx_footstep_0, sfx_footstep_1, sfx_footstep_2), 0.5);
		
		return true;
	}
}