// Draw the player sprite
draw_self();

<<<<<<< Updated upstream
// Draw jump boost radius circle (radius = 64 pixels)

	
	
=======
// Calculate distance between Player1 (this) and Player2
var dist_to_p2 = point_distance(x, y, oPlayer2.x, oPlayer2.y);

// Choose color based on distance
if (dist_to_p2 <= 30) {
    draw_set_color(c_blue);
} else {
    draw_set_color(c_gray);
}

// Draw the jump boost radius circle (offset upward)
draw_set_alpha(0.3);
draw_circle(x, y - 16, 30, false); // <- offset circle 16 pixels higher
draw_set_alpha(1);
>>>>>>> Stashed changes
