if (room == rm_shop) exit;

draw_sprite(spr_hydra_body, 0, game_width / 2, 330);
scribble("[fa_right][fnt_huge]WAVE\n" + string(global.wave + 1) + "/" + string(wave_total_count + 1)).transform(2, 2, 0).line_height(14, 14).draw(160, 30);

// preview:
if (global.card_drag != noone && (global.card_drag.y > 100 || global.card_drag.drag_ystart > 100)) {
	// draw guide
	for(var i= 0; i < 7; i++)
	{
		var _selected = (global.card_drag.card_pos == i);
		draw_sprite_ext( spr_card_preview, _selected, 5 + 90 * i, card_ystart, 1, 1, 0, c_white, 0.6 + _selected*0.3);
	}
}
