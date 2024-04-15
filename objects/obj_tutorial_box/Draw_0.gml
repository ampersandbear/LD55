
draw_set_color(c_black);
draw_rectangle(x, y, x + width, y + height, false);
draw_set_color(c_white);

var _text = tutorial_text[global.tutorial];
scribble(_text)./*starting_format("fnt_main", c_gray).*/wrap(width - 10).draw(x + 8, y + 6);

if (button_id != noone) with (button_id) event_perform(ev_draw, ev_draw_normal);