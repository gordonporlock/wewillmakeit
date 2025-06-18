if (global.dialogue_locked) {
    // stop movement & input
    xsp = 0;
    ysp = 0;
    exit;
}


// Stop input if dialogue active
if (global.dialogue_locked) {
    xsp = 0; ysp = 0;
    exit;
}

// Gravity
ysp += 0.1;
xsp = 0;

// Movement input
if (keyboard_check(vk_left)) xsp = -3;
if (keyboard_check(vk_right)) xsp = 3;

// Jump boost only if encouraged (Player2 pressed S)
var encouraged = global.encouragement;

// Jump logic for Player1
if (place_meeting(x, y + 1, oCollision)) {
    ysp = 0;
    if (keyboard_check(vk_up)) {
        ysp = encouraged ? -global.jump_boost_power : -2;
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
