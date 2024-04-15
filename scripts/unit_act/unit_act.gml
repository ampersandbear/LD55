function unit_act(_obj)
{
	// RETURNS TRUE IF IT ACTED, FALSE IF IT DIDN'T
	// not the same as variable "acted", this is to make alarm[1] be 12 frames or 6 frames if the unit acted or not
	#macro ATTACK_NUDGE 20
	with (_obj) {
		unit_mark_as_acted(id);
			
		if (!head) {
			
			if (handle_stun(id)) return false;
			
			if (ypos == 0) { // spawn:
				//unit_move(id, xpos, 1);
				return false;
			}
				
			if (type == __unit.MAGE) { // mage attacks:
				
				// VFX
				nudge_y = ATTACK_NUDGE;
				attacking = 10;
				
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
				return true;
			}
				
			if (type == __unit.ARCHER) { // archer attacks:
				// VFX
				nudge_y = ATTACK_NUDGE;
				attacking = 10;
				damage_head(id, xpos, atk);
				// SFX
				audio_pplay(sfx_fast_woosh);
				return true;
			}
				
			if (type == __unit.SPEARMAN) { // spearman moves & attacks:
				if (ypos < 2) {
					//unit_move(id, xpos, ypos + 1);
					return false;
				} else {
					audio_pplay( sfx_melee_attack);
					attacking = 10;
					vfx_create( vfx_attack, x, y + cell_height*2);
					damage_head(id, xpos, atk);
				}
				return true;
			}
				
			if (type == __unit.NECRO) { // necromancer spawns skellies:
				return false;
			}
			
			if (melee && ypos < 3) { // units move:
				//unit_move(id, xpos, ypos + 1);
				return false;
			} else { // units attack:
				audio_pplay( sfx_melee_attack);
				damage_head(id, xpos, atk);
				nudge_y = 10;
				attacking = 10;
				
				if type == __unit.CHAMPION
				{
					screenshake_do( 7, 7);
					audio_pplay( sfx_rock_impact);
				}
				
				if (type == __unit.AXEMAN)
				{
					audio_pplay(sfx_rock_impact,,,0.85);
					with vfx_create( vfx_attack, x, y + cell_height*0.5) { image_xscale = 3; }
					
					damage_head(id, xpos + 1, atk);
					damage_head(id, xpos - 1, atk);
				}
				else
					vfx_create( vfx_attack, x, y + cell_height*0.5);
				
				return true;
			}
		}
			
		// heads attack:
		if (head)
		{
			var _acted = false;
			if (type == __card.ATK)
			{
				head_attack();
				_acted = true;
			}
			if (type == __card.BUFF) {
				var _left_unit = unit_find(xpos - 1, ypos);
				if (_left_unit != noone) with (_left_unit) { head_attack(); _acted = true; }
				var _right_unit = unit_find(xpos + 1, ypos);
				if (_right_unit != noone) with (_right_unit) { head_attack(); _acted = true; }
			}
			if (has_trinket(__trinket.DMG)) {
				head_attack();
				_acted = true;
			}
			return _acted;
		}
	}
	return false;
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

function handle_stun(_unit) {
	with (_unit) {
		if (stun) {
			stun--;
			if stun <= 0
			{
				audio_pplay(sfx_card_pick, 0.5,, 1.35);
				nudge_y += 3;
			}
			return true;
		}
	}
	return false;
}

function unit_mark_as_acted(_unit) {
	// horse moves twice:
	if ((_unit.type == __unit.HORSE or _unit.type == __unit.CHAMPION) and _unit.stun <= 0 && _unit.can_act_again > 0) {
		_unit.can_act_again -= 1;
	} 
	else
	{
		_unit.acted = true;
	}
}

function unit_after_effects(_unit)
{
	// mark as acted if horse/champion got stunned
	if _unit.stun > 0 and (_unit.type == __unit.HORSE or _unit.type == __unit.CHAMPION)
	{
		_unit.acted = true;
	}
	// stun champion after acting
	if _unit.type == __unit.CHAMPION and _unit.can_act_again <= 0 and _unit.acted { _unit.stun = 1; }	
}