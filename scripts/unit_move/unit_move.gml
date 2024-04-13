function unit_move(_unit, _x, _y){
	
	var _spot_to_move = unit_find(_x, _y);
	if (_spot_to_move != noone) return false;
	
	with (_unit) {
		xpos = _x;
		ypos = _y;
		x = unit_get_x(xpos);
		y = unit_get_y(ypos);
		return true;
	}
}