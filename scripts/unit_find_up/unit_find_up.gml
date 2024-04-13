function unit_find_up(_x){
	for (var j = 3; j > 0; j--) {
		var _unit = unit_find(_x, j);
		if (_unit != noone) return _unit;
	}
	return noone;
}