//	Draw shadow
draw_set_color(c_black)
draw_set_alpha(0.5)
draw_ellipse(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
draw_set_alpha(1)

draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)