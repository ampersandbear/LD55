

switch (type) {
	case __btn.END_TURN:
		with (obj_unit) acted = false;
		with (obj_control) alarm[1] = 1;
	break;
	
	case __btn.EXIT_SHOP:
		transition_to(rm_game);
	break;
}