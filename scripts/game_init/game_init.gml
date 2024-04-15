function game_init(){
	
	window_set_caption(game_name + " v" + string(game_version));
	set_window_scale();
	
	scribble_font_set_default("fnt_main");
	build_data();
	
	global.music_volume = 0//0.5;
	global.sfx_volume = 1;
	
	music_play( mus_hydra);
}

// custom jaime scripts:
function shader_set_color(_color, _alpha = 1)
{
	shader_set(shd_color);
	shader_set_uniform_f(shader_get_uniform(shd_color,"c_colour")
						,color_get_red(  _color)/255
						,color_get_green(_color)/255
						,color_get_blue( _color)/255
						,_alpha);	
}
function vfx_create(_sprite, _x, _y, _xscale_lerp = 0, _yscale_lerp = 0)
{
	with instance_create_depth(_x, _y, -100, obj_vfx)
	{
		sprite_index = _sprite;
		image_index  = 0;
		image_speed  = random_range( 0.95, 1.05);
		
		image_xscale_lerp = _xscale_lerp;
		image_yscale_lerp = _yscale_lerp;
		
		return id;
	}
}

function transition_to(_room, _speed = 0.05)
{
	with obj_control
	{
		transition_speed = _speed;
		transition_room = _room;
	}
}