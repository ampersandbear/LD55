draw_self();

scribble("[fa_center][fnt_bold]You made it to wave " + string(global.wave + 1) + "!").draw(x, y + 50);
scribble("[fa_center][fnt_bold][#EECE61]Best wave: " + string(global.best_wave + 1)).draw(x, y + 70);

if (time < 1) time += 0.05;
y = ystart + (y_end - ystart) * ease_out(time);

with (obj_btn) if (menu) {
	y = other.y + ystart * -1;
	event_perform(ev_draw, ev_draw_normal);
}