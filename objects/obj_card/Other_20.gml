/// @description card init

if (type == noone) exit;

show_debug_message(type, card_data)


name   = card_data[type].card_name;
desc   = card_data[type].card_desc;
color  = card_data[type].card_color;
hp	   = card_data[type].card_hp;
sprite = card_data[type].unit_sprite;
hp_max = hp;

drag_xstart = x;
ability_used = false;