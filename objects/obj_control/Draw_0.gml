draw_sprite(spr_hydra_body, 0, game_width / 2, 330);
scribble("[fa_right][fnt_huge]WAVE\n" + string(global.wave + 1) + "/" + string(wave_total_count + 1)).transform(2, 2, 0).line_height(14, 14).draw(160, 30);
