const express = require('express');
const path = require('path');
const sqlite3 = require('sqlite3');
const { open } = require('sqlite');

const PORT = 3000; // or change to a different port
const app = express();

let db;

// Initialize and open the SQLite database
(async () => {
    db = await open({
        filename: 'assets/database/Group.db', // Ensure the path is correct
        driver: sqlite3.Database
    });
})();

app.use(express.urlencoded({extended: false}));

// Added this for the middleware for json and our server
app.use(express.json());

// serve static files
app.use(express.static(path.join(__dirname, 'static')));


app.post('/login', async (req, res) => {
    console.log("Received a request");
    let found = false;    
    const { username, password } = req.body;
    console.log("this Username:", username);
    console.log("this Password:", password);

    // to guarentee we have two fields
    if (!username || !password) {
        return res.status(400).json({ message: "Missing username or password" });
    }

    try {
        const data = await db.all("SELECT * FROM Users WHERE Username = ?", [username]);
        // Log the retrieved data
        console.log("Data retrieved:", data);  
        if (data.length > 0 && data[0].Password === password) {
            res.json({
                username: data[0].Username,
                email: data[0].Email
            });
            found == true;
        }
        // username was not found 
        else if (data.length == 0) {
            res.status(401).json({ message: "Username not found/Incorrect" });
        } 
        // password doesn't
        else {
            res.status(401).json({ message: "Incorrect Password" });
        }
            
    } 
    catch (error) {
        console.error('Error retrieving data:', error);  // Log the error details
        res.status(500).json({ message: "Error retrieving data" });
    }
});

// this was for debugging ignore
const books = [
    {id: 1, title: 'Alice in Wonderland', author: 'Lewis Carrol'},
    {id: 2, title: 'Around the World in eighty days', author: 'Jules Verne'},
    {id: 3, title: 'Utopia', author: 'Sir Thomas Moor'},
];
   

// Start the server
app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
