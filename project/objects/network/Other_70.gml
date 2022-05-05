var _id = async_load[? "id"]

if _id == "getWalletAddress" {
	web3address = async_load[? "address"]
	
	//	We got the users address
	if web3address != "0" {
		debug.log("Got the users address as: "+string(web3address))
		sio_connect_by_url(URL)
		serverconnected = true
		
		if room == RoomMainMenu {
			//room_goto(RoomLevelOne)
			
			sio_emit("login", web3address);
		}
		
	}
	//	We did NOT get the users address
	else {
		debug.log("ERROR Got a 0 for the users address")
	}
}
