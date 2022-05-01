array_hair_colors = []
array_hair_colors[0] = make_color_rgb(185,122,87)	//	Brown
array_hair_colors[1] = c_yellow
array_hair_colors[2] = c_gray
array_hair_colors[3] = c_purple
array_hair_colors[4] = c_blue

array_body_colors = []
array_body_colors[0] = c_aqua
array_body_colors[1] = c_purple
array_body_colors[2] = c_green
array_body_colors[3] = c_gray
array_body_colors[4] = make_color_rgb(185,122,87)	//	Brown

array_legs_colors = []
array_legs_colors[0] = c_blue
array_legs_colors[1] = c_ltgray
array_legs_colors[2] = c_dkgrey
array_legs_colors[3] = c_lime
array_legs_colors[4] = c_navy

array_skin_colors = []
array_skin_colors[0] = make_color_rgb(255,174,201)
array_skin_colors[1] = make_color_rgb(255,232,151)
array_skin_colors[2] = make_color_rgb(205,159,135)

hair_color_index = 0
body_color_index = 0
legs_color_index = 0
skin_color_index = 0

instance_create_layer(x,y-100,"Instances",mint)
