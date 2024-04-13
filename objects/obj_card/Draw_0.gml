
var _x = drag ? x : draw_x;
var _y = y;

if (global.card_drag != noone && !drag && global.card_drag.y > 100) {
	_y += 50;
}

draw_sprite(spr_hydra_card, 1, _x, _y);
draw_sprite_ext(spr_hydra_card, 0, _x, _y, 1, 1, 0, color, 1);

if (mouseover) draw_sprite(spr_hydra_card, 2, _x, _y);

draw_sprite(spr_heart, 0, _x + 4, _y + 4);
draw_sprite(spr_heart_numbers, hp, _x + 14, _y + 4);


scribble("[fa_center][fnt_bold]" + name).draw(_x + card_width / 2, _y + 86);

var _desc = scribble("[fa_center]" + desc).wrap(card_width - 10).line_height(12, 12);
_desc.draw(_x + card_width / 2, _y + 22 + (60 - _desc.get_height()) div 2);


draw_set_color(color);
var _pos = drag ? card_pos : temp_card_pos;
draw_text(_x, _y - 20, string(_pos))

if (drag) {
	draw_set_color(c_white);
	draw_text(_x + 80, _y - 20, string(x mod 91))
}