if (sprite == noone) exit;

var _a = 1;
var _x = x;
var _y = y;

if (ypos > 3 && instance_exists(owner)) { // head unit
	var _pos = owner.drag ? owner.card_pos : owner.temp_card_pos;
	_x = cell_xstart + _pos * cell_width + cell_width div 2;
	_a = owner.in_hand ? 1 : .25;
	if (owner.y <= 100) exit;
	
	if (owner.in_hand 
	&& global.card_drag != noone 
	&& global.card_drag.y > 100 
	&& owner.card_pos == global.card_drag.card_pos
	) { 
		_y += 20;
	}
	
}


draw_sprite_ext(sprite, 0, _x, _y, 1, 1, 0, c_white, _a);