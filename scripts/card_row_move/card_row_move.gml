function card_row_move(_dir){ // 1 : right, -1 : left
	var _me = id;
	temp_card_pos += _dir;
	
	with (obj_card) if (id != _me && in_hand && temp_card_pos == _me.temp_card_pos) {
		card_row_move(_dir);
	}
}