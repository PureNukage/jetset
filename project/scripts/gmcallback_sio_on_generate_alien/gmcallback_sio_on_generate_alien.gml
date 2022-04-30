// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gmcallback_sio_on_generate_alien() {
	show_debug_message("received alien generation: " + string(argument0))
	var _Alien = argument0
	var Alien = instance_create_layer(network.alien_x,network.alien_y,"Instances",alien)
	Alien.hair_color_index = _Alien.hair.value
	Alien.body_color_index = _Alien.body.value
	Alien.skin_color_index = _Alien.skin.value
	Alien.legs_color_index = _Alien.legs.value
	network.alien_x = -1
	network.alien_y = -1
	network.generating_alien = false
}