if (head) with (owner) {
	if (card_pos == global.left_hand) {
		global.left_hand++;
	} else if (card_pos == global.right_hand) {
		global.right_hand--;
	}
	instance_destroy();
}