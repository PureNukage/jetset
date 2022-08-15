switch(state) {
	case state.free:
		
		//	Idle for a bit then walk somewhere
		if !moving {
			if timer > -1 timer--
			else {
				var random_x = irandom_range(-100,100)
				var random_y = irandom_range(-100,100)
				move_grid(x+random_x,y+random_y)
				timer = irandom_range(30,60)
			}
		}
		else {
				
		}
		
		//	Go aggro if player is nearby
		if instance_exists(player) and point_distance(x,y,player.x,player.y) <= range {
			state = state.aggro
			setThrust(5)	//	Do a little hop
			timer = irandom_range(15,30)
			drawExclamation = 30
			parts.torso_with_arms.sprite = s_popo_torso_holding_gun
		}
		
	break
	case state.aggro:
	
		//	Is the player within range
		var playerWithinDistance = false
		if instance_exists(player) and point_distance(x,y,player.x,player.y) <= range {
			playerWithinDistance = true
		}
		
		if ammo > 0 and reloading == -1 {
			//	Aiming/firing
			if !moving {
				//	We just got done firing a salvo
				if shotsFired == -1 {
					shotsFired = 0
					var random_x = irandom_range(x, player.x)
					var random_y = irandom_range(y, player.y)
					move_grid(random_x,random_y)
				}
				else {
					//	We are within camera view
					if playerWithinDistance {
						mask_index = mask_full
						if rectangle_in_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom, app.x-320,app.y-180,app.x+320,app.y+180) {
							//	We have a line of sight on the player
							if !collision_line(x,y, player.x,player.y,collision,true,true) {
								if shotsFired == 0 {
									aiming = true
									aimingTimer = irandom_range(15,25)
									shotsFired = choose(1,1,2)
									if shotsFired > ammo shotsFired = ammo
								}
								//	Continuing firing
								else if !aiming {
									aiming = true
									aimingTimer = irandom_range(15,25)
								}
							}
							//	We do NOT have line of sight, lets move
							else {
								var random_x = irandom_range(x, player.x)
								var random_y = irandom_range(y, player.y)
								move_grid(random_x,random_y)
							}
						}
						//	We are NOT within camera view, lets move
						else {
							var random_x = irandom_range(x, player.x)
							var random_y = irandom_range(y, player.y)
							move_grid(random_x,random_y)	
						}
						mask_index = mask_collision
					}
					//	Player is NOT within shooting distance, lets move
					else {
						var random_x = irandom_range(x, player.x)
						var random_y = irandom_range(y, player.y)
						move_grid(random_x,random_y)	
					}
				}
			}
	
			//	Moving/re-positioning
			else {
				
			}
		}
		//	Out of ammo, lets reload!
		else if reloading == -1 {
			reloading = 18
			sprite_index = s_popo_reloading
			parts.legs.sprite = s_popo_legs_idle
		}
		//	Actively reloading
		if reloading > 0 reloading--
		else if reloading == 0 {
			reloading = -1
			ammo++
			sound.playSoundEffect(snd_reload)
			parts.legs.sprite = s_popo_legs_walk
			if ammo < ammoMax {
				reloading = 18
				parts.legs.sprite = s_popo_legs_idle
			}
		}
		
	break
}

if aiming {
	
	parts.top_arm.angle = point_direction(x+(parts.top_arm.x_offset*image_xscale),y+parts.top_arm.y_offset,player.x,player.y)
	
	if (parts.top_arm.angle > 90 and parts.top_arm.angle < 270) {
		image_xscale = -1
	}
	else image_xscale = 1
	
	if aimingTimer > -1 aimingTimer--
	else if shootTimer == -1 {
		//	Shoot
		var xx = x + (parts.top_arm.x_offset*image_xscale)
		var yy = y + parts.top_arm.y_offset	
		xx += lengthdir_x(55, parts.top_arm.angle)
		yy += lengthdir_y(55, parts.top_arm.angle)
		var Bullet = instance_create_layer(xx,yy,"Instances",bullet)
		Bullet.force = 10
		Bullet.direction = point_direction(xx,yy, player.x,player.y)
		
		ammo--
		shotsFired--
		
		shootTimer = 4
		
		sound.playSoundEffect(choose(snd_gunshot1,snd_gunshot2,snd_gunshot3))
		
		parts.top_arm.sprite = s_popo_arm_shooting
		
		//	Done firing this salvo
		if shotsFired == 0 {
			aiming = false
			shotsFired = -1
		}
		//	We have another shot to fire, determine how long to aim
		else {
			aimingTimer = irandom_range(15,25)	
		}
	}
	
	if point_distance(x,y,player.x,player.y) > range {
		aiming = false
		aimingTimer = -1
	}
}

if shootTimer > -1 {
	shootTimer--
}
else if parts.top_arm.sprite != s_popo_arm {
	parts.top_arm.sprite = s_popo_arm
}

if moving _moving()

if reloading == -1 {
	if moving {
		sprite_index = s_popo_legs_walk	
	}
	else {
		sprite_index = s_popo_idle	
	}
}



event_inherited()

