function drawbutton(_x, _y, _width, _height, _string) {
	
	var thickness = 4
	var Return = false
	
	draw_set_color(c_black)
	draw_roundrect(_x-thickness, _y-thickness, _x+_width+thickness, _y+_height+thickness, false)
	
	if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+_width,_y+_height) {
		if input.mouseLeftPress {
			Return = true
		}
		draw_set_color(make_color_rgb(255,134,13))
	}
	else draw_set_color(c_orange)
	
	
	draw_roundrect(_x, _y, _x+_width, _y+_height, false)
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(_x+_width/2, _y+_height/2, _string)
	
	draw_reset()
	
	return Return
	
}
