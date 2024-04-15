function unit_act(_obj){
	#macro ATTACK_NUDGE 20
	with (_obj) {
		acted = true;
			
		if (!head) {
			
			if (stun) {
				stun--;
				return;
			}
			
			if (ypos == 0) { // spawn:
				unit_move(id, xpos, 1);
				return;
			}
				
			if (type == __unit.MAGE) { // mage attacks:
				
				// VFX
				nudge_y = ATTACK_NUDGE;
				attacking = 7;
				
				// fireball VFX
				var _distance = unit_get_y(4) + 42 - y + cell_height;
				
				var _damaged_unit = false;
				for (var j = 2; j < 4; j++) {
					var _unit = unit_find(xpos, j);
					if (_unit != noone) {
							_distance = _unit.y - y;
							unit_take_damage(_unit, atk, 1);
						_damaged_unit = true;
						break;
					}
				}
				if (!_damaged_unit) damage_head(id, xpos, atk);
				
				vfx_fire_attack(_distance, noone, x, y, -1);
				return;
			}
				
			if (type == __unit.ARCHER) { // archer attacks:
				// VFX
				nudge_y = ATTACK_NUDGE;
				attacking = 7;
				damage_head(id, xpos, atk);
				// SFX
				audio_pplay(sfx_fast_woosh);
				return;
			}
				
			if (type == __unit.SPEARMAN) { // spearman moves & attacks:
				if (ypos < 2) {
					unit_move(id, xpos, ypos + 1);
				} else {
					audio_pplay( sfx_melee_attack);
					attacking = 7;
					vfx_create( vfx_attack, x, y + cell_height*2);
					damage_head(id, xpos, atk);
				}
				return;
			}
				
			if (type == __unit.NECRO) { // necromancer spawns skellies:
				nudge_y -= ATTACK_NUDGE;
				attacking = 7;
				if (unit_find(xpos, ypos + 1) == noone) {
					with unit_create(__unit.SKELETON, xpos, ypos + 1)
					{
						lerp_x = x;
						lerp_y = y;
						
						nudge_y = 5;
					}
				}
				return;
			}
				
			if (melee && ypos < 3) { // units move:
				unit_move(id, xpos, ypos + 1);
			} else { // units attack:
				audio_pplay( sfx_melee_attack);
				damage_head(id, xpos, atk);
				nudge_y = 10;
				attacking = 7;
				
				if (type == __unit.AXEMAN)
				{
					audio_pplay(sfx_rock_impact,,,0.85);
					with vfx_create( vfx_attack, x, y + cell_height*0.5) { image_xscale = 3; }
					
					damage_head(id, xpos + 1, atk);
					damage_head(id, xpos - 1, atk);
				}
				else
					vfx_create( vfx_attack, x, y + cell_height*0.5);
			}
		}
			
		// heads attack:
		if (head) {
			if (type == __card.ATK){
				head_attack();
			}
			if (type == __card.BUFF) {
				var _left_unit = unit_find(xpos - 1, ypos);
				if (_left_unit != noone) with (_left_unit) head_attack();
				var _right_unit = unit_find(xpos + 1, ypos);
				if (_right_unit != noone) with (_right_unit) head_attack();
			}
			if (has_trinket(__trinket.DMG)) {
				head_attack();
			}
		}
	}
}

function vfx_fire_attack(_distance, _unit, _x, _y, _direction = 1)
{
	// fireball VFX
	if _unit != noone { _distance = _y - _unit.y; }
	
	audio_pplay( sfx_fast_woosh);
	audio_pplay( sfx_fireball);
	
	with vfx_create( vfx_fireball, _x, _y - _distance*_direction, 0.17, 0.1)
	{
		image_yscale = _distance/48*_direction;
		destroy_on_end = false;
	}	
}

function vfx_head_attack(_unit)
{
	with _unit
	{
		nudge_y = -ATTACK_NUDGE;
	}
}

function head_attack(_dmg = 1) {
	vfx_head_attack( id);
	var _pierce = has_trinket(__trinket.PIERCE);
	var _unit = _pierce ? noone : unit_find_up(xpos);
	// fireball VFX
	vfx_fire_attack( y + cell_height, _unit, unit_get_x(xpos), y + 52);		
	// deal damage
	if (_unit != noone) unit_take_damage(_unit, _dmg);
	
	if (_pierce) damage_column(xpos, _dmg);
}

function damage_column(_x, _dmg = 1) {
	for (var j = 3; j > 0; j--) {
		var _unit = unit_find(_x, j);
		if (_unit != noone) unit_take_damage(_unit, _dmg);
	}
}