if (!active) exit;

if (distance_to_point(mouse_x, mouse_y) == 0) {
    mouseover = true;
    event_user(1);
    if (mouse_check_button_pressed(mb_left)) {
        event_user(0);
    }
} else {
    mouseover = false;
}