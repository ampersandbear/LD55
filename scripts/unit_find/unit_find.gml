function unit_find(_x, _y) {
	
	if (_x < 0 || _x >= board_width) return -1;
	
	with (obj_unit) if (xpos == _x && ypos == _y) {
		return id;
	}
	return noone;
}