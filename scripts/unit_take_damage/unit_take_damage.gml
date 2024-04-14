function unit_take_damage(_unit, _dmg){
	
	with (_unit) {
		hp = max(0, hp - _dmg);
		if (hp == 0) {
			if (head) { // head dies:
				with (owner) {
					if (card_pos == global.left_hand) {
						global.left_hand++;
					} else if (card_pos == global.right_hand) {
						global.right_hand--;
					}
					instance_destroy();
				}
			 } else { // enemy unit dies:
				 if (type == __unit.RAM) {
					 unit_create(__unit.RAM_KNIGHT, xpos, ypos);
					 var _x = choose(1, -1);
					 var _cell = unit_find(xpos + _x, ypos);
					 if (_cell != noone) {
						 _x *= -1;
						 _cell = unit_find(xpos + _x, ypos);
					 }
					 if (_cell == noone) unit_create(__unit.RAM_KNIGHT, xpos + _x, ypos);
				 }
			}
			xpos = noone;
			ypos = noone;
			instance_destroy();
		}
	}
}