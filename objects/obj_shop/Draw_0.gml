scribble("[fnt_bold][fa_center]Choose a card to add to your deck").draw(game_width / 2, 40);
scribble("[fnt_bold]Your deck:").draw(10, 230);

draw_text(20, 20, "deck size: " + string(ds_list_size(deck)))
draw_text(20, 40, "wave: " + string(global.wave))