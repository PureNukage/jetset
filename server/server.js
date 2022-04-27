const { debug } = require('console');

const PORT = 3000;

const server = require('http').createServer();
const io = require('socket.io')(server, { cors: { origin: '*'} });

//  Listen for incoming connections
server.listen(PORT, (err) => {
    if (err) throw err;
    console.log(`Listening on port..> '${PORT}'`);
});

const users = [];

io.on('connection', (client) => {
    console.log(`New connection.. > '${client.id}'`);

    //  Send clients SID
    client.emit('client_id', {
        client_id: client.id
    });

    client.on('login', (data) => {
        console.log(`login event data: > '${data}'`);

        //var alreadyIn = users.includes([data, client.id]);
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
        //console.log(users);

        //  Send login result back
        client.emit('login', alreadyIn);
    });

    client.on('generate_alien', (data) => {
        console.log('receiving request to generate an alien');
        //console.log(data);

        function getRandomInt(max) {
            return Math.floor(Math.random() * max);
        }

        data.gmlhair_color = getRandomInt(3);
        data.gmlbody_color = getRandomInt(3);
        data.gmllegs_color = getRandomInt(2);
        data.gmlskin_color = getRandomInt(3);

        //console.log(data);

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