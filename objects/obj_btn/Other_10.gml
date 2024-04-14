

switch (type) {
	case __btn.END_TURN:
		
		with (obj_unit) acted = false;
		
		// units act:
		for (var i = 0; i < 7; i++) {
			for (var j = 0; j < 5; j++) {
				var _unit = unit_find(i, j);
				if (_unit != noone && !_unit.acted) {
					unit_act(_unit);
				}
			}
		}

		card_draw();
		
		var _enemies = choose(1, 2);
		repeat(_enemies) spawn_enemy();
		
		// check the wave was defeated:
		var _enemy_count = 0;
		with (obj_unit) if (!head) _enemy_count++;
		if (_enemy_count == 0) { // it was!
			global.wave++;
			with (obj_unit) if (head && type != __card.SUPERHEAD) instance_destroy();
		}
	break;
}