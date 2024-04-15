if (room == rm_game) {
	
	if (global.music_tracks[1] == noone || global.wave == -1) {
		music_play(mus_hydra, 1);
	} else {
		audio_resume_sound(global.music_tracks[1]);
		audio_sound_gain(global.music_tracks[1], global.music_volume, 300);
	}
	
	if (global.wave == -1) {
		with (all) if (!persistent) instance_destroy();
		// create the board:
		for (var i = 0; i < board_width; i++) {
			for (var j = 0; j < board_height; j++) {
				var _cell = instance_create_depth(
					cell_xstart + i * cell_width,
					cell_ystart + j * cell_height,
					15,
					obj_cell
				);
				_cell.xpos = i;
				_cell.ypos = j;
				_cell.tile = (i + j) mod 2 * 2 + irandom(1);
			}
		}

		card_create_on_start(__card.SUPERHEAD, 3);
		btn_create(__btn.END_TURN, 505, 60);
		btn_create(__btn.RESHUFFLE, 505, 125);
		
		global.card_drag = noone;
		global.card_picked = false;
		global.hand_size = 1;
		global.left_hand = 3;
		global.right_hand = 3;
		global.unit_to_move = noone;
		global.replace_used = false;
		global.gameover = false;
		global.pause = false;
		global.attack_preview = array_create( 7, 0);
		global.master_trinkets = [];
		global.master_hp = card_data[__card.SUPERHEAD].card_hp;
		global.master_hp_max = global.master_hp;
		
		ds_list_clear(deck);
		ds_list_add(deck, new card(__card.ATK, []), new card(__card.STUN, []));
	}
	
	ds_list_copy(temp_deck, deck);
	ds_list_shuffle(temp_deck);
	card_draw_from_deck( false);
	
	global.wave++;
	global.replace_used = false;
	
	ds_list_copy(temp_wave_data, wave_data[global.wave]);
	ds_list_shuffle(temp_wave_data);
	spawn_enemy();
	
	with (obj_unit) if (head) {
		if (type == __card.SUPERHEAD) { // move the head in the middle:
			owner.card_pos = 3;
			owner.x = card_xstart + owner.card_pos * card_width;
			owner.lerp_x = owner.x;
			xpos = owner.card_pos;
			owner.trinkets = global.master_trinkets;
			hp = global.master_hp;
			hp_max = global.master_hp_max;
		} else { // destroy all heads:
			instance_destroy();
		}
	}
}