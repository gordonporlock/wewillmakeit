//Player1 moet encouragement krijgen van player2 om courage te krijgen

// with experimenting normal: 2high, 4jumpwidth
move_speed = 2
jump_speed = 5
//couragejump: 3 high, 6jumpwidth
courage_move_speed =3
courage_jump_speed =6


//courage variables
courage= true
courage_timer= 2

//basic bs
move_x=0 
move_y=0

collision_tiles = layer_tilemap_get_id("Tiles")

// keys
right= vk_right
left= vk_left
up= vk_up
action= vk_down

//stuff with the other player
other_player = instance_find(oPlayer2, 0)
global.encouragement= false
