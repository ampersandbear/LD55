if (type == noone) exit;

draw_sprite(spr_card, 1, x, y);

draw_set_halign(fa_center);
scribble("[fa_center]" + card_data[type].card_name).draw(x + card_width / 2, y + 10);
scribble("[fa_center]" + card_data[type].card_desc).wrap(card_width).draw(x + card_width / 2, y + 10);