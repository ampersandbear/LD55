//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    /* Colorize */
    vec4 col =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    float lum= 0.21*col.r + 0.72*col.g + 0.07*col.b;
    
    if(lum > 0.66){
        col.r= 0.0; col.g= 0.0; col.b= 0.0;
    }
    else if(lum > 0.33 ){
        col.r= 0.9; col.g= 0.0; col.b= 0.0;
    }
    else {
        col.r= 1.0; col.g=  0.87; col.b= 0.0;
    }
    
    gl_FragColor = col;
}
