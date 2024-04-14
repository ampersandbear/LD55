//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 c_colour;

void main()
{
    /* Colorize */
    vec4 col =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if(c_colour.a >= 1.0)
	{
		col.r = c_colour.r;
		col.g = c_colour.g;
		col.b = c_colour.b;
	}
	else
	{
		col.r = col.r + (c_colour.r-col.r)*c_colour.a;
		col.g = col.g + (c_colour.g-col.g)*c_colour.a;
		col.b = col.b + (c_colour.b-col.b)*c_colour.a;
	}
    
    gl_FragColor = col;
}
