if on {
	
	
	draw_text(15,15,"app.camera_width: "+string(camera_get_view_width(app.camera)))
	draw_text(15,30,"app.camera_height: "+string(camera_get_view_height(app.camera)))
	draw_text(15,45,"app.zoom_level: "+string(app.zoom_level))
	
	if instance_exists(player) with player {
		draw_text(15,60,"player.arm_rotation: "+string(player.arm_rotation))	
	}
	
}
