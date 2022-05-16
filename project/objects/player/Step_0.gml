hspd = input.keyRight - input.keyLeft
vspd = input.keyDown - input.keyUp

if input.mouseRight {
	aiming = true
}
else aiming = false

x += hspd * 5
y += vspd * 5

if aiming {

	arm_rotation = point_direction(x+(arm_socket_x*image_xscale),y+arm_socket_y,mouse_x,mouse_y)

	if (arm_rotation > 90 and arm_rotation < 270) {
		image_xscale = -1		
	}
	else image_xscale = 1
}

else {
	if hspd > 0 image_xscale = 1
	else if hspd < 0 image_xscale = -1
}

if aiming {
	sprite_index = s_jet_finger_gun_body	
}
else {
	sprite_index = s_jet_body
}
