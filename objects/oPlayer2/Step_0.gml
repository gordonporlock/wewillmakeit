//updating courage by distance
distance= point_distance(x,y,other_player.x,other_player.y)
if distance >= courage_distance{
	courage=true
} else{
	courage= false
}

//giving encouragement
if keyboard_check(action){
	global.encouragement= true
	// the visual stuff
} else{
	global.encouragement= false
}


//movement
if courage{
	move_speed=courage_move_speed
	jump_speed=courage_jump_speed
	if courage_timer<0{
		courage=false
	}
}
move_x = keyboard_check(right) - keyboard_check(left)
move_x = move_x*move_speed
if place_meeting(x,y+1, oCollision){
	move_y= 0
	if keyboard_check(up){
		move_y =-jump_speed
	}
}
//gravity (without the ifstatement some weird speedment bugs occur
else if move_y < 3{
	move_y+=0.4
}
move_and_collide(move_x,move_y,oCollision)

//sprite changing stuff
if move_x !=0{
	image_xscale= sign(move_x)
}

