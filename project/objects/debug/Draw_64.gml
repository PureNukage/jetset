if on {
	
	
	var yy = 15
	draw_text(15,yy,"app.camera_width: "+string(camera_get_view_width(app.camera))) yy += 15
	draw_text(15,yy,"app.camera_height: "+string(camera_get_view_height(app.camera))) yy += 15
	draw_text(15,yy,"app.zoom_level: "+string(app.zoom_level)) yy += 15
	
	if instance_exists(network) with network {
		draw_text(15,yy,"network.web3connected: "+string(web3connected)) yy += 15
	}
	
	if instance_exists(player) with player {
		draw_text(15,yy,"player.arm_rotation: "+string(player.arm_rotation)) yy += 15
		draw_text(15,yy,"player.image_index: " +string(player.image_index)) yy += 15
	}
	
}
