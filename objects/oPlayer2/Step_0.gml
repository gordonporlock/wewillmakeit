if (global.dialogue_locked) {
    // stop movement & input
    xsp = 0;
    ysp = 0;
    exit;
}


// Gravity
ysp += 0.25;
xsp = 0;

// Movement input
if (keyboard_check(ord("A"))) xsp = -move_speed;
if (keyboard_check(ord("D"))) xsp = move_speed;

// Encourage bubble cooldown
if (encourage_cooldown > 0) {
    encourage_cooldown -= 1;
}

// Find Player1 instance
var p1 = noone;
if (object_exists(oPlayer1)) {
    p1 = instance_find(oPlayer1, 0);
}

var boost_radius = 40; // Radius for Player2 jump boost

// Check if Player2 is inside radius of Player1
var near1 = (p1 != noone) && point_distance(x, y, p1.x, p1.y) <= boost_radius;

// Spawn encouragement bubble only when Player2 presses S, no cooldown, no bubble active
if (keyboard_check_pressed(ord("S")) && encourage_bubble == noone && encourage_cooldown <= 0) {
    encourage_bubble = instance_create_layer(x, y - sprite_height - 4, "Instances", oEncourageText);
    encourage_bubble.speaker = id;
    encourage_bubble.owner_ref = id;
    global.encouragement = true;  // Player2 starts encouragement
}

// While holding S, keep encouragement true; else false
if (keyboard_check(ord("S"))) {
    global.encouragement = true;
} else {
    global.encouragement = false;
}

// Jump logic for Player2
if (place_meeting(x, y + 1, oCollision)) {
    ysp = 0;
    if (keyboard_check(ord("W"))) {
        ysp = near1 ? -global.jump_boost_power : -jump_speed; // jump boost automatically inside radius
    }
}

// Move and collide
move_and_collide(xsp, ysp, oCollision);

// Clamp inside room
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

// Campfire dialogue (optional)
if (ignore_campfire_timer > 0) {
    ignore_campfire_timer -= 1;
}
var touching_campfire_now = object_exists(oCampfire) ? place_meeting(x, y, oCampfire) : false;
if (ignore_campfire_timer <= 0 && object_exists(oCampfire)) {
    var campfire = instance_place(x, y, oCampfire);
    if (campfire != noone) {
        if (touching_campfire_now && !touching_campfire_last) {
            if (!campfire.dialogue_done && !global.dialogue_locked) {
                global.dialogue_locked = true;
                global.dialogue_index = 0;
                campfire.dialogue_done = true;
                var tbox = instance_create_layer(x, y - 32, "Instances", oTextbox);
                tbox.dialogues = campfire.dialogues;
            }
        }
    }
}
touching_campfire_last = touching_campfire_now;
