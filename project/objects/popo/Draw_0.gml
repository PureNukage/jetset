event_inherited()

if drawExclamation > -1 {
	drawExclamation--
	draw_set_color(c_yellow)
	draw_set_font(font_exclamation)
	mask_index = mask_full
	draw_set_halign(fa_center)
	draw_text_transformed(x,bbox_top-50,"!",1,1,0)
	mask_index = mask_collision
	draw_reset()
}