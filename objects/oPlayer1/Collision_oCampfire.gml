var touching_campfire_now = collision_circle(x, y, 12, oCampfire, false, id);

if (ignore_campfire_timer <= 0) {
    var campfire = instance_nearest(x, y, oCampfire);
    if (touching_campfire_now && !touching_campfire_last) {
        if (campfire != noone && !campfire.dialogue_done && !global.dialogue_locked) {
            global.dialogue_locked = true;
            global.dialogue_index = 0;
            campfire.dialogue_done = true;

            var tbox = instance_create_layer(x, y - 32, "ui", oTextbox);
            tbox.dialogues = campfire.dialogues;
        }
    }
}
touching_campfire_last = touching_campfire_now;
