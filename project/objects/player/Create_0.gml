arm_socket_x = -12
arm_socket_y = -38
arm_sprite = s_jet_finger_gun_arm

hspd = 0
vspd = 0

aiming = false

arm_rotation = point_direction(arm_socket_x,arm_socket_y,mouse_x,mouse_y)

network.generate_alien(player.x+100, player.y-150)

ammo = 6
reloading = -1

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
	
	ammo--
	app.cursor_bounce = 5
	
	if reloading != -1 reloading = -1
	
	sound.playSoundEffect(snd_fingersnap)
	
	if instance_exists(demon) with demon mask_index = s_demon_collision
	
	//	Loop from Jets finger to the target checking for any objects in the line
	if collision_line(shootX,shootY, aimX,aimY, demon, true, true) {
		var enemy = collision_line(shootX,shootY, aimX,aimY, demon, true, true)
		if enemy.onGround {
			//	Find where we hit the unit
			var Direction = point_direction(shootX,shootY, aimX,aimY)
			var Distance = point_distance(shootX,shootY, aimX,aimY)
		
			var _x = shootX
			var _y = shootY
			var hit_x = -1
			var hit_y = -1
			for(var i=0;i<Distance;i++) {
				if instance_position(_x,_y,demon) {
					hit_x = _x
					hit_y = _y
				}
				else {
					_x += lengthdir_x(1, Direction)
					_y += lengthdir_y(1, Direction)
				}
			}
			enemy.shot(hit_x,hit_y, x,y)
		}
	}
	
	if instance_exists(demon) with demon mask_index = s_demon
	
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
	
app.cameraFocusObject(player, "~", 0.2)