web3connected = -1
web3connected = checkMetaConnection()

//sio_addEvent("login")

URL = "localhost:3000"

web3address = "-1"

generating_alien = false
alien_x = -1
alien_y = -1
function generate_alien(_x, _y) {
	var Alien = {
		hair_color : -1,
		body_color : -1,
		legs_color : -1,
		skin_color : -1
	}
	sio_emit("generate_alien", Alien)
	generating_alien = true
	alien_x = _x
	alien_y = _y
}
