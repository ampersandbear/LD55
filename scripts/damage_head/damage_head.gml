function damage_head(_x, _dmg){
	var _unit = unit_find(_x, 4);
	if (_unit != noone) {
		
		// Ironhead ability:
		if (_unit.type != __card.BLOCK) {
			with (obj_unit) if (head && type == __card.BLOCK && (xpos == _x + 1 || xpos == _x - 1)) {
				damage_head(xpos, _dmg)
				return;
			}
		}
		
		unit_take_damage(_unit, _dmg);
	} else { // damage the masterhead:
		damage_masterhead(_dmg);
	}
}