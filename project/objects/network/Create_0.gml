web3connected = -1
web3connected = checkMetaConnection()

//sio_addEvent("login")

URL = "localhost:3000"

web3address = "-1"

function attribute(_category, _value) constructor {
	category = _category;
	value = _value;
}

generating_alien = false
alien_x = -1
alien_y = -1
function generate_alien(_x, _y) {
	var Alien = {
		hair : new attribute("hair", -1), 
		body : new attribute("body", -1),
		legs : new attribute("legs", -1),
		skin : new attribute("skin", -1)
	}
	sio_emit("generate_alien", Alien)
	generating_alien = true
	alien_x = _x
	alien_y = _y
}
