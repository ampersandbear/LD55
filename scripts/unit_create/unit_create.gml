function unit_create(_type, _x, _y){
	
	var _xx = unit_get_x(_x);
	var _yy = unit_get_y(_y);
	
	var _unit = instance_create_depth(_xx, _yy, unit_default_depth, obj_unit);
	_unit.type = _type;
	_unit.xpos = _x;
	_unit.ypos = _y;
	
	_unit.lerp_x = _xx;
	_unit.lerp_y = _yy - 16;
	
	// unit_power per type
	_unit.unit_power = 2;
	
	switch _type
	{
		case __unit.PEASANT: _unit.unit_power = 1; break;
		case __unit.AXEMAN:	 _unit.unit_power = 3; break;
		case __unit.NECRO:	 _unit.unit_power = 4; break;
		case __unit.RAM:	 _unit.unit_power = 3; break;
	}
	
	_unit.depth = -_y
	with (_unit) event_user(10);
	return _unit;
}