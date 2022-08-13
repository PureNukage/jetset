hspd = input.keyRight - input.keyLeft
vspd = input.keyDown - input.keyUp

//	Hold down right click to aim
if input.mouseRight and reloading == -1 {
	aiming = true
}
else aiming = false

//	Start reloading
if input.keyReload and ammo < 6 and reloading == -1 {
	reloading = 15
	sound.playSoundEffect(snd_blow)
}

//	Reloading bullets all at once
if reloading > 0 reloading--
else if reloading == 0 {
	ammo = 6
	reloading--
}

//	Moving
if (hspd != 0 or vspd != 0) and reloading == -1 {
	if !aiming image_speed = 1
	else image_speed = 0.5
	sprite_index = s_jet_legs
	var Direction = point_direction(0,0,hspd,vspd)
	if force < 5 force++
	setForce(force, Direction)
}
else {
	image_speed = 0
	if force > 0 force--
}

//	Active aiming logic
if aiming {

	parts.top_arm.angle = point_direction(x+(parts.top_arm.x_offset*image_xscale),y+parts.top_arm.y_offset,mouse_x,mouse_y)

	if (parts.top_arm.angle > 90 and parts.top_arm.angle < 270) {
		image_xscale = -1
	}
	else image_xscale = 1
	
	if input.mouseLeft and !shooting and ammo > 0 shoot()
}
//	Not aiming anymore
else {
	if hspd > 0 image_xscale = 1
	else if hspd < 0 image_xscale = -1
}

//	Sprite logic
if !(hspd != 0 or vspd != 0) {
	sprite_index = s_jet_body
}
else {
	sprite_index = s_jet_legs
}

applyMovement()

depth = -y
