/// @description 
if image_xscale_lerp != 0 { image_xscale = lerp( image_xscale, 0, image_xscale_lerp); }
if image_yscale_lerp != 0 { image_yscale = lerp( image_yscale, 0, image_yscale_lerp); }
// destroy?
if abs(image_xscale) <= 0.35 or abs(image_yscale) <= 0.35 { instance_destroy(); }