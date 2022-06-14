const { debug } = require('console');
var crypto = require('crypto');
const url = require("url");

const PORT = 8080;

const fs = require('fs');
const server = require('http').createServer(async (req, res) => {
    res.writeHead(200, { 'content-type': 'text/html'})
    fs.createReadStream('static/index.html').pipe(res)

    var queryData = url.parse(req.url, true).query;

    //  Server is being queried for its users
    if (req.method == "GET" && req.url.startsWith("/users")) {
        var Users = JSON.stringify(users);
        if (queryData.address) {
            var _address = queryData.address;
            res.end(find_clientID(_address));
        }
        else {
            res.end(Users);
        }
    }

})
const io = require('socket.io')(server, { cors: { origin: '*'} });

const users = [];

//  Function to search users[] using the client.id as KEY and returning the users ETH address
function find_ethAddress(_client_id) {
    for(var i=0;i<users.length;i++) {
        if (users[i].id == _client_id) {
            return users[i].address;
        }
    }
    return -1;
}

// Function to search users[] using the users ETH address as KEY and returning the users client.id
function find_clientID(_ethAddress) {
    for(var i=0;i<users.length;i++) {
        //console.log(`find_clientID: _ethAddress: ${_ethAddress}`);
        //console.log(`find_clientID: users[${i}].address: ${users[i].address}`);
        if (users[i].address.toUpperCase() == _ethAddress.toUpperCase()) {
            return users[i].id;
        }
    }
    return "-1";
}

//  Listen for incoming connections
server.listen(PORT, (err) => {
    if (err) throw err;
    console.log(`Listening on port..> '${PORT}'`);
});

io.on('connection', (client) => {
    console.log(`New connection.. > '${client.id}'`);

    //  Send clients SID
    client.emit('client_id', {
        client_id: client.id
    });

    client.on('login', (data) => {
        console.log(`login event data: > '${data}'`);

        //  var ip_address = client.handshake.address;
        //  client.id
        //  data ==> users address

        //  Make new User object
        var user = {
            address : data,
            id : client.id,
            nft : 0
        }
        
        var alreadyIn = false
        for(var i=0;i<users.length;i++) {
            if ((users[i].address == user.address) || (users[i].id == user.id)) {
                alreadyIn = true;
            }
        }

        if (alreadyIn) {
            console.log("this user is already logged in")
        } else {
            users.push(user);
        }

        console.log(users);

        //  Send login result back
        client.emit('login', alreadyIn);
    });

    client.on('generate_alien', (data) => {
        console.log(`receiving request to generate an alien from ${find_ethAddress(client.id)}`);
        //console.log(data);

        function getRandomInt(max) {
            return Math.floor(Math.random() * max);
        }

        for(const key in data) {
            var Key = data[key];
            if (typeof Key === 'object') {
                var RandomAmount = -1
                //  find the total amount of pieces for each attribute
                for(const keys in Key) {
                    if ((Key[keys] == 'hair') || (Key[keys] == 'body') || (Key[keys] == 'legs')) {
                        RandomAmount = 5
                    }
                    else if (Key[keys] == 'skin') {
                        RandomAmount = 3
                    }
                    else {
                    }
                }
                //  generate the RandomAmount for the attribute
                if (RandomAmount != -1) {
                    for(const keys in Key) {
                        if (Key[keys] == -1) {
                            Key[keys] = getRandomInt(RandomAmount);
                        }
                    }
                }
            }
        }

        //console.log(data);

        client.emit('generate_alien', data);
    });

    client.on('disconnect', (data) => {
        console.log(`Client disconnected.. > '${client.id}'`);

        for(var i=0; i < users.length; i++) {

            if (users[i].id == client.id) {
                //console.log("deleting user at: " + i);
                users.pop(i);
            }

        }

        //console.table(users);

    });
    
});