if (sprite == noone) exit;

var _a = 1;

lerp_x = lerp( lerp_x, x, 0.25);
lerp_y = lerp( lerp_y, y, 0.25);
var _x = lerp_x;
var _y = lerp_y;

if (head && instance_exists(owner)) { // head unit
	_x = unit_get_x(owner.card_pos);
	_a = owner.in_hand ? 1 : .25;
	if (owner.y <= 100 && owner.drag_ystart < 100) exit;
	
	_y += 52;
	var _card_pos = owner.card_pos;
	
	if (owner.in_hand 
	&& global.card_drag != noone 
	&& global.card_drag.y > 100 
	&& owner.card_pos == global.card_drag.card_pos
	) { 
		_y += 20;
		_card_pos = global.card_drag.card_pos;
	}
	
	// Animate head:
	head_animate_angle += head_animate_speed;
	if head_animate_angle > 360 { head_animate_angle = 0; }
	else if head_animate_angle < 0 { head_animate_angle = 360; }
	_x += lengthdir_x( 3, head_animate_angle);
	_y += lengthdir_y( 5, head_animate_angle);
	
	// Draw neck unless we aren't fully visible?
	if neck_sprite != noone
	{
		var _balls = 1;
		var _nx = game_width*0.5;
		var _ny = 240;
		
		switch _card_pos
		{
			case 0: _nx -= 30; _ny += 30; _balls = 4; break;
			case 1: _nx -= 20; _ny += 20; _balls = 3; break;
			case 2: _nx -= 10; _ny += 10; _balls = 2; break;
			//case 3: _nx -= 20; _ny += 20; break;
			case 4: _nx += 10; _ny += 10; _balls = 2; break;
			case 5: _nx += 20; _ny += 20; _balls = 3; break;
			case 6: _nx += 30; _ny += 30; _balls = 4; break;
		}
		
		var _distance = point_distance(_x, _y, _nx, _ny);
		var _angle	  = point_direction(_nx, _ny, _x, _y);
		var _interval = _distance/(_balls+1);
		
		for(var i= 1; i <= _balls; i++)
		{
			draw_sprite_ext( neck_sprite, 0, _nx + lengthdir_x(_interval*i, _angle)
										   , _ny + lengthdir_y(_interval*i, _angle)
										   , 1, 1, 0, c_white, _a);
		}
	}
}

var _attack_warn = ypos == 3;

if (!head)
{
	_y -= 5;
	// mage attack warning:
	if (type == __unit.MAGE && ypos > 0) {
		draw_sprite_ext(spr_attack_warn, 2, x, y, 1, 1, 0, cc_red, 1);
		if (unit_find(xpos, 3) != noone) {
			draw_sprite_ext(spr_attack_warn, 1, unit_get_x(xpos), unit_get_y(2), 1, 1, 0, cc_red, 1);
		} else if (unit_find(xpos, 2) == noone) {
			draw_sprite_ext(spr_attack_warn, 2, unit_get_x(xpos), unit_get_y(2), 1, 1, 0, cc_red, 1);
			draw_sprite_ext(spr_attack_warn, 2, unit_get_x(xpos), unit_get_y(3), 1, 1, 0, cc_red, 1);
			_attack_warn = true;
		}
	}
	// archer attack warning:
	if (type == __unit.ARCHER && ypos > 0) {
		for (var i = 1; i < 4; i++) {
			draw_sprite_ext(spr_attack_warn, 2, unit_get_x(xpos), unit_get_y(i), 1, 1, 0, cc_red, 1);
		}
		_attack_warn = true;
	}
	// spearman attack warning:
	if (type == __unit.SPEARMAN && ypos > 1) {
		for (var i = 2; i < 4; i++) {
			draw_sprite_ext(spr_attack_warn, 2, unit_get_x(xpos), unit_get_y(i), 1, 1, 0, cc_red, 1);
		}
		_attack_warn = true;
	}
}

if (_attack_warn) { // melee attack warning:
	draw_sprite_ext(spr_attack_warn, 1, x, unit_get_y(3) + 25, 1, 1, 0, cc_red, 1)
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

if (ypos == 0) { // darken spawned units:
	draw_sprite_ext(spr_cell, 0, x - cell_width div 2, y - cell_height div 2, 1, 1, 0, c_black, .5);
}

if (!head && hp_max > 1) { // health:
	draw_sprite_ext(spr_heart, 0, _x - 20, _y + 8, 1, 1, 0, c_white, 1);
	var _hp_color	= (hp < hp_max) ? cc_atk : c_white;
	draw_sprite_ext(spr_heart_numbers, hp, _x - 10, _y + 8, 1, 1, 0, _hp_color, 1);
}

/*
draw_set_color(c_lime);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);