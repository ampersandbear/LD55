function unit_take_damage(_unit, _dmg){
	
	with (_unit) {
		hp = max(0, hp - _dmg);
		if (hp == 0) {
			if (ypos > 2) {
				with (owner) instance_destroy();
			}
			instance_destroy();
		}
	}
}