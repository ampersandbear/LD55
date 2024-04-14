/// @description units act

for (var j = 0; j < 5; j++) {
	for (var i = 0; i < 7; i++) {
		var _unit = unit_find(i, j);
		if (_unit != noone && !_unit.acted) {
			unit_act(_unit);
			alarm[1] = 10;
			exit;
		}
	}
}

var _enemies = choose(1, 2);
repeat(_enemies) spawn_enemy();
		
// check the wave was defeated:
var _enemy_count = 0;
with (obj_unit) if (!head) _enemy_count++;
if (_enemy_count == 0) { // it was!
	transition_to(rm_shop);
	exit;
}

card_draw_from_deck();
global.replace_used = false;