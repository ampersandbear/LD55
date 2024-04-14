function damage_head(_x, _dmg){
	var _unit = unit_find(_x, 4);
	if (_unit != noone) {
		unit_take_damage(_unit, _dmg);
	} else { // damage the masterhead:
		damage_masterhead(_dmg);
	}
}