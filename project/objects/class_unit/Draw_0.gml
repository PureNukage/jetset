//	Draw shadow
draw_set_color(c_black)
draw_set_alpha(0.5)
draw_ellipse(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
draw_set_alpha(1)

//	Aiming
if aiming {
	draw_sprite_ext(parts.legs.sprite,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(parts.torso.sprite,0,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(parts.top_arm.sprite,shootTimer,x+(parts.top_arm.x_offset*image_xscale),y+(parts.top_arm.y_offset)-z,image_xscale,1,parts.top_arm.angle+90,c_white,1)
} 
//	Reloading
else if reloading > -1 {
	draw_sprite_ext(parts.legs.sprite,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(parts.torso_reload.sprite,0,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
//	Idle
else {
	draw_sprite_ext(parts.legs.sprite,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(parts.torso_with_arms.sprite,0,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}