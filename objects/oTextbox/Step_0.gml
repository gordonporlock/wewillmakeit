// step
life -= 1;
if (life <= 0) {
    instance_destroy();
}

// Check for movement key press from either player
var input_pressed = keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)
                 || keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(ord("S"));

if (input_pressed) {
    current_line += 1;

    // If no more lines, destroy textbox and unlock dialogue
    if (current_line >= array_length(dialogues)) {
        global.dialogue_locked = false;
        instance_destroy();
    }
}
