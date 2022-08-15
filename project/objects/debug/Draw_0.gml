if on {
	
	depth = -room_height
	
	//if instance_exists(popo) with popo if aiming {
	//	draw_set_color(c_red)
	//	draw_set_alpha(0.5)
		
	//	//	Find the end of the guns barrel (for spawning bullets)
	//	var xx = x + parts.top_arm.x_offset 
	//	var yy = y + parts.top_arm.y_offset
		
	//	xx += lengthdir_x(55, parts.top_arm.angle)
	//	yy += lengthdir_y(55, parts.top_arm.angle)
		
	//	draw_circle(xx,yy,2,false)
		
	//	draw_reset()
	//}
	
	//draw_set_color(c_red)
	//draw_set_alpha(0.5)
	//mp_grid_draw(grid.mp_grid)
	//draw_reset()
	
	if instance_exists(popo) with popo {
		draw_set_color(c_black)
		mask_index = mask_full
		draw_text(x,bbox_top-50,"ammo: "+string(ammo))
		draw_text(x,bbox_top-25,"reloading: "+string(reloading))
		mask_index = mask_collision
		draw_set_color(c_red)
		draw_set_alpha(0.5)
		draw_path(path,x,y,true)
		draw_reset()
	}
	
}