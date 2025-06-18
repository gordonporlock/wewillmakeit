// Count down and destroy when finished
life -= 1;
if (life <= 0) {
    instance_destroy();
}
