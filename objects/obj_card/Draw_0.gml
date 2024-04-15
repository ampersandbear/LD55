
var _x = x;
var _y = y;
var _spr = is_trinket ? spr_trinket_card : spr_hydra_card;

if (global.card_drag != noone && !drag && (global.card_drag.y > 100 || global.card_drag.drag_ystart > 100) && in_hand) {
	_y += 50; // move down so you get a better of the board
}

// card add preview for the shop:
if (room == rm_shop && drag_ystart < 100 && drag && !is_trinket) {
	var _a = (y > 100) ? 0.9 : 0.6;
	draw_sprite_ext( spr_card_add, 1, shop_deck_xstart + (ds_list_size(deck) + 1) * card_width, shop_deck_ystart, 1, 1, 0, c_white, _a);
}
// trinket preview:
if (room == rm_shop 
&& in_deck 
&& array_length(trinkets) < max_trinkets
&& global.card_drag != noone
&& global.card_drag.y > 100
&& global.card_drag.is_trinket
&& global.card_drag.card_pos == card_pos
&& !has_trinket(global.card_drag.type)
) {
	_y += 20;
	draw_sprite_ext( spr_card_preview, 0, x, y, 1, 1, 0, c_white, 0.9);
}

lerp_x = lerp( lerp_x, _x, 0.3);
lerp_y = lerp( lerp_y, _y, 0.3);

_x = lerp_x;
_y = lerp_y;

draw_sprite(_spr, 1, _x, _y);
draw_sprite_ext(_spr, 0, _x, _y, 1, 1, 0, color, 1);

if (mouseover) draw_sprite(_spr, 2, _x, _y);

if (!is_trinket) { // hp
	draw_sprite(spr_heart, 0, _x + 4, _y + 4);
	var _hp			= instance_exists(unit) ? unit.hp : hp;
	var _hp_max		= instance_exists(unit) ? unit.hp_max : hp_max;
	var _hp_color	= (_hp < _hp_max) ? cc_atk : c_white;
	draw_sprite_ext(spr_heart_numbers, _hp, _x + 14, _y + 4, 1, 1, 0, _hp_color, 1);
	
	// applied trinkets:
	var _tx = _x + 88;
	for (var i = 0; i < array_length(trinkets); i++) {
		var _t = trinkets[i];
		var _spr = trinket_data[_t].trinket_ui_sprite;
		_tx -= sprite_get_width(_spr) + 2;
		draw_sprite(_spr, 0, _tx, _y + 4);
	}
}

scribble("[fa_center][fnt_bold]" + name).draw(_x + card_width / 2, _y + 86);

var _desc = scribble("[fa_center]" + desc).wrap(card_width - 12).line_height(12, 12);
_desc.draw(_x + card_width / 2, _y + 22 + (60 - _desc.get_height()) div 2);

