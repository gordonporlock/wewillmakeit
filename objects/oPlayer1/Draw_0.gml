// Draw the player sprite
draw_self();

// Draw jump boost radius circle (radius = 64 pixels)
draw_set_color(c_gray);
draw_set_alpha(0.3);
draw_circle(x, y, 30, false);
draw_set_alpha(1);
