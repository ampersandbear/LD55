/// @description Trinket Tooltip?
if abs( mouse_y - y + 5) < 15
{
	var _trinket_length = array_length(trinkets);
	if _trinket_length > 0
	{
		var _index = floor((x + 90 - mouse_x)/14);
		if _index < 0 or _index >= _trinket_length{ return; }
		var _mx = mouse_x;
		var _my = mouse_y;
		
		var _trinket = trinket_data[trinkets[_index]];
		
		draw_sprite( spr_unit_tooltip, 1, _mx, _my);
		// name
		var _str = "[fa_center][fnt_bold]" + _trinket.trinket_name;
		scribble(_str).draw(_mx + 85, _my + 9);
		
		// description
		var _desc = scribble("[fa_top][fa_center]" + _trinket.trinket_desc).wrap(160).line_height(12, 12);
		_desc.draw(_mx + 85, _my + 23);
	}
}