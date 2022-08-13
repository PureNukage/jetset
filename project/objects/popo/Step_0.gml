if aiming {
	
	parts.top_arm.angle = point_direction(x+(parts.top_arm.x_offset*image_xscale),y+parts.top_arm.y_offset,player.x,player.y)
	
	if (parts.top_arm.angle > 90 and parts.top_arm.angle < 270) {
		image_xscale = -1
	}
	else image_xscale = 1
	
	if aimingTimer > -1 aimingTimer--
	else {
		//	Shoot
		var xx = x + parts.top_arm.x_offset 
		var yy = y + parts.top_arm.y_offset	
		xx += lengthdir_x(55, parts.top_arm.angle)
		yy += lengthdir_y(55, parts.top_arm.angle)
		var Bullet = instance_create_layer(xx,yy,"Instances",bullet)
		Bullet.force = 10
		Bullet.direction = point_direction(xx,yy, player.x,player.y)
		
		aiming = false
	}
	
	if point_distance(x,y,player.x,player.y) > range {
		aiming = false
		aimingTimer = -1
	}
}

else {
	//	Is player within shooting range?
	if instance_exists(player) and point_distance(x,y,player.x,player.y) <= range {
	
		//	Aim at player
		aiming = true
		aimingTimer = irandom_range(15,25)
	
	}		
}



event_inherited()

