active = global.card_drag == noone;
event_inherited();

if (drag) {
    x = mouse_x - drag_x;
    y = mouse_y - drag_y;
    depth = -10000;
	if (instance_exists(unit)) unit.depth = depth;
	//card_pos = clamp((x + 45) div 91, global.left_hand - 1, global.right_hand + 1);
	card_pos = clamp((x + 45) div 91, 0, 6);
	
    if (mouse_check_button_released(mb_left)) {
		
		var _can_play = y > 100 || drag_ystart > 100;
		if (room == rm_shop) _can_play = y > 100 && drag_ystart < 100;
		
		if (_can_play) { // play the card:
			
			var _replace = false;
			global.card_drag = noone;
			
			// if in shop, add a card to your deck:
			if (room == rm_shop) { 
				ds_list_add(deck, type);
				ds_list_shuffle(deck);
				ds_list_copy(temp_deck, deck);
				x = shop_deck_xstart + ds_list_size(deck) * card_width;
				y = shop_deck_ystart;
				drag = false;
				with (obj_card) if (y < 100) instance_destroy();
				btn_create(__btn.EXIT_SHOP, 270, 110);
				exit;
			}
			
			// Hypnohead ability:
			if (type == __card.MOVE && global.unit_to_move != noone) {
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
					if (other.drag_ystart < 100) {
						in_hand = false;
						x = card_draw_xstart;
						y = card_draw_ystart;
						instance_destroy(unit, false);
						unit = noone;
					} else {
						x = other.drag_xstart;
						y = other.drag_ystart;
						card_pos = clamp((x + 45) div 91, 0, 6);
						unit.xpos = card_pos;
					}
					_replace = true;
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
			
			var _cards_to_pick = 0;
			with (obj_card) if (!in_hand) _cards_to_pick++;
			global.card_picked = (_cards_to_pick == 0);

		} else { // cancel dragging:
			drag = false;
	        global.card_drag = noone;
			instance_destroy(unit, false);
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