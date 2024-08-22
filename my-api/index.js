const express = require('express');
const mysql = require('mysql2');

// Initialize Express app
const app = express();
const port = 3000;

// Create MySQL connection
const connection = mysql.createConnection({
  host: 'db', // This is the service name defined in your docker-compose file
  user: 'admin',
  password: 'password',
  database: 'test_db' // Connect to the playlist database
});



// Route to get all playlists
app.get('/playlists', (req, res) => {
  connection.query('SELECT * FROM playlists', (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error: 'Error fetching playlists' });
      return;
    }
    res.json(results);
  });
});

// Route to get all songs
app.get('/songs', (req, res) => {
  connection.query('SELECT * FROM songs', (err, results) => {
    if (err) {
      res.status(500).json({ error: 'Error fetching songs' });
      return;
    }
    res.json(results);
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
