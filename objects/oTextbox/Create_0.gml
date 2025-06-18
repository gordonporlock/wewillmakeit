// Count down and destroy when finished
life = room_speed * 2;

// Initialize dialogues array to empty if not assigned yet
if (!variable_instance_exists(id, "dialogues")) {
    dialogues = [];
}

current_line = 0;
