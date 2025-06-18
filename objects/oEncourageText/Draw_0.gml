// Set default font (or a specifically small font resource if you have one)
draw_set_font(-1);  // Default small font

// Set color to white
draw_set_color(c_white);

// No scaling, just normal size text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the text at (x, y)
draw_text(x, y, "You can do it!");
