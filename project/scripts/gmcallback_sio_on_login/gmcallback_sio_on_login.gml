// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gmcallback_sio_on_login() {
	var String = "";
	
	if argument0 String = "Failed"
	else String = "Success!"
	
	show_debug_message("login attempt was a " + String);
	
	if String == "Success!" and room == RoomMainMenu {
		room_goto(RoomLevelOne)	
	}
}