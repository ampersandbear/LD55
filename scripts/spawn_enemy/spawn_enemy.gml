function spawn_enemy(){
	
	var _list = wave_data[global.wave];
	if (ds_list_empty(_list)) return noone;
	
	var _type = _list[| 0];
	ds_list_delete(_list, 0);
	
	var _tries = 0;
	
	do {
		var _x	  = clamp(irandom_range(global.left_hand - 1, global.right_hand + 1), 0, 6);
		var _unit = unit_find_down(_x);
		_tries++;
	} until (_unit == noone || (_unit.melee && _unit.ypos > 0) || _tries > 100);
	
	if (_tries > 100) return noone;
	
	return unit_create(_type, _x, 0);
}