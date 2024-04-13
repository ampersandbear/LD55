function damage_masterhead(_dmg){
	with (obj_unit) if (head && type == __card.SUPERHEAD) {
		unit_take_damage(id, _dmg);
		break;
	}
}