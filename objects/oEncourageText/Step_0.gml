// Follow the speaker above their head and destroy when encouragement key (S) is released
if (instance_exists(speaker)) {
    x = speaker.x;
    y = speaker.y - speaker.sprite_height - 4;

    // Destroy bubble when player releases encouragement key (S)
    if (!keyboard_check(ord("S"))) {
		speaker.encourage_bubble = noone;  // Allow spawning again
        speaker.encourage_cooldown = 0;    // Reset cooldown
        instance_destroy();
    }
} else {
    instance_destroy();
}
