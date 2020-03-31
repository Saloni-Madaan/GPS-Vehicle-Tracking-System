var bodyParser = require('body-parser');
var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var cors = require('cors');
var db = require('./db');
app.use(cors());
app.use(express.static(__dirname + '/public'));


app.use(function (req, res, next) {
	res.io = io;
	next();
});

app.use(bodyParser.urlencoded({
	extended: false
}));
app.use(bodyParser.json());

app.get('/', function (req, res, next) {
	res.sendFile(__dirname + '/index.html');
});


io.on('connection', function (client) {
	console.log('Client connected...' + client.client.id);
	client.emit("event", "Hello from event");
});

app.post('/data', function (req, res, next) {
	console.log("before" + new Date());
	console.log(req.body);
	// var sql = "select Vehicle_Master.Vehicle_Id, Vehicle_Master.Vehicle_No, Vehicle_Master.Vehicle_Desc, Vehicle_GPS_Data.Lat, Vehicle_GPS_Data.Log, "+
	// "Vehicle_GPS_Data_Id from Vehicle_Master join Vehicle_GPS_Data on Vehicle_Master.Vehicle_Id = Vehicle_GPS_Data.Vehicle_Id";

	var sql = "select Vehicle_Master.Vehicle_Id, Vehicle_Master.Vehicle_No, Vehicle_Master.Vehicle_Desc"+
	" from Vehicle_Master ";
	db.query(sql, function (err, result) {
		if (err) throw err;
		//db.destroy();
		res.setHeader('Content-Type', 'application/json');
		res.send({data:JSON.stringify(result)});
		console.log();
		
		console.log("after" + new Date());
	});
});

app.post('/api2', function (req, res, next) {
	console.log("before" + new Date());
	console.log(req.body);
	var data = req.body;
	res.io.emit("message", JSON.stringify(req.body));
	res.send("Received");
	console.log("after" + new Date());
});

app.get('/location/:page', function (req, res, next) {
	res.sendFile(__dirname + '/map.html');
});

server.listen(3003);
