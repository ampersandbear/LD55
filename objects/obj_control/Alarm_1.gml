/// @description units act

for (var i = 0; i < 7; i++) {
	for (var j = 0; j < 5; j++) {
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
	global.wave++;
	spawn_enemy();
	with (obj_unit) if (head) {
		if (type == __card.SUPERHEAD) { // move the head in the middle:
			owner.card_pos = 3;
			owner.x = card_xstart + owner.card_pos * card_width;
			xpos = owner.card_pos;
		} else { // destroy all heads:
			instance_destroy();
		}
	}
	transition_to(rm_shop);
	exit;
}

card_draw_from_deck();