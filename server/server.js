const { debug } = require('console');
var crypto = require('crypto');

const PORT = 3000;

const fs = require('fs');
const server = require('http').createServer(async (req, res) => {
    res.writeHead(200, { 'content-type': 'text/html'})
    fs.createReadStream('index.html').pipe(res)

    if (req.url == "/users" && req.method === "GET") {
        console.log(JSON.stringify(users));
        res.write(JSON.stringify(users));
        res.end();
    }

    if (req.url == "/hash" && req.method === "GET") {
        var hash = crypto.createHash('sha256');

        var code = 'poop';

        code = hash.update(code);
        code = hash.digest(code);

        console.log(code);
        res.write(code);
        res.end();
    }    
})
const io = require('socket.io')(server, { cors: { origin: '*'} });

const users = [];

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

        var alreadyIn = false
        for(var i=0;i<users.length;i++) {
            if (users[i][0] == data || users[i][1] == client.id) {
                alreadyIn = true;
            }
        }
        console.log(alreadyIn);

        if (alreadyIn == true) {
            console.log('this user is already in the database');
        } else {
            users.push([data, client.id]);
        }

        console.table(users);

        //  Send login result back
        client.emit('login', alreadyIn);
    });

    client.on('generate_alien', (data) => {
        console.log('receiving request to generate an alien');
        console.log(data);

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

        console.log(data);

        client.emit('generate_alien', data);
    });

    client.on('disconnect', (data) => {
        console.log(`Client disconnected.. > '${client.id}'`);

        for(var i=0; i < users.length; i++) {

            if (users[i][1] == client.id) {
                //console.log("deleting user at: " + i);
                users.pop(i);
            }

        }

        console.table(users);

    });
    
});