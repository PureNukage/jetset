arm_socket_x = -12
arm_socket_y = -38

hspd = 0
vspd = 0

aiming = false

arm_rotation = point_direction(arm_socket_x,arm_socket_y,mouse_x,mouse_y)

network.generate_alien(player.x+100, player.y-150)
