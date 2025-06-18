// Movement variables
xsp = 0;
ysp = 0;
move_speed = 2;
jump_speed = 3.5;

// Speech timer for encouragement bubble logic (optional)
speak_timer = 0;

// Campfire interaction cooldown
ignore_campfire_timer = room_speed * 2;
touching_campfire_last = false;

// Global flags
if (!variable_global_exists("dialogue_locked"))  global.dialogue_locked = false;
if (!variable_global_exists("dialogue_index"))   global.dialogue_index = 0;
if (!variable_global_exists("p1_speak"))         global.p1_speak = false;
if (!variable_global_exists("p1_down"))          global.p1_down = false;
if (!variable_global_exists("encouragement"))    global.encouragement = false;
if (!variable_global_exists("jump_boost_power")) global.jump_boost_power = 6;
