if serverconnected and time.seconds_switch {
	var Connected = sio_get_connection_status()
	//debug.log("connected: "+string(Connected))
	if !Connected {
		room_goto(RoomMainMenu)	
	}
}
