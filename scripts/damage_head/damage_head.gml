function damage_head(_attacker, _x, _dmg){
	var _unit = unit_find(_x, 4);
	if (_unit != noone) {
		
		// Ironhead ability:
		if (_unit.type != __card.BLOCK) {
			with (obj_unit) if (head && type == __card.BLOCK && (xpos == _x + 1 || xpos == _x - 1)) {
				damage_head(_attacker, xpos, _dmg)
				return;
			}
		}
		
		// Spikehead ability:
		if (_unit.type == __card.STUN) {
			_attacker.stun = 1;
			_attacker.pulse = 7;
			_attacker.pulse_color = c_white;
		}
		
		unit_take_damage(_unit, _dmg);
	} else { // damage the masterhead:
		damage_masterhead(_dmg);
	}
}