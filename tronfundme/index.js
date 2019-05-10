const express = require('express');
const path = require('path');
const cors = require('cors');
const Chatkit = require('@pusher/chatkit-server');
const mysql = require('mysql');

const app = express();

var cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');


const chatkit = new Chatkit.default({
  instanceLocator: 'v1:us1:185bbfb0-5421-4bb8-892a-fb4304613ca6',
  key: '298d881c-31a0-42d2-a4a4-f854529dbf55:RXBl3YsYBRSGqTbBXpgWKy8mVYodXNW4GNbMST3sJ/o=',
})

// Serve static files from the React app
app.use(express.static(path.join(__dirname, 'client/build')));

app.use(cors());

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//setup mysql
var con = mysql.createConnection({
    host: "localhost",
    user: "admin",
    password: "admin",
    database: "tronfundme"
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });


// Put all API endpoints under '/api'
app.post('/api/getUserAddress', (req, res) => {

  const {username} = req.body;

  var result = "default";

  console.log(req.body);

  var sql = "SELECT address FROM UserModel WHERE username = ?";

  con.query(sql, [req.body.username], (error, results, fields) => {
    if (error) {
      return console.error(error.message);
    }
    console.log(results[0].address);
    result = results[0].address;
    
    // Return them as json
    res.json(result);
  });

  
});

app.get('/api/getUserCount', (req, res) => {
  var sql = "SELECT COUNT(*) AS count FROM UserModel";

  con.query(sql, (error, results, fields) => {
    if(error)
    {
      return console.error(error.message);
    }
    res.json(results[0].count);
  })
})

app.get('/api/getCampaignCount', (req, res) => {
  var sql = "SELECT COUNT(*) AS count FROM campaignModel";

  con.query(sql, (error, results, fields) => {
    if(error)
    {
      return console.error(error.message);
    }
    res.json(results[0].count);
  })
})


app.post('/api/getUserDetails', (req, res) => {
  var sql = "SELECT * FROM UserModel WHERE username = ?";

  console.log("Username: " + req.body.username);

  con.query(sql, [req.body.username], (error, results, fields) => {
    if(error)
    {
      return console.error(error.message);
    }
    console.log("User details: " + results);
    res.json(results);
  })
})

app.post('/api/updateUserDetails', (req, res) => {
  var sql = "UPDATE UserModel SET username = ?, country = ? WHERE username = ?;";

  console.log("Update old username: " + req.body.olduser);
  console.log("Update username : " + req.body.username);
  console.log("Update country : " +  req.body.country);

  con.query(sql, [req.body.username, req.body.country, req.body.olduser], (error, results, fields) => {
    if(error)
    {
      res.sendStatus(400);
      return console.error(error.message);
    }
    console.log("Update details: " + results);
    res.sendStatus(200);
  })
})

app.post('/api/registerUser', (req, res) => {
  var sql = "INSERT INTO usermodel (id, username, address, donatedTRX, donatedGST, campaignsFollowed, country) VALUES (NULL, ?, ?, '0', '0', '0', ?);";

  console.log("Username value: " + req.body.username);
  console.log("User address: " + req.body.address);
  console.log("User country: " + req.body.country);

  con.query(sql, [req.body.username, req.body.address, req.body.country], (error, results, fields) => {
    if(error)
    {
      res.sendStatus(400);
      return console.error(error.message);
    }
    console.log("Update details: " + results);
    res.sendStatus(200);
  })
})

app.post('/api/updateCampaign', (req, res) => {

  console.log("Follower's count: " + req.body.followersCount);
  console.log("Fund collected: " + req.body.fundCollected);
  console.log("Deployed: " + req.body.deployed);
  console.log("ID: " + req.body.id);

  var sql = "UPDATE campaignmodel SET followersCount  = ?, fundCollected = ?, deployed = ? WHERE id = ?;";

  con.query(sql, [req.body.followersCount, req.body.fundCollectedLatest, req.body.deployed, req.body.id], (error, results, fields) => {
    if(error)
    {
      res.sendStatus(400);
      return console.error(error.message);
    }
    console.log("Update details: " + results);
    res.sendStatus(200);
  })
})


app.post('/api/updateUser', (req, res) => {

  var sql = "UPDATE usermodel SET donatedTRX  = ?, donatedGST = ?, campaignsFollowed = ? WHERE username = ?;";

  con.query(sql, [req.body.donatedTRX, req.body.donatedGST, req.body.campaignFollowed, req.body.username], (error, results, fields) => {
    if(error)
    {
      res.sendStatus(400);
      return console.error(error.message);
    }
    console.log("Update details: " + results);
    res.sendStatus(200);
  })
})


app.get('/api/getCampaignDetails', (req, res) => {
  var sql = "SELECT * FROM campaignmodel";

  con.query(sql, (error, results, fields) => {
    if (error) {
      return console.error(error.message);
    }

    console.log(results);

    res.json(results);
})
});

app.post('/api/getCountryUsers', (req, res) => {
  var sql = "SELECT username FROM UserModel WHERE country = ?";

  con.query(sql, [req.body.countryName], (error, results, fields) => {
      if (error) {
      return console.error(error.message);
    }

    console.log("Country users: " + results);

    res.json(results);

  })
})



var countries;

app.get('/api/getCountries', (req, res) => {
  var count = 0;

  var sql = "SELECT DISTINCT country FROM UserModel";

  con.query(sql, (error, results, fields) => {
    if (error) {
      return console.error(error.message);
    }

    console.log(results);

    countries = results;

    count = countries.length;

    res.json(countries);

    console.log(`Sent ${count} countries`);
  });
});


app.post('/users', (req, res) => {
  const { username } = req.body
  console.log(req.body);
  chatkit
    .createUser({
      id: username,
      name: username
    })
    .then(() => res.sendStatus(201))
    .catch(error => {
    if (error.error === 'services/chatkit/user_already_exists') {
      res.sendStatus(200)
    } else {
      res.status(error.status).json(error)
    }
  })
  })

// The "catchall" handler: for any request that doesn't
// match one above, send back React's index.html file.
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname+'/client/build/index.html'));
});

const port = process.env.PORT || 5000;
app.listen(port);

console.log(`Server listening on ${port}`);