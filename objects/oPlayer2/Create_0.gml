//Player2  moet in de buurt zijn van Player1 om courage te krijgen

// with experimenting normal: 2high, 4jumpwidth
move_speed = 2
jump_speed = 5
//couragejump: 3 high, 6jumpwidth
courage_move_speed =3
courage_jump_speed =6

//courage variables
courage= true
courage_timer= 2
courage_distance =0

move_x=0 
move_y=0

collision_tiles = layer_tilemap_get_id("Tiles")

// keys
right= ord("D")
left= ord("A")
up= ord("W")
action= ord("S")

//finding the other player
other_player = instance_find(oPlayer1, 0)
distance= 0