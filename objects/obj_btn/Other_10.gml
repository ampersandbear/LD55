

switch (type) {
	case __btn.END_TURN:
		
		with (obj_unit) acted = false;
		
		with (obj_unit) if (!acted) {
			acted = true;
			
			if (!head) {
				if (ypos == 0) { // spawn:
					unit_move(id, xpos, 1);
					continue;
				}
				
				if (type == __unit.MAGE) { // mage attacks:
					var _damaged_unit = false;
					for (var j = 2; j < 4; j++) {
						var _unit = unit_find(xpos, j);
						if (_unit != noone) {
							 unit_take_damage(_unit, atk);
							_damaged_unit = true;
							break;
						}
					}
					if (!_damaged_unit) damage_head(xpos, atk);
					continue;
				}
				
				if (type == __unit.ARCHER) { // archer attacks:
					damage_head(xpos, atk);
					continue;
				}
				
				if (type == __unit.SPEARMAN) { // spearman moves & attacks:
					if (ypos < 2) {
						unit_move(id, xpos, ypos + 1);
					} else {
						damage_head(xpos, atk);
					}
					continue;
				}
				
				if (type == __unit.NECRO) { // necromancer spawns skellies:
					if (unit_find(xpos, ypos + 1) == noone) {
						unit_create(__unit.SKELETON, xpos, ypos + 1);
					}
					continue;
				}
				
				if (melee && ypos < 3) { // units move:
					unit_move(id, xpos, ypos + 1);
				} else { // units attack:
					damage_head(xpos, atk);
					
					if (type == __unit.AXEMAN) {
						damage_head(xpos + 1, atk);
						damage_head(xpos - 1, atk);
					}
				}
			}
			
			// heads attack:
			if (head) {
				if (type == __card.ATK) {
					var _unit = unit_find_up(xpos);
					if (_unit != noone) unit_take_damage(_unit, 1);
				}
				if (type == __card.BUFF) {
					var _left_unit = unit_find(xpos - 1, ypos);
					if (_left_unit != noone) {
						var _unit = unit_find_up(_left_unit.xpos);
						if (_unit != noone) unit_take_damage(_unit, 1);
					}
					var _right_unit = unit_find(xpos + 1, ypos);
					if (_right_unit != noone) {
						var _unit = unit_find_up(_right_unit.xpos);
						if (_unit != noone) unit_take_damage(_unit, 1);
					}
				}
			}
		}
		card_draw();
		spawn_enemy();
		
		// check the wave was defeated:
		var _enemy_count = 0;
		with (obj_unit) if (!head) _enemy_count++;
		if (_enemy_count == 0) global.wave++;
	break;
}