// Listen for movement keys from either player to advance dialogue lines
var advance = keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)
           || keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(ord("S"));

if (advance) {
    current_line += 1;
    if (current_line >= array_length(dialogues)) {
        global.dialogue_locked = false;  // Unlock player movement when done
        instance_destroy();              // Remove dialogue box
    }
}
