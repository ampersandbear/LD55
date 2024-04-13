if (ypos > 3) {
	sprite = card_data[type].unit_sprite;
	hp	   = card_data[type].card_hp;
	hp_max = hp;
	head = true;
	
} else {
	sprite = unit_data[type].unit_sprite;
	hp	   = unit_data[type].unit_hp;
	atk	   = unit_data[type].unit_atk;
	melee  = unit_data[type].unit_melee;
	hp_max = hp;
}