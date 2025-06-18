// Set font resource (replace with your font or use default)
draw_set_font(fnt_Large);

// Text color white
draw_set_color(c_white);

// Get current dialogue line text width and height
var text = "";
if (array_length(dialogues) > 0 && current_line < array_length(dialogues)) {
    text = dialogues[current_line];
}
var text_width = string_width(text);
var text_height = string_height(text);

// Minimum and maximum box width
var min_width = 400;
var max_width = 800;

// Calculate box width based on text width, clamped
var box_width = clamp(text_width + 64, min_width, max_width);
var box_height = 100;

// Center box horizontally
var box_x = (display_get_gui_width() - box_width) / 2;
var box_y = display_get_gui_height() - box_height - 32;

// Draw semi-transparent black background
draw_set_alpha(0.5);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
draw_set_alpha(1);

// Draw centered text inside the box
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(box_x + box_width / 2, box_y + box_height / 2, text);
