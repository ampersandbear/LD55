event_inherited();
active = true;

lerp_x = 0;
lerp_y = 0;

nudge_x = 0;
nudge_y = 0;

drag = false;
drag_x = 0;
drag_y = 0;
drag_xstart = 0;
drag_ystart = 0;

in_hand = false;
in_deck = false;
card_pos = 3;
temp_card_pos = 3;

pulse = 0;
pulse_color = c_white;
pulse_alpha = 1;

unit = noone;
type = noone;
hp = 0;
hp_max = 0;
name = "";
desc = "";
color = c_white;
sprite = noone;
ability_used = false;
is_trinket = false;
trinkets = [];
trinket_used = array_create(trinket_total_count, false);
covered = false;