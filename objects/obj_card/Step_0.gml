active = !in_hand;
event_inherited();

if (drag) {
    x = mouse_x - drag_x;
    y = mouse_y - drag_y;
    depth = -10000;
	if (instance_exists(unit)) unit.depth = depth;
	card_pos = clamp((x + 45) div 91, global.left_hand - 1, global.right_hand + 1);
	
	// shift the cards in hand:
	/*with (obj_card) if (in_hand) { 
		temp_card_pos = card_pos;
	}*/
	with (obj_card) if (in_hand) { 
		if (card_pos == other.card_pos) {
			
			//var _dir = ((other.x + 45) mod 91 > 45) ? -1 : 1;
			
			/*if (_dir == 1) {
				if (card_pos == global.left_hand && global.right_hand > global.left_hand) _dir = -1; // don't move the leftmost card to the right
			}
			if (_dir == -1) {
				if (card_pos == global.left_hand && global.right_hand > global.left_hand) _dir = -1; // don't move the leftmost card to the right
			}*/
			//card_row_move(_dir);
		}
	}
	
	
    if (mouse_check_button_released(mb_left)) {
		if (y > 100) { // play the card:
			
			var _replace = false;
			global.card_drag = noone;
			
			with (obj_card) if (in_hand) { 
				if (card_pos == other.card_pos) {
					in_hand = false;
					x = card_xstart + 3 * card_width;//mouse_x - 45;
					y = 45;//mouse_y - 55;
					draw_x = x;
					//event_user(0);
					_replace = true;
				}
			}
			
			
			drag = false;
			in_hand = true;
			mouseover = false;
			active = false;
			temp_card_pos = card_pos;
			y = card_ystart;
			if (card_pos < global.left_hand) {
				global.left_hand--;
			}
			if (card_pos > global.right_hand) {
				global.right_hand++;
			}
			if (!_replace) {
				card_draw();
				global.hand_size++;
			}
		} else { // cancel dragging:
			drag = false;
	        global.card_drag = noone;
			with (unit) instance_destroy();
			unit = noone;
			with (obj_card) if (in_hand) temp_card_pos = card_pos;
			x = drag_xstart;
			y = drag_ystart;
		}
    }
	exit;
}

if (global.card_drag == noone) draw_x = card_xstart + temp_card_pos * card_width;
depth = mouseover ? -10000 : card_default_depth;
if (instance_exists(unit)) unit.depth = unit_default_depth;

/*

var _card = instance_place(x, y, obj_card);
// move cards to account for the one that is dragged:
if (_card != noone && _card.drag && !_card.in_hand) {
	draw_x = drag_xstart + card_width;
} else {
	draw_x = drag_xstart;
}