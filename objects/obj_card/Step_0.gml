active = global.card_drag == noone && !covered;
event_inherited();

if (drag) {
    x = mouse_x - drag_x;
    y = mouse_y - drag_y;
    depth = -10000;
	if (instance_exists(unit)) unit.depth = depth;
	//card_pos = clamp((x + 45) div 91, global.left_hand - 1, global.right_hand + 1);
	card_pos = clamp((x + 45) div 91, 0, 6);
	
    if (mouse_check_button_released(mb_left))
	{
		audio_pplay( sfx_card_drop);
		
		var _can_play = y > 100 || drag_ystart > 100;
		if (room == rm_shop) {
			_can_play = y > 100 && drag_ystart < 100;
			if (is_trinket) {
				var _card_to_upgrade = noone;
				with (obj_card) if (in_deck && card_pos == other.card_pos && array_length(trinkets) < max_trinkets && !has_trinket(other.type)) {
					_card_to_upgrade = id;
					break;
				}
				if (_card_to_upgrade == noone) _can_play = false;
			}
		}
		
		if (_can_play) { // play the card:
			
			var _replace = false;
			global.card_drag = noone;
			
			// if in shop
			if (room == rm_shop) { 
				if (is_trinket) { // equip trinket:
					array_push(_card_to_upgrade.trinkets, type);
					if (type == __trinket.HP) with (_card_to_upgrade) {
						apply_hp_trinket();
						if (type == __card.SUPERHEAD) {
							global.master_hp = hp;
							global.master_hp_max = hp_max;
							global.master_trinkets = trinkets;
						}
					}
					instance_destroy();
				} else { // add a card to the deck:
					ds_list_add(deck, new card(type, []));
					x = shop_deck_xstart + ds_list_size(deck) * card_width;
					y = shop_deck_ystart;
					drag = false;
				}
				with (obj_card) if (y < 100) instance_destroy();
				btn_create(__btn.EXIT_SHOP, 270, 110);
				exit;
			}
			
			if (drag_ystart < 100) global.replace_used = true;
			
			// Hypnohead ability:
			if (type == __card.MOVE && global.unit_to_move != noone) {
				unit_move(global.unit_to_move, card_pos, global.unit_to_move.ypos);
				global.unit_to_move = noone;
			}
			
			// Quickhead ability:
			if (type == __card.QUICK && !ability_used) {
				with (unit) {
					xpos = other.card_pos;
					head_attack(2);
				}
				ability_used = true;
			}
			
			// Ragehead ability:
			if (type == __card.STUN_ON_SUMMON && !ability_used) {
				with (obj_unit) if (!head) { unit_stun(id); }
				ability_used = true;
			}
			
			// Draw a card trinket:
			if (has_trinket(__trinket.CARD_DRAW) && !trinket_used) {
				card_draw_from_deck();
				trinket_used = true;
			}
			
			with (obj_card) covered = false;
			
			with (obj_card) if (in_hand) { 
				if (card_pos == other.card_pos) {
					if (other.drag_ystart < 100) {
						in_hand = false;
						x = card_draw_xstart;
						y = card_draw_ystart;
						var _card = instance_place(x, y, obj_card);
						if (_card != noone) {
							y += 17;
							_card.covered = true;
						}
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
if (covered) depth++;

/*

var _card = instance_place(x, y, obj_card);
// move cards to account for the one that is dragged:
if (_card != noone && _card.drag && !_card.in_hand) {
	draw_x = drag_xstart + card_width;
} else {
	draw_x = drag_xstart;
}