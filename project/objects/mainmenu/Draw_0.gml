if network.web3connected {
	var MetaMask = drawbutton(room_width/2-100,room_height/2-50,200,100,"Login with MetaMask")
	if MetaMask {
		getMetamaskAccount();
	}
	
	var NoMetaMask = drawbutton(room_width/2-100,room_height/2+70,200,100,"Login without Web3")
	if NoMetaMask {
		getMetamaskAccount();
	}
}
else {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_text(room_width/2,room_height/2,"MetaMask is not installed")
	
	var NoMetaMask = drawbutton(room_width/2-100,room_height/2+70,200,100,"Login without Web3")
	if NoMetaMask {
		room_goto(RoomLevelOne)
	}
	
	draw_reset()
}
