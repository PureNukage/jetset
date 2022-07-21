if aiming {
	draw_sprite_ext(s_jet_finger_gun_body_nolegs,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(s_jet_legs,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(arm_sprite,shootTimer,x+(arm_socket_x*image_xscale),y+(arm_socket_y),image_xscale,1,arm_rotation+90,c_white,1)
} else {
	draw_sprite_ext(s_jet_body,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(s_jet_legs,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}

if shooting _shooting()