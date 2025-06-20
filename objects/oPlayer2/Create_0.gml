// Movement system
xsp = 0;
ysp = 0;

// Movement parameters
move_speed = 2;
jump_speed = 3.5;
courage_move_speed = 3;
courage_jump_speed = 5.5;

// Courage system
courage = true;
courage_timer = 2;
courage_distance = 56;

// Legacy movement vars (optional)
move_x = 0;
move_y = 0;

// Collision tilemap layer
collision_tiles = layer_tilemap_get_id("Tiles");

// Input keys
right = ord("D");
left  = ord("A");
up    = ord("W");
down = ord("S");

// Other player reference
p1 = instance_find(oPlayer1, 0);
distance = 0;
near1 =point_distance(x, y, p1.x, p1.y) <= 40

// Encouragement system
p2_is_encouraging  = false;
encourage_bubble   = noone;
encourage_cooldown = 1000;

// Speech timer for down key usage
speak_timer = 6;

// Death/restart logic
restarting = false;

// Campfire interaction
ignore_campfire_timer = room_speed * 2;
touching_campfire_last = false;

// Global safety checks
if (!variable_global_exists("jump_boost_range"))  global.jump_boost_range = 64;
if (!variable_global_exists("jump_boost_power")) global.jump_boost_power = 6;
if (!variable_global_exists("dialogue_locked"))  global.dialogue_locked = false;
if (!variable_global_exists("p1_down"))          global.p1_down = false;
if (!variable_global_exists("p1_speak"))         global.p1_speak = false;
if (!variable_global_exists("encouragement"))    global.encouragement = false;
