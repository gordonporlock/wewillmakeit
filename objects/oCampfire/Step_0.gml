// Detect if Player1 or Player2 is near (24px radius)
var touching = collision_circle(x, y, 24, oPlayer1, false, id) || collision_circle(x, y, 24, oPlayer2, false, id);

if (touching && !dialogue_done && !global.dialogue_locked) {
    global.dialogue_locked = true;
    dialogue_done = true;

    var tbox = instance_create_layer(x, y - 32, "Instances", oDialogueBox);
    tbox.dialogues = dialogues;
}

show_debug_message("Dialogue box created with " + string(array_length(dialogues)) + " lines.");
