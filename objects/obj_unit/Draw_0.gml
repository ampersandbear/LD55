if (sprite == noone) exit;

var _a = 1;
var _x = x;
var _y = y;

if (ypos > 2 && instance_exists(owner)) { // head unit
	_x = unit_get_x(owner.card_pos);
	_a = owner.in_hand ? 1 : .25;
	if (owner.y <= 100) exit;
	
	_y += 52;
	
	if (owner.in_hand 
	&& global.card_drag != noone 
	&& global.card_drag.y > 100 
	&& owner.card_pos == global.card_drag.card_pos
	) { 
		_y += 20;
	}
}

var _attack_warn = ypos == 2;

if (ypos < 3) {
	_y -= 5;
	// mage attack warning:
	if (type == __unit.MAGE) {
		draw_sprite_ext(spr_attack_warn, 2, x, y, 1, 1, 0, cc_red, 1);
		if (unit_find(xpos, 2) != noone) {
			draw_sprite_ext(spr_attack_warn, 1, unit_get_x(xpos), unit_get_y(1), 1, 1, 0, cc_red, 1);
		} else if (unit_find(xpos, 1) == noone) {
			draw_sprite_ext(spr_attack_warn, 2, unit_get_x(xpos), unit_get_y(1), 1, 1, 0, cc_red, 1);
			draw_sprite_ext(spr_attack_warn, 2, unit_get_x(xpos), unit_get_y(2), 1, 1, 0, cc_red, 1);
			_attack_warn = true;
		}
		
	}
}

if (_attack_warn) { // attack warnings:
	draw_sprite_ext(spr_attack_warn, 1, x, unit_get_y(2) + 25, 1, 1, 0, cc_red, 1)
}

// preview for the Hypnohead ability:
if (global.unit_to_move == id 
&& global.card_drag != noone
&& global.card_drag.y > 100
) {
	var _pos = global.card_drag.card_pos;
	if (unit_find(_pos, ypos) != noone) _pos = xpos;
	_x = unit_get_x(_pos);
	_a = .25;
}

draw_sprite_ext(sprite, 0, _x, _y, 1, 1, 0, c_white, _a);

if (ypos < 3 && hp_max > 1) { // health:
	draw_sprite_ext(spr_heart, 0, _x - 20, _y + 8, 1, 1, 0, c_white, 1);
	var _hp_color	= (hp < hp_max) ? cc_atk : c_white;
	draw_sprite_ext(spr_heart_numbers, hp, _x - 10, _y + 8, 1, 1, 0, _hp_color, 1);
}

/*
draw_set_color(c_lime);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);