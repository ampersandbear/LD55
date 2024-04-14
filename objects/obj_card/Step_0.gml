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
			
			// Hypnohead ability:
			if (global.unit_to_move != noone) {
				unit_move(global.unit_to_move, card_pos, global.unit_to_move.ypos);
				global.unit_to_move = noone;
			}
			
			// Quickhead ability:
			if (type == __card.QUICK && !ability_used) {
				var _unit = unit_find_up(card_pos);
				if (_unit != noone) unit_take_damage(_unit, 2)
				ability_used = true;
			}
			
			
			with (obj_card) if (in_hand) { 
				if (card_pos == other.card_pos) {
					in_hand = false;
					x = card_draw_xstart;
					y = card_draw_ystart;
					_replace = true;
					if (type == __card.MOVE) {
						global.unit_to_move = unit_find_up(card_pos);
					}
				}
			}
			
			drag = false;
			in_hand = true;
			mouseover = false;
			active = false;
			unit.xpos = card_pos;
			y = card_ystart;
			x = card_xstart + card_pos * card_width;
			

			
			if (card_pos < global.left_hand) {
				global.left_hand--;
			}
			if (card_pos > global.right_hand) {
				global.right_hand++;
			}
			if (!_replace) {
				//card_draw();
				global.hand_size++;
				global.card_picked = true;
			}
		} else { // cancel dragging:
			drag = false;
	        global.card_drag = noone;
			with (unit) instance_destroy();
			unit = noone;
			x = drag_xstart;
			y = drag_ystart;
		}
    }
	exit;
}

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