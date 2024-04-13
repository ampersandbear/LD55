

draw_sprite_part(spr_land, 0, tile * cell_width, 2, cell_width, cell_height, x, y);


if (ypos == 0) {
	draw_sprite_part(spr_land, 0, tile * cell_width, 0, cell_width, 2, x, y - 2);
}
if (ypos == 2) {
	draw_sprite_part(spr_land, 0, tile * cell_width, 2 + cell_height, cell_width, cell_height, x, y + cell_height);
}