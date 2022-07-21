arm_socket_x = -12
arm_socket_y = -38
arm_sprite = s_jet_finger_gun_arm

hspd = 0
vspd = 0

aiming = false

arm_rotation = point_direction(arm_socket_x,arm_socket_y,mouse_x,mouse_y)

network.generate_alien(player.x+100, player.y-150)


shootX = -1
shootY = -1
aimX = -1
aimY = -1
shooting = false
shootTimer = -1
function shoot() {
	shootX = x+(arm_socket_x*image_xscale)
	shootY = y+arm_socket_y
	
	//	set shootX at Jets finger rather than his shoulder
	shootX += lengthdir_x(30, arm_rotation)
	shootY += lengthdir_y(30, arm_rotation)
	
	aimX = mouse_x
	aimY = mouse_y
	
	shooting = true
	
	shootTimer = 3
}
function _shooting() {
	if shootTimer > -1 {
		shootTimer--
		arm_sprite = s_jet_finger_gun_arm_shooting
	}
	else {
		shooting = false
		arm_sprite = s_jet_finger_gun_arm
	}
	
	//draw_set_color(c_blue)
	//draw_line(shootX,shootY, aimX,aimY)
}
