function createGrid() {

	cell_width = 64
	cell_height = 64
	grid_width = floor(room_width / cell_width)
	grid_height = floor(room_height / cell_height)

	mp_grid = mp_grid_create(0,0,grid_width,grid_height,cell_width,cell_height)

	if instance_exists(collision) mp_grid_add_instances(mp_grid,collision,true)
	
}

createGrid()