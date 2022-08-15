event_inherited()

range = 300
aimingTimer = -1
shotsFired = 0

mask_full = s_popo_idle
mask_collision = s_popo_collision
mask_index = mask_collision

parts.legs = new createBodypart(type.leg,s_popo_legs_walk,0,0)
parts.torso = new createBodypart(type.torso,s_popo_torso,0,0)
parts.top_arm = new createBodypart(type.top_arm,s_popo_arm,-20,-81)
parts.bottom_arm = new createBodypart(type.bottom_arm,s_popo_other_arm,9,-80)
parts.torso_with_arms = new createBodypart(type.torso_with_arms,s_popo_torso_with_arms,0,0)
parts.torso_reload = new createBodypart(type.torso_reload,s_popo_reloading,0,0)

ammo = 3
ammoMax = 3

forceMax = 3
timer = irandom_range(30,60)

drawExclamation = -1

path = path_add()
pos = 0
moving = false
moveX = -1
moveY = -1
function move_grid(_x,_y) {
	if pathfind(grid.mp_grid,path,x,y,_x,_y,true) {
		pos = 0
		moving = true
		moveX = path_get_point_x(path,pos)
		moveY = path_get_point_y(path,pos)
	}
	else moving = false
}
function _moving() {
	//	We've reached the next point in the path
	if point_distance(x,y,moveX,moveY) < 5 {
		//	We've reached the end of the path
		if pos++ >= path_get_number(path)-1 {
			moving = false
			pos = 0
		}
		//	Theres another point in the path
		else {
			moveX = path_get_point_x(path,pos)
			moveY = path_get_point_y(path,pos)
		}
	}
	//	Move in the direction of the next path point x,y
	else {
		var Direction = point_direction(x,y,moveX,moveY)
		if force < forceMax force++
		setForce(force, Direction)
		
		if moveX > x image_xscale = 1
		else if moveX < x image_xscale = -1
	}
}