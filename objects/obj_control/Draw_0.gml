if (room == rm_game) {
	// Draw damage preview(s)
	var _preview = global.attack_preview;
	for(var i= 0; i < 7; i++)
	{
		var _value = _preview[i];
		if _value > 1 { draw_sprite( spr_attack_multiplier, _value, unit_get_x(0) + i*cell_width, unit_get_y(3) + 40); }
		_preview[i]= 0;
	}
	draw_sprite(spr_hydra_body, 0, game_width / 2, 330);
	scribble("[fa_middle][fnt_huge]WAVE " + string(max(0, global.wave) + 1)).transform(2, 2, 0).line_height(14, 14).draw(35, 74);
}
// preview:
/*
if (global.card_drag != noone && (global.card_drag.y > 100 || global.card_drag.drag_ystart > 100)) {
	// draw guide
	for(var i= 0; i < 7; i++)
	{
		var _selected = (global.card_drag.card_pos == i);
		draw_sprite_ext( spr_card_preview, _selected, 5 + 90 * i, card_ystart, 1, 1, 0, c_white, 0.6 + _selected*0.3);
	}
}
