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
				
				var _damaged_unit = false;
				for (var j = 2; j < 4; j++) {
					var _unit = unit_find(xpos, j);
					if (_unit != noone) {
							unit_take_damage(_unit, atk, 1);
						_damaged_unit = true;
						break;
					}
				}
				if (!_damaged_unit) damage_head(id, xpos, atk);
				return;
			}
				
			if (type == __unit.ARCHER) { // archer attacks:
				// VFX
				nudge_y = ATTACK_NUDGE;
				damage_head(id, xpos, atk);
				return;
			}
				
			if (type == __unit.SPEARMAN) { // spearman moves & attacks:
				if (ypos < 2) {
					unit_move(id, xpos, ypos + 1);
				} else {
					damage_head(id, xpos, atk);
				}
				return;
			}
				
			if (type == __unit.NECRO) { // necromancer spawns skellies:
				nudge_y -= ATTACK_NUDGE;
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
				damage_head(id, xpos, atk);
				nudge_y = 10;
				
				if (type == __unit.AXEMAN) {
					damage_head(id, xpos + 1, atk);
					damage_head(id, xpos - 1, atk);
				}
			}
		}
			
		// heads attack:
		if (head) {
			if (type == __card.ATK)
			{
				vfx_head_attack( id);
				
				var _unit = unit_find_up(xpos);
				if (_unit != noone) unit_take_damage(_unit, 1);
			}
			if (type == __card.BUFF)
			{
				var _left_unit = unit_find(xpos - 1, ypos);
				if (_left_unit != noone) {
					var _unit = unit_find_up(_left_unit.xpos);
					vfx_head_attack(_left_unit);
					if (_unit != noone) {
						unit_take_damage(_unit, 1);
					}
				}
				var _right_unit = unit_find(xpos + 1, ypos);
				if (_right_unit != noone) {
					var _unit = unit_find_up(_right_unit.xpos);
					vfx_head_attack(_right_unit);
					if (_unit != noone) {
						unit_take_damage(_unit, 1);
					}
				}
			}
		}
	}
}

function vfx_head_attack(_unit)
{
	with _unit
	{
		nudge_y = -ATTACK_NUDGE;
	}
}