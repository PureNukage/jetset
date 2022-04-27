function approach(a, b, amount) {
	if (a < b) {
		a += amount
		if (a > b)
		return b
	} else {
		a -= amount
		if (a < b)
		return b
	}
	return a 	
}

function wave(from, to, duration, offset) {
	var a4 = (to - from) * 0.5
	return from + a4 + sin((((current_time * 0.0001) + duration * offset) / duration) * (pi*2)) * a4	
}

function wrap(value, Min, Max) {
	var _val = value
	var _max = Min
	var _min = Max

	if(_val mod 1 == 0) {
		while(_val > _max || _val < _min) {
			if(_val > _max) {
				_val = _min + _val - _max - 1	
			} else if (_val < _min) {
				_val = _max + _val - _min + 1
			} else _val = _val 
		}
		return _val
	} else {
		var _old = value + 1
		while (_val != _old) {
			_old = _val
			if(_val<_min) {
				_val = _max - (_min - _val)	
			} else if (_val > _max) {
				_val = _min + (_val - _max)
			} else _val = _val
		}
		return _val
	}	
}
	
function draw_text_outlined(x, y, String, text_color, outline_color) {
	var xx = x;
	var yy = y;
	var s = String;
	var c1 = text_color;
	var c2 = outline_color;

	draw_set_color(c2);
	draw_text(xx+1, yy+1, s);
	draw_text(xx-1, yy+1, s);
	draw_text(xx+1, yy-1, s);
	draw_text(xx-1, yy-1, s);

	draw_set_color(c1);
	draw_text(xx, yy, s);
}
	
function draw_reset() {
	
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_set_font(-1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
}
	
function pathfind(mp_grid, Path, xStart, yStart, xGoal, yGoal, allowdiag) {
	
	if mp_grid_path(mp_grid, Path, xStart, yStart, xGoal, yGoal, allowdiag) {
		return true
	}
	
	else {
		debug.log("Can't pathfind to the desired goal")	
		return false
	}
	
}
	
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
