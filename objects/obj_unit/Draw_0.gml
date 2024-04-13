if (sprite == noone) exit;

var _a = 1;
var _x = x;

if (ypos > 3 && instance_exists(owner)) { // head unit
	var _pos = owner.drag ? owner.card_pos : owner.temp_card_pos;
	_x = cell_xstart + _pos * cell_width + cell_width div 2;
	_a = owner.in_hand ? 1 : .25;
}


draw_sprite_ext(sprite, 0, _x, y, 1, 1, 0, c_white, _a);