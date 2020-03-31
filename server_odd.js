const express = require('express');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var path = require('path');


// var http = require('http').Server(app);
// var io = require('socket.io')(http);





var app     = express();
var server  = require('http').createServer(app);
var io      = require('socket.io').listen(server);
app.use(express.static(path.join(__dirname, '/public')));
//app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
// at the bottom of app.js
server.listen('3003', () => {
  console.log('Server listening on Port 3000');
});
// app.use(express.json());
//app.listen(port, function () {
  //console.log("Server is running on " + port + " port");
//});

//server.listen('3003', () => {
  // console.log('Server listening on Port 3000');
// })

app.get('/data', function (req, res) {
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: 'start'
  });
  con.connect(function (err) {
    if (err) throw err;
    var sql = "select Vehicle_Master.Vehicle_Id, Vehicle_Master.Vehicle_No, Vehicle_Master.Vehicle_Desc, Vehicle_GPS_Data.Lat, Vehicle_GPS_Data.Log, Vehicle_GPS_Data_Id from Vehicle_Master join Vehicle_GPS_Data on Vehicle_Master.Vehicle_Id = Vehicle_GPS_Data.Vehicle_Id";
    con.query(sql, function (err, result, fields) {
      if (err) throw err;
      console.log(JSON.stringify(result));
      con.destroy();
      res.setHeader('Content-Type', 'application/json');

      res.json(result);
    });
  });

});


app.post('/api2', function (req, res) {
  

  io.on('connection', function (socket) { 
    console.log('A user connected');
  
    
   io.sockets.emit("message",JSON.stringify(req.body));   
    socket.on('disconnect', function () {
      console.log('A user disconnected');
    });
  }); 
  res.send("Hello world from api2");
});



app.get('/', function(req, res) {
  res.sendFile(__dirname+'/index.html');
 // res.send("alsdkfj");
});
