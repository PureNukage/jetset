event_inherited()

hp = 100
damaged = false
function shot(hit_x, hit_y, shooter_x, shooter_y) {
	//	take damage
	damaged = true
	
	hp -= 20
	
	//	apply knockback and thrust
	var Direction = point_direction(shooter_x,shooter_y, hit_x,hit_y)
	setForce(5, Direction)
	setThrust(5)
	
}