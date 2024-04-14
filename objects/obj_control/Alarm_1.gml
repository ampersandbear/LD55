/// @description units act

for (var j = 0; j < 5; j++) {
	for (var i = 0; i < 7; i++) {
		var _unit = unit_find(i, j);
		if (_unit != noone && !_unit.acted) {
			unit_act(_unit);
			alarm[1] = 12;
			exit;
		}
	}
}
var _power_quota = 2 + floor(global.wave/2);
var _power = previous_power - _power_quota;
if _power < 0 { _power = 0; }

while _power < _power_quota
{
	var _enemy = spawn_enemy();
	if _enemy != noone { _power += _enemy.unit_power; } else { _power = 100; }
}

if _power < 100 { previous_power = _power; }

// check the wave was defeated:
var _enemy_count = 0;
with (obj_unit) if (!head) _enemy_count++;
if (_enemy_count == 0) { // it was!
	transition_to(rm_shop);
	exit;
}

card_draw_from_deck();
global.replace_used = false;