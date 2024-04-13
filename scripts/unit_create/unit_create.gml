function unit_create(_type, _x, _y){
	
	var _xx = cell_xstart + _x * cell_width + cell_width div 2;
	var _yy = cell_ystart + _y * cell_height + cell_height div 2;
	
	var _unit = instance_create_depth(_xx, _yy, unit_default_depth, obj_unit);
	_unit.type = _type;
	with (_unit) event_user(10);
	return _unit;
}