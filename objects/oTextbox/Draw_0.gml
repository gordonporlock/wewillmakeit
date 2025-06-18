// Draw encouragement text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x, y, "You can do it!");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_set_color(make_color_rgb(0,0,0));
draw_rectangle(32, room_height - 96, room_width - 32, room_height - 32, false);
draw_set_color(c_white);

if (array_length(dialogues) > 0 && current_line < array_length(dialogues)) {
    draw_text(48, room_height - 80, dialogues[current_line]);
}
