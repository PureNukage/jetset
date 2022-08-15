setForce(force, direction)
applyMovement()

image_angle = direction - 90

depth = -y

if !rectangle_in_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom, app.x-320,app.y-180,app.x+320,app.y+180) {
	instance_destroy()	
}