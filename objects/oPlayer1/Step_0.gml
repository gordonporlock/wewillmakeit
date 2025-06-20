if (global.dialogue_locked) {
    // stop movement & input
    xsp = 0;
    ysp = 0;
    exit;
}


if (global.dialogue_locked) {
    xsp = 0;
    ysp = 0;
    exit;
}

// Gravity
ysp += 0.25;
xsp = 0;

// Input horizontal. keyboardchecks give back -1/0/1 therefor movespeed*that
xsp =move_speed*(keyboard_check(right)- keyboard_check(left))

// Encouraged state
var encouraged = global.encouragement;

// Ground check (AFTER movement)
var grounded = place_meeting(x, y + 1, oCollision);

// Jumping
if (grounded && keyboard_check(vk_up)) {
    ysp = encouraged ? -global.jump_boost_power : -jump_speed;
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

// Keeps the player in the room
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

// spritestuff
if xsp !=0{
	image_xscale = sign(xsp)
}
if encouraged {
	//sprite to encouraged
	sprite_index= sCourageConifer
} else {
	//sprite to normal
	sprite_index= sConifer
}

instance_find(oBubble,0).vis = keyboard_check(down)