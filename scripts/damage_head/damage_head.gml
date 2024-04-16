function damage_head(_attacker, _x, _dmg){
	var _unit = unit_find(_x, 4);
	
	if (_x < 0 || _x >= board_width) return;
	
	if (_unit != noone) {
		
		// Ironhead ability:
		if (_unit.type != __card.BLOCK) {
			with (obj_unit) if (head && type == __card.BLOCK && (xpos == _x + 1 || xpos == _x - 1)) {
				damage_head(_attacker, xpos, _dmg)
				return;
			}
		}
		
		// Spikehead ability:
		if (_unit.type == __card.STUN) { unit_stun(_attacker); }
		
		unit_take_damage(_unit, _dmg);
	} else { // damage the masterhead:
		damage_masterhead(_dmg);
	}
}

function unit_stun(_unit, _stun = 1)
{
	with _unit
	{
		stun = _stun;
		pulse = 7;
		pulse_color = c_white;
		audio_pplay( sfx_stun);
	}
}