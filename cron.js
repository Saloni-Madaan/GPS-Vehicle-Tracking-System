var cron = require('node-cron');
var mysql = require('mysql');
var request = require('request');
var index = 0;

cron.schedule('*/2 * * * * *', () => {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "saloni",
        database: 'Vehicle'
    });
    con.connect(function (err) {
        if (err) throw err;

        console.log("Index is " + index );
        if(index == 21 ){
            index =0;
        }
        // change the id  for showing the different vehicle data
        var sql = "select Vehicle_Master.Vehicle_Id, Vehicle_Master.Vehicle_No, Vehicle_Master.Vehicle_Desc, Vehicle_GPS_Data.Lat, Vehicle_GPS_Data.Log, Vehicle_GPS_Data_Id from Vehicle_Master join Vehicle_GPS_Data on Vehicle_Master.Vehicle_Id = Vehicle_GPS_Data.Vehicle_Id  where Vehicle_GPS_Data.Vehicle_Id=1 limit " +(++index)+" ,1" ;
        con.query(sql, function (err, result, fields) {
            if (err) throw err;
            //console.log(result);
            con.destroy();
            var json_obj = JSON.stringify(result);
            request.post({
                headers: { 'content-type': 'application/json' },
                url: 'http://localhost:3003/api2',
                form: { data: json_obj , key :index }
            }, function (error, response, body) {
                console.log(body);
            });
        });
    });
    console.log("Date " + new Date().getSeconds());
});















