function unit_take_damage(_unit, _dmg, _direction = -1)
{
	with (_unit)
	{
		// VFX
		hurt = 7;
		if head
		{
			nudge_y = ATTACK_NUDGE;
			// Screenshake!!
			screenshake_do( 5, 5);
		}
		else
		{
			nudge_y = _direction*ATTACK_NUDGE;
			camera_nudge( 0,2*_direction);
		}
		
		hp = max(0, hp - _dmg);
		if (head && type == __card.SUPERHEAD) global.master_hp = hp;
		
		if (hp == 0)
		{
			audio_pplay( sfx_dead);
			audio_pplay( sfx_hit, 0.5);
			
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
				if (has_trinket(__trinket.EXPLODE)) {
					vfx_fire_attack( y + cell_height, noone, unit_get_x(xpos), y + 52);
					damage_column(xpos, 2);
				}
				if (type == __card.SUPERHEAD) game_over();
			}
			// NECROMANCER: As long as it is alive, any unit that dies becomes a skeleton
			if !head and type != __unit.NECRO and type != __unit.SKELETON and type != __unit.RAM
			{
				var _necromancer_exists = false;
				with obj_unit { if type == __unit.NECRO { _necromancer_exists = true; break; }}
				
				if _necromancer_exists
				{
					nudge_y -= ATTACK_NUDGE;
					attacking = 7;
					with unit_create(__unit.SKELETON, xpos, ypos)
					{
						lerp_x = x;
						lerp_y = y;
												
						unit_stun( id, 1);
						
						pulse = 25;
						pulse_color = #df50e0;
						pulse_alpha = 1;
						nudge_y = 10;
					}
				}
			}
			
			xpos = noone;
			ypos = noone;
			instance_destroy();
		}
		else
			audio_pplay( sfx_hit);
	}
}