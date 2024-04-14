function game_init(){
	
	window_set_caption(game_name + " v" + string(game_version));
	set_window_scale();
	
	scribble_font_set_default("fnt_main");
	build_data();
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
function vfx_create(_sprite, _x, _y)
{
	with instance_create_depth(_x, _y, -100, obj_vfx)
	{
		sprite_index = _sprite;
		image_index  = 0;
		image_speed  = random_range( 0.95, 1.05);
	}
}