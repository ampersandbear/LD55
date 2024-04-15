/// @description Trinket Tooltip?
if abs( mouse_y - y - 9) < 10 && !drag
{
	var _trinket_length = array_length(trinkets);
	if _trinket_length > 0
	{
		var _index = floor((x + 90 - mouse_x)/14);
		if _index < 0 or _index >= _trinket_length{ return; }
		var _mx = x + 110;
		var _my = y;
		var _trinket = trinket_data[trinkets[_index]];
		
		draw_sprite( spr_unit_tooltip, 0, _mx, _my);
		//draw_sprite( sprite, 0, _mx + 28, _my + 30);
		draw_sprite(spr_trinket_icons, _trinket.trinket_sprite, _mx + 10, _my + 10);
	
		// name
		var _str = "[fnt_bold]" + _trinket.trinket_name;
		scribble(_str).draw(_mx + 30, _my + 7);
	
		// description
		var _desc = scribble(_trinket.trinket_desc).wrap(150).line_height(12, 12);
		_desc.draw(_mx + 10, _my + 30);
	}
}