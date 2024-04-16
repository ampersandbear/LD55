active = 
	global.card_drag == noone
	&& !covered
	&& (type != __card.BUFF || !in_hand)
	&& obj_control.alarm[1] <= 0
	&& !global.gameover
	&& !global.pause
	&& !global.tutorial_pause;
	
event_inherited();
if (!active) mouseover = false;

if (drag) {
    x = mouse_x - drag_x;
    y = mouse_y - drag_y;
    depth = -10000;
	if (instance_exists(unit)) unit.depth = depth;
	//card_pos = clamp((x + 45) div 91, global.left_hand - 1, global.right_hand + 1);
	card_pos = clamp((x + 45) div 91, 0, 6);
	
    if (mouse_check_button_released(mb_left))
	{
		event_user(2);
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