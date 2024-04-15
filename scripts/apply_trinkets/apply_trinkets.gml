function apply_trinkets(_trinkets = noone){
	if (_trinkets != noone) trinkets = _trinkets;
	
	event_user(10); // clea HP data first
	
	for (var i = 0; i < array_length(trinkets); i++) {
		if (trinkets[i] == __trinket.HP) {
			apply_hp_trinket();
		}
	}
}

function apply_hp_trinket() {
	hp += 2;
	hp_max = max(hp, hp_max);
}

function has_trinket(_type) {
	
	var _obj = id;
	if (object_index == obj_unit) _obj = owner;
	
	for (var i = 0; i < array_length(_obj.trinkets); i++) {
		if (_obj.trinkets[i] == _type) return true;
	}
	return false;
}