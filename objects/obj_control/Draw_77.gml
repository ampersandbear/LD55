/// @description Draw application surface
var _x = 0;
var _y = 0;

// scale
var _scale = window_get_height()/game_height;

// SCREENSHAKE
if screenshake_time > 0
{
	var deg = screenshake_direction;
	if  deg == noone			{ deg = irandom(360); }
	else if irandom(100) > 50	{ deg += 180;         }
	
	_x += (round(cos(degtorad(deg))*screenshake) + nudge_x)*_scale;
	_y += (round(sin(degtorad(deg))*screenshake) + nudge_y)*_scale;
	screenshake -= screenshake_less;
	if(screenshake < 0) { screenshake = 0; }
	screenshake_time -= 1;
}
else
{
	_x += nudge_x*_scale;
	_y += nudge_y*_scale;
}

// nudge lerp
nudge_x = lerp( nudge_x, 0, 0.25);
nudge_y = lerp( nudge_y, 0, 0.25);

draw_surface( application_surface, _x, _y);