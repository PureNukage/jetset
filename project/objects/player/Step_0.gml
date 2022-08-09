hspd = input.keyRight - input.keyLeft
vspd = input.keyDown - input.keyUp

//	Hold down right click to aim
if input.mouseRight and reloading == -1 {
	aiming = true
}
else aiming = false

//	Start reloading
if input.keyReload {
	reloading = 10
	sound.playSoundEffect(snd_blow)
}

//	Reloading bullets individually
if reloading > 0 reloading--
else if reloading == 0 {
	ammo = 6
	reloading--
}

//	Moving
if (hspd != 0 or vspd != 0) {
	if !aiming image_speed = 1
	else image_speed = 0.5
	sprite_index = s_jet_legs
	x += hspd * 5
	y += vspd * 5
}
else {
	image_speed = 0
}

//	Active aiming logic
if aiming {

	arm_rotation = point_direction(x+(arm_socket_x*image_xscale),y+arm_socket_y,mouse_x,mouse_y)

	if (arm_rotation > 90 and arm_rotation < 270) {
		image_xscale = -1
	}
	else image_xscale = 1
	
	if input.mouseLeftPress and !shooting and ammo > 0 shoot()
}
//	Not aiming anymore
else {
	if hspd > 0 image_xscale = 1
	else if hspd < 0 image_xscale = -1
}

//	Sprite logic
if aiming {
	//sprite_index = s_jet_finger_gun_body
}
else if !(hspd != 0 or vspd != 0) {
	sprite_index = s_jet_body
}
else {
	sprite_index = s_jet_legs
}

depth = -y
