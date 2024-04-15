/// @description Tooltip?
if !head and mouseover
{
	var _mx = unit_get_x(xpos) + cell_width;
	var _my = unit_get_y(ypos) - cell_height div 2;
	draw_sprite( spr_unit_tooltip, 0, _mx, _my);
	//draw_sprite( sprite, 0, _mx + 28, _my + 30);
	draw_sprite_ext(spr_heart, 0, _mx + 10, _my + 10, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_heart_numbers, hp_max, _mx + 20, _my + 10, 1, 1, 0, c_white, 1);
	
	// name
	var _str = "[fnt_bold]" + name;
	scribble(_str).draw(_mx + 40, _my + 7);
	
	// description
	var _desc = scribble(desc).wrap(150).line_height(12, 12);
	_desc.draw(_mx + 10, _my + 30);
}
