// draw outlines if in edges
if xpos == 0 { draw_sprite_part_ext(spr_land, 0, tile * cell_width, 2, cell_width, cell_height, x - 4, y, 1, 1, c_black, 1); }
if xpos == 6 { draw_sprite_part_ext(spr_land, 0, tile * cell_width, 2, cell_width, cell_height, x + 4, y, 1, 1, c_black, 1); }

draw_sprite_part(spr_land, 0, tile * cell_width, 2, cell_width, cell_height, x, y);


if (ypos == 0) {
	//draw_sprite_part(spr_land, 0, tile * cell_width, 0, cell_width, 2, x, y - 2);
}
if (ypos == 3) {
	if xpos == 0 { draw_sprite_part_ext(spr_land, 0, tile * cell_width, 2 + cell_height, cell_width, cell_height, x, y + cell_height, 1, 1, c_black, 1); }
	if xpos == 6 { draw_sprite_part_ext(spr_land, 0, tile * cell_width, 2 + cell_height, cell_width, cell_height, x, y + cell_height, 1, 1, c_black, 1); }
	
	draw_sprite_part(spr_land, 0, tile * cell_width, 2 + cell_height, cell_width, cell_height, x, y + cell_height);
}

if (ypos == 0 && unit_find(xpos, ypos) == noone) {
	draw_sprite_ext(spr_cell, 0, x, y, 1, 1, 0, c_black, .5);
}