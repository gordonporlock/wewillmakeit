draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

// Background box
draw_set_color(make_color_rgb(0,0,0));
draw_rectangle(32, room_height - 96, room_width - 32, room_height - 32, false);
draw_set_color(c_white);

// Draw current dialogue line
if (array_length(dialogues) > 0 && current_line < array_length(dialogues)) {
    draw_text(48, room_height - 80, dialogues[current_line]);
}
