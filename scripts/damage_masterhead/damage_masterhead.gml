function damage_masterhead(_dmg){
	with (obj_unit) if (ypos > 2 && type == __card.SUPERHEAD) {
		unit_take_damage(id, _dmg);
		break;
	}
}