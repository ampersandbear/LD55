enum __card {
	SUPERHEAD,
	ATK,
	MOVE,
	BLOCK,
	QUICK,
	BUFF,
	STUN,
	STUN_ON_SUMMON
}

enum __unit {
	PEASANT,
	KNIGHT,
	MAGE,
	ARCHER,
	AXEMAN,
	SPEARMAN,
	RAM,
	RAM_KNIGHT,
	NECRO,
	SKELETON,
	HORSE,
	CHAMPION
}

enum __trinket {
	NONE,
	HP,
	DMG,
	PIERCE,
	CARD_DRAW,
	EXPLODE,
	SHUFFLE
}


enum __btn {
	END_TURN,
	EXIT_SHOP,
	RESHUFFLE,
	RESTART,
	TO_TITLE,
	START,
	TUTORIAL_RESET,
	QUIT,
	RESUME,
	TUTORIAL_NEXT
}

function build_data(){
	
	trace("build_data")
	
	randomize();
	unit_total_count = 0;
	card_total_count = 0;
	wave_total_count = 0;
	trinket_total_count = 0;
	card_data = [];
	unit_data = [];
	wave_data = [];
	trinket_data = [];
	
	deck = ds_list_create(); 
	temp_deck = ds_list_create();
	temp_wave_data = ds_list_create();
	
	if debug { wave_add(__unit.CHAMPION); }
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT);
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT, __unit.MAGE, __unit.MAGE);
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT, __unit.KNIGHT, __unit.KNIGHT, __unit.MAGE, __unit.MAGE);
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT, __unit.KNIGHT, __unit.KNIGHT, __unit.MAGE, __unit.MAGE, __unit.SPEARMAN);
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT, __unit.KNIGHT, __unit.KNIGHT, __unit.MAGE, __unit.MAGE, __unit.SPEARMAN, __unit.ARCHER);
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT, __unit.KNIGHT, __unit.KNIGHT, __unit.MAGE, __unit.MAGE, __unit.SPEARMAN, __unit.ARCHER, __unit.AXEMAN);
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT, __unit.KNIGHT, __unit.KNIGHT, __unit.MAGE, __unit.MAGE, __unit.SPEARMAN, __unit.ARCHER, __unit.AXEMAN, __unit.RAM);
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT, __unit.KNIGHT, __unit.KNIGHT, __unit.MAGE, __unit.MAGE, __unit.SPEARMAN, __unit.ARCHER, __unit.AXEMAN, __unit.RAM, __unit.NECRO);
	wave_add(__unit.PEASANT,__unit.PEASANT,__unit.PEASANT, __unit.KNIGHT, __unit.KNIGHT, __unit.MAGE, __unit.MAGE, __unit.SPEARMAN, __unit.ARCHER, __unit.AXEMAN, __unit.RAM, __unit.NECRO, __unit.KNIGHT);
	
	// use this for procedural waves
	global.wave_procedural = ds_list_create();
	
	card_add("Masterhead", "Takes damage from empty cell attacks", 5, cc_purple, spr_head_purple, spr_neck_purple);
	card_add("Headacher", "Deals [" + cc_atk_string + "]1[spr_atk][/c] every turn", 1, cc_red, spr_head_red, spr_neck_red);
	card_add("Hypnohead", "When moved, moves the opposing enemy", 2, cc_green, spr_head_green, spr_neck_green);
	card_add("Ironhead", "Redirects damage from nearby heads to itself", 5, cc_gray, spr_head_gray, spr_neck_gray);
	card_add("Quickhead", "Deals [" + cc_atk_string + "]2[spr_atk][/c] when summoned", 2, cc_orange, spr_head_orange, spr_neck_orange);
	card_add("Hothead", "Can't move. Nearby heads deal [" + cc_atk_string + "]1[spr_atk][/c] every turn", 1, cc_pink, spr_head_pink, spr_neck_pink);
	card_add("Spikehead", "Stuns attackers when damaged", 3, cc_yellow, spr_head_yellow, spr_neck_yellow);
	card_add("Flashhead", "Stuns all enemies when summoned", 1, cc_light_blue, spr_head_light_blue, spr_neck_light_blue);
	
	trinket_add("", "", 0); // never spawns
	trinket_add("Mean Heart", "+[spr_heart_numbers,2][spr_heart]", 0);
	trinket_add("Duelist", "Deals [" + cc_atk_string + "]1[spr_atk][/c] every turn", 5);
	trinket_add("Fire Breath", "Damage is piercing", 10);
	trinket_add("Breeding", "Draws a card when summoned", 8);
	trinket_add("Explosive", "Deals [" + cc_atk_string + "]2[spr_atk][/c] to the whole column on death", 3);
	trinket_add("Recycling", "If summonned on top of a head, shuffle it to the deck", 7);
	
	unit_add("Farmer", "Melee attack.", 1, 1, true, spr_peasant);
	unit_add("Knight", "Melee attack.", 2, 1, true, spr_knight);
	unit_add("Mage", "Ranged attack.", 1, 1, false, spr_mage);
	unit_add("Archer", "Ranged attack that flies over allies.", 1, 1, false, spr_archer);
	unit_add("Axeman", "Melee attack that targets three heads.", 2, 1, true, spr_axeman);
	unit_add("Spearman", "Melee attack with long reach.", 2, 1, true, spr_spearman);
	unit_add("Battering Ram", "Splits into two Ram Knights on defeat.", 1, 1, true, spr_ram);
	unit_add("Ram Knight", "Melee attack.", 1, 1, true, spr_ram_knight);
	unit_add("Necromancer", "Defeated allies become skeletons.", 3, 1, false, spr_necro);
	unit_add("Skeleton", "Melee attack.", 1, 1, true, spr_skeleton);
	unit_add("Cavalry", "Melee attack. Acts twice each turn.", 2, 1, true, spr_cavalry);
	unit_add("Champion", "Melee attack. Big Boy.", 9, 1, true, spr_champion);
	
	tutorial_text = [
		"You are a [#5F41B0]Hydra![/c] Use your heads to fight off enemy waves.",
		"Heads are cards. [#E74747][shake]Summon[/shake][/c] one now!",
		"You only draw one head from your deck each turn. So [#318472]end the turn[/c] now.",
		"Nice! [c_white]Move[/c] the [#E74747]Headacher[/c] to attack the approaching farmer.",
		"[#7BD568]Mutations[/c] can be used to upgrade head cards from your deck."
	];
}

function card_add(_name, _desc, _hp, _color, _sprite, _neck) {
	
	var _i = card_total_count++;
	
	card_data[_i] = {
		card_id		: _i,
		card_hp		: _hp,
		card_name	: _name,
		card_desc	: _desc,
		card_color	: _color,
		unit_sprite : _sprite,
		neck_sprite : _neck
	};
}

function unit_add(_name, _desc, _hp, _atk, _melee, _sprite){
	var _i = unit_total_count++;
	
	unit_data[_i] = {
		unit_id		: _i,
		unit_hp		: _hp,
		unit_atk	: _atk,
		unit_melee	: _melee,
		unit_name	: _name,
		unit_desc	: _desc,
		unit_sprite : _sprite
	};
}

function wave_add(){
	var _i = wave_total_count++;
	
	wave_data[_i] = ds_list_create(); 
	for (var _j = 0; _j < argument_count; _j++) ds_list_add(wave_data[_i], argument[_j]); 
}

function trinket_add(_name, _desc, _sprite){
	var _i = trinket_total_count++;
	
	trinket_data[_i] = {
		trinket_id			: _i,
		trinket_name		: _name,
		trinket_desc		: _desc,
		trinket_sprite		: _sprite
	};
}

function card(_type, _trinkets) constructor {
	type = _type;
	trinkets = _trinkets;
}