/// @description card dropped

audio_pplay( sfx_card_drop);
	
var _can_play = y > 100 || drag_ystart > 100;
		
with (obj_card) if (in_hand && card_pos == other.card_pos) { 
	if (type == __card.BUFF || (type == __card.SUPERHEAD 
								&& has_trinket(__trinket.SHUFFLE, other) 
								&& !other.trinket_used[__trinket.CARD_DRAW])
	){
		pulse = 9;
		pulse_color = c_black;
		pulse_alpha = 0.35;
				
		audio_pplay( sfx_bonk, 0.55,, 1.25);
				
		_can_play = false;
	}
}
		
if (room == rm_shop) {
	_can_play = y > 100 && drag_ystart < 100;
	if (is_trinket) {
		var _card_to_upgrade = noone;
		with (obj_card)
		{
			if (in_deck && card_pos == other.card_pos)
			{
				if can_equip_trinket(other.type)
					_card_to_upgrade = id;
				else
				{
					/*nudge_x = choose(1,2,3)*choose(-1,1);
					nudge_y = choose(1,2,3)*choose(-1,1);
							
					pulse = 9;
					pulse_color = c_black;
					pulse_alpha = 0.35;
							
					audio_pplay( sfx_bonk, 0.55,, 1.25);*/
				}
				break;
			}
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
			tutorial_proceed(4);
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
	if (has_trinket(__trinket.CARD_DRAW) && !trinket_used[__trinket.CARD_DRAW]) {
		card_draw_from_deck();
		trinket_used[__trinket.CARD_DRAW] = true;
	}
			
	with (obj_card) covered = false;
			
	with (obj_card) if (in_hand) { 
		if (card_pos == other.card_pos) {
			if (other.drag_ystart < 100) {
				instance_destroy(unit, false);
				unit = noone;
				
				// shuffle trinket:
				if (has_trinket(__trinket.SHUFFLE, other) && !trinket_used[__trinket.SHUFFLE]) {
					ds_list_add(temp_deck, new card(type, trinkets));
					ds_list_shuffle(temp_deck);
					trinket_used[__trinket.SHUFFLE] = true;
					instance_destroy();
				} else {
					in_hand = false;
					x = card_draw_xstart;
					y = card_draw_ystart;
					var _card = instance_place(x, y, obj_card);
					if (_card != noone) {
						y += 17;
						_card.covered = true;
					}
				}
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
	
	if (type == __card.ATK && unit_find(card_pos, 0) != noone) tutorial_proceed(3);
			
	var _cards_to_pick = 0;
	with (obj_card) if (!in_hand) _cards_to_pick++;
	global.card_picked = (_cards_to_pick == 0);
	if (global.card_picked) tutorial_proceed(1);

} else { // cancel dragging:
	drag = false;
	global.card_drag = noone;
	x = drag_xstart;
	y = drag_ystart;
	if (drag_ystart < 100) { // return to the draw pile:
		if (instance_exists(unit)) instance_destroy(unit, false);
		unit = noone;
	} else { // unit placed on top of Hothead:
		card_pos = clamp((x + 45) div 91, 0, 6);
		if (instance_exists(unit)) unit.xpos = card_pos;
	}
}
