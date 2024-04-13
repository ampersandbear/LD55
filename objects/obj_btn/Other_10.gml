

switch (type) {
	case __btn.END_TURN:
		with (obj_unit) {
			if (ypos < 3) {
				
				if (type == __unit.MAGE) { // mage attacks:
					var _damaged_unit = false;
					for (var j = 1; j < 4; j++) {
						var _unit = unit_find(xpos, j);
						if (_unit != noone) {
							unit_take_damage(_unit, atk);
							_damaged_unit = true;
							break;
						}
					}
					if (!_damaged_unit) damage_masterhead(atk);
					continue;
				}
				
				if (melee && ypos < 2) { // units move:
					unit_move(id, xpos, ypos + 1);
				} else { // units attack:
					var _unit = unit_find(xpos, 3);
					if (_unit != noone) {
						unit_take_damage(_unit, atk);
					} else { // damage the masterhead:
						damage_masterhead(atk);
					}
				}
			}
			
			// heads attack:
			if (ypos > 2 && type == __card.ATK) {
				var _unit = unit_find_up(xpos);
				if (_unit != noone) unit_take_damage(_unit, 1);
			}
		}
		card_draw();
	break;
}