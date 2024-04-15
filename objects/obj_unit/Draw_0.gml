if (sprite == noone) exit;

var _a = 1;

lerp_x = lerp( lerp_x, x, 0.25);
lerp_y = lerp( lerp_y, y, 0.25);

nudge_x = lerp( nudge_x, 0, 0.2);
nudge_y = lerp( nudge_y, 0, 0.2);

var _x = lerp_x + nudge_x;
var _y = lerp_y + nudge_y;

if (head && instance_exists(owner)) { // head unit
	_x = unit_get_x(owner.card_pos) + nudge_x;
	if global.card_drag != noone { _a = owner.in_hand ? 1 : 0.5; }
	if (owner.y <= 100 && owner.drag_ystart < 100) exit;
	
	_y += 52;
	var _card_pos = owner.card_pos;
	
	if (owner.in_hand 
	&& global.card_drag != noone 
	&& global.card_drag.y > 100 
	&& owner.card_pos == global.card_drag.card_pos
	)
	{
		_y += 20;
		_card_pos = global.card_drag.card_pos;
	}
	
	// Animate head:
	head_animate_angle += head_animate_speed;
	if head_animate_angle > 360 { head_animate_angle = 0; }
	else if head_animate_angle < 0 { head_animate_angle = 360; }
	_x += lengthdir_x( 3, head_animate_angle);
	_y += lengthdir_y( 5, head_animate_angle) - 5;
	
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
		// set up shader on neck too
		if		hurt  > 0 { shader_set( shd_hurt); }
		else if pulse > 0 { shader_set_color( pulse_color, pulse_alpha); }
		
		var _distance = point_distance(_x, _y, _nx, _ny);
		var _angle	  = point_direction(_nx, _ny, _x, _y);
		var _interval = _distance/(_balls+1);
		
		for(var i= 1; i <= _balls; i++)
		{
			draw_sprite_ext( neck_sprite, 0, _nx + lengthdir_x(_interval*i, _angle)
										   , _ny + lengthdir_y(_interval*i, _angle)
										   , 1, 1, 0, c_white, _a);
		}
		if hurt > 0 or pulse > 0 { shader_reset(); }
	}
}

var _attack_warn = ypos == 3 && !stun;

if (!head)
{
	_y -= 5;
	// mage attack warning:
	if (type == __unit.MAGE && ypos > 0 && !stun) {
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
	if (type == __unit.ARCHER && ypos > 0 && !stun)
	{
		if unit_find(xpos, ypos+1) == noone { draw_sprite_ext(spr_attack_warn_arced, 1, unit_get_x(xpos), unit_get_y(ypos+1)-5, 1, 1, 0, cc_red, 1); }
		var _front_row = unit_find(xpos, 3);
		var _left_unit = unit_find(xpos-1, 3);
		var _right_unit = unit_find(xpos+1, 3);
		if  (_front_row  == noone or _front_row.stun)
		and (_left_unit  == noone or _left_unit.type  != __unit.AXEMAN or _left_unit.stun)
		and (_right_unit == noone or _right_unit.type != __unit.AXEMAN or _right_unit.stun)
			draw_sprite_ext(spr_attack_warn_arced, 0, unit_get_x(xpos), unit_get_y(3) + 25, 1, 1, 0, cc_red, 1);
		global.attack_preview[xpos] += 1;
	}
	// spearman attack warning:
	if (type == __unit.SPEARMAN && ypos > 1 && !stun) {
		for (var i = 2; i < 4; i++) {
			draw_sprite_ext(spr_attack_warn, 2, unit_get_x(xpos), unit_get_y(i), 1, 1, 0, cc_red, 1);
		}
		_attack_warn = true;
	}
}

if (_attack_warn) // melee attack warning:
{
	draw_sprite_ext(spr_attack_warn, 1, x, unit_get_y(3) + 25, 1, 1, 0, cc_red, 1)
	if xpos >= 0 and xpos < 7 { global.attack_preview[xpos] += 1; }
	
	// axeman
	if type == __unit.AXEMAN
	{
		if xpos > 0 { global.attack_preview[xpos-1] += 1; }
		if xpos < 6 { global.attack_preview[xpos+1] += 1; }
		
		draw_sprite_ext(spr_attack_warn, 1, x - cell_width, unit_get_y(3) + 25, 1, 1, 0, cc_red, 1)
		draw_sprite_ext(spr_attack_warn, 1, x + cell_width, unit_get_y(3) + 25, 1, 1, 0, cc_red, 1)
	}
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
// img index
var _img_idx = 0;
if !head
{
	if attacking > 0 { attacking -= 1; _img_idx = 2; }
	else			 { _img_idx = global.img_idx; }
}
// head drop shadow
if head and _a >= 1 { draw_sprite_ext( sprite, 0, _x-1, _y+1, 1, 1, 0, c_black, 1); }

// shaders
if		hurt  > 0 { shader_set( shd_hurt); }
else if pulse > 0 { shader_set_color( pulse_color, pulse_alpha); }

draw_sprite_ext(sprite, _img_idx, _x, _y, 1, 1, 0, c_white, _a);

// reset shaders
if		hurt  > 0 { hurt -= 1; shader_reset(); }
else if pulse > 0 { pulse -= 1; shader_reset(); }

if (ypos == 0) { // darken spawned units:
	//draw_sprite_ext(spr_cell, 0, x - cell_width div 2, y - cell_height div 2, 1, 1, 0, c_black, .5);
	draw_sprite_ext(sprite, _img_idx, _x, _y, 1, 1, 0, c_black, .5);
}

if (!head && hp_max > 1) { // health:
	draw_sprite_ext(spr_heart, 0, _x - 20, _y + 8, 1, 1, 0, c_white, 1);
	var _hp_color	= (hp < hp_max) ? cc_atk : c_white;
	draw_sprite_ext(spr_heart_numbers, hp, _x - 10, _y + 8, 1, 1, 0, _hp_color, 1);
}
if stun
{
	stun_anim += 3;
	if stun_anim > 360 { stun_anim = 0; }
	// non-head offset
	_x += 1;
	if !head { _y -= 20; } else { _y += 5; }
	if stun_anim > 180 { _y += 1; }
	// eclipse ( 27 x 15 )
	draw_sprite( spr_stun, 2, _x, _y);
	// stars
	var _idx = floor(stun_anim/90) % 2 ? 0 : 1;
	draw_sprite( spr_stun, _idx, _x + lengthdir_x( 14, stun_anim), _y + lengthdir_y( 7, stun_anim));
	draw_sprite( spr_stun, _idx == 1 ? 0 : 1, _x + lengthdir_x(-14, stun_anim), _y + lengthdir_y(-7, stun_anim));
}

/*
draw_set_color(c_lime);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);