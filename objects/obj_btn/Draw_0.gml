var _x = floor(x + width / 2);
var _y = floor(y + height / 2)-1;

draw_sprite_stretched(spr_btn_9_sliced, mouseover, x, y, width, height);

if mouseover
	scribble("[fa_middle][fa_center][fnt_huge]" + text).draw(_x, _y);
else
	scribble("[fa_middle][fa_center][fnt_huge][#d9e7ea]" + text).draw(_x, _y);