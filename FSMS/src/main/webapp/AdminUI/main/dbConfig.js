const config = {
    user: 'sa',
    password: '123456',
    server: 'DESKTOP-C4JDBT0\\SQLEXPRESS',
    port: 1433, // Ensure port number is specified
    database: 'finaldtb',
    options: {
        encrypt: true,
        enableArithAbort: true,
        connectTimeout: 30000 ,
        trustServerCertificate: true
    }
};
module.exports = config;