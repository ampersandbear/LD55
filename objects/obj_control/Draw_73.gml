/// @description Transition
transition += transition_speed;
if transition > 1.1 { transition_speed = -transition_speed; room_goto( transition_room); }
else if transition < 0 { transition = 0; transition_speed = 0; }

if transition > 0
{
	draw_set_color(c_black);
	draw_set_alpha(transition);
	
	draw_rectangle(0,0,game_width,game_height, false);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
}