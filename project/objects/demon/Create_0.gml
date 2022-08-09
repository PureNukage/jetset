event_inherited()

function shot(hit_x, hit_y, shooter_x, shooter_y) {
	//	take damage
	
	//	apply knockback and thrust
	var Direction = point_direction(shooter_x,shooter_y, hit_x,hit_y)
	setForce(5, Direction)
	setThrust(5)
	
}