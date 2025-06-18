if (global.dialogue_locked) {
    xsp = 0;
    ysp = 0;
    exit;
}

// Gravity
ysp += 0.25;
xsp = 0;

// Input
if (keyboard_check(ord("A"))) xsp = -move_speed;
if (keyboard_check(ord("D"))) xsp = move_speed;

// Encourage bubble cooldown
if (encourage_cooldown > 0) {
    encourage_cooldown -= 1;
}

// Find Player1
var p1 = object_exists(oPlayer1) ? instance_find(oPlayer1, 0) : noone;
var near1 = (p1 != noone) && point_distance(x, y, p1.x, p1.y) <= 40;

// Encouragement bubble
if (keyboard_check_pressed(ord("S")) && encourage_bubble == noone && encourage_cooldown <= 0) {
    encourage_bubble = instance_create_layer(x, y - sprite_height - 4, "Instances", oEncourageText);
    encourage_bubble.speaker = id;
    encourage_bubble.owner_ref = id;
    global.encouragement = true;
}

// Hold encouragement
global.encouragement = keyboard_check(ord("S"));

// Ground check
var grounded = place_meeting(x, y + 1, oCollision);

// Jumping
if (grounded && keyboard_check(ord("W"))) {
    ysp = near1 ? -global.jump_boost_power : -jump_speed;
}


// Horizontal movement
if (place_meeting(x + xsp, y, oCollision)) {
    while (!place_meeting(x + sign(xsp), y, oCollision)) {
        x += sign(xsp);
    }
    xsp = 0;
}
x += xsp;

// Vertical movement
if (place_meeting(x, y + ysp, oCollision)) {
    while (!place_meeting(x, y + sign(ysp), oCollision)) {
        y += sign(ysp);
    }
    ysp = 0;
}
y += ysp;

// Clamp inside room
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);


// Campfire dialogue 
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
