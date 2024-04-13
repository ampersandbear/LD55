function unit_take_damage(_unit, _dmg){
	
	with (_unit) {
		hp = max(0, hp - _dmg);
		if (hp == 0) {
			if (head) {
				with (owner) {
					if (card_pos == global.left_hand) {
						global.left_hand++;
					} else if (card_pos == global.right_hand) {
						global.right_hand--;
					}
					instance_destroy();
				}
			}
			instance_destroy();
		}
	}
}