const express = require('express');
const path = require('path');
const sql = require('mssql');
const dbConfig = require('./dbConfig');

const app = express();
const port = 3000;

app.use(express.static(path.join(__dirname, 'AdminUI')));
app.use('/css', express.static(path.join(__dirname, '../css')));
app.use('/js', express.static(path.join(__dirname, '../js')));
app.use('/js/pages', express.static(path.join(__dirname, '../js/pages')));
app.use('/assets', express.static(path.join(__dirname,'../assets')));
app.use('/images', express.static(path.join(__dirname, '../images')));
app.use('/js/node_modules', express.static(path.join(__dirname, '../js/node_modules')));
app.use('/js/pages', express.static(path.join(__dirname, 'main', 'js', 'pages')));
app.use('/js/node_modules', express.static(path.join(__dirname, 'main', 'js', 'node_modules')));

app.use(express.json()); // For parsing application/json
app.use(express.static(path.join(__dirname, 'public')));

// Route handler for serving banner_manager.html
app.get('/banner_manager', (req, res) => {
    res.sendFile(path.join(__dirname, '../banner_manager.html'));
});

// Route handler for the root URL
app.get('/', (req, res) => {
    res.send('Welcome to the homepage!');
});

// Route to get all banners
app.get('/api/banners', async (req, res) => {
    try {
        await sql.connect(dbConfig);
        const result = await sql.query`SELECT * FROM Banner`; // Adjust your query and table name as needed
        res.json(result.recordset);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error retrieving data from database');
    } finally {
        sql.close();
    }
});

// Route to create a new banner
app.post('/api/banners', async (req, res) => {
    const { banner_name, image, content, is_active } = req.body;

    try {
        await sql.connect(dbConfig);
        const result = await sql.query`
            INSERT INTO Banner (banner_name, image, content, is_active, created_at)
            VALUES (${banner_name}, ${image}, ${content}, ${is_active}, GETDATE());
        `;
        sql.close();
        res.status(201).send('Banner created successfully.');
    } catch (err) {
        console.error('SQL error:', err.message);
        res.status(500).send('Error creating banner.');
    }
});

// Route to update banner
app.put('/api/banners/:id', async (req, res) => {
    const { id } = req.params;
    const { banner_name, image, content, is_active } = req.body;

    try {
        await sql.connect(dbConfig);
        const result = await sql.query`
            UPDATE Banner
            SET banner_name = ${banner_name},
                image = ${image},
                content = ${content},
                is_active = ${is_active}
            WHERE banner_id = ${id};
        `;
        sql.close();
        res.status(200).send('Banner updated successfully.');
    } catch (err) {
        console.error('SQL error:', err.message);
        res.status(500).send('Error updating banner.');
    }
});

// Route to delete banner
app.delete('/api/banners/:id', async (req, res) => {
    const { id } = req.params;

    try {
        await sql.connect(dbConfig);
        const result = await sql.query`
            DELETE FROM Banner
            WHERE banner_id = ${id};
        `;
        sql.close();
        res.status(200).send('Banner deleted successfully.');
    } catch (err) {
        console.error('SQL error:', err.message);
        res.status(500).send('Error deleting banner.');
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
