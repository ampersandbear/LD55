function unit_take_damage(_unit, _dmg, _direction = -1)
{
	with (_unit)
	{
		// VFX
		hurt = 7;
		if head { nudge_y = ATTACK_NUDGE; }
		else	{ nudge_y = _direction*ATTACK_NUDGE; }
		
		hp = max(0, hp - _dmg);
		if (hp == 0)
		{			
			if (!head)
			{ // enemy unit dies:
				 if (type == __unit.RAM) {
					 unit_create(__unit.RAM_KNIGHT, xpos, ypos);
					 var _x = choose(1, -1);
					 var _cell = unit_find(xpos + _x, ypos);
					 if (_cell != noone) {
						 _x *= -1;
						 _cell = unit_find(xpos + _x, ypos);
					 }
					 if (_cell == noone) unit_create(__unit.RAM_KNIGHT, xpos + _x, ypos);
				 }
				 
				 // Explode!
				vfx_create( vfx_explosion, x, y);
			}
			else // head uses different coordinates
			{
				// Explode!
				vfx_create( vfx_explosion, unit_get_x( xpos), y + 52);
			}
			xpos = noone;
			ypos = noone;
			instance_destroy();
		}
	}
}