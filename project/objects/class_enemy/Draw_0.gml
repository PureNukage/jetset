//	Draw sprite
if damaged shader_set(sdr_flash)
event_inherited()
if object_index == demon draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)		
if damaged {
	shader_reset()
	damaged = false
	if hp <= 0 {
		instance_destroy()
	}
}