function unit_find(_x, _y) {
	with (obj_unit) if (xpos == _x && ypos == _y) {
		return id;
	}
	return noone;
}