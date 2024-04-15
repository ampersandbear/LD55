/// @description Tooltip?
if !head and point_distance( x, y, mouse_x, mouse_y) < 32
{
	var _mx = mouse_x;
	var _my = mouse_y;
	draw_sprite( spr_unit_tooltip, 0, _mx, _my);
	draw_sprite( sprite, 0, _mx + 28, _my + 30);
	draw_sprite_ext(spr_heart, 0, _mx + 42 - 20, _my + 47, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_heart_numbers, hp_max, _mx + 42 - 10, _my + 47, 1, 1, 0, c_white, 1);
	
	// name
	var _str = "[fa_center][fnt_bold]" + name;
	scribble(_str).draw(_mx + 107, _my + 9);
	
	// description
	var _desc = scribble("[fa_top][fa_center]" + desc).wrap(105).line_height(12, 12);
	_desc.draw(_mx + 107, _my + 23);
}
