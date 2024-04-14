

switch (type) {
	case __btn.END_TURN:
		with (obj_unit) acted = false;
		global.card_picked = false;
		with (obj_control) alarm[1] = 1;
	break;
	
	case __btn.EXIT_SHOP:
		room_goto(rm_game);
	break;
}