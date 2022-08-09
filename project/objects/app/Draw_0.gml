//	Cursor
var angle = 0
var scale = 0.25
var _x = 0
var _y = 0
for(var i=0;i<4;i++) {
	if cursor_bounce {
		switch(i) {
			case 0:
				_y -= cursor_bounce
			break
			case 1:
				_x -= cursor_bounce
			break
			case 2:
				_y += cursor_bounce
			break
			case 3:
				_x += cursor_bounce
			break	
		}
	}
	draw_sprite_ext(s_cursor,0,mouse_x+_x,mouse_y+_y,scale,scale,image_angle+angle,image_blend,image_alpha)
	angle += 90
	_x = 0
	_y = 0
}
if cursor_bounce > 0 cursor_bounce--