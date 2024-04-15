/// @description Transition
transition += transition_speed;
if transition > transition_max_alpha { 
	if (transition_room != noone) {
		room_goto(transition_room);
		transition_speed = -transition_speed;
	} else transition_speed = 0;
}
else if transition < 0 { transition = 0; transition_speed = 0; }

if transition > 0
{
	draw_set_color(c_black);
	draw_set_alpha(transition);
	
	draw_rectangle(0,0,game_width,game_height, false);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
}

