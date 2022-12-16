const app = require('./app');
const path = require("path");
const dotenv = require('dotenv');
dotenv.config({path: path.join(__dirname, '../.env')});
const port = process.env.PORT;

let server = app.listen(port, () => {
    console.log(`Listening to port ${port}`);
});


const exitHandler = () => {
    if (server) {
        server.close(() => {
            console.log('Server closed');
            process.exit(1);
        });
    } else {
        process.exit(1);
    }
};

const unexpectedErrorHandler = (error) => {
    console.error(error);
    exitHandler();
};

process.on('uncaughtException', unexpectedErrorHandler);
process.on('unhandledRejection', unexpectedErrorHandler);

process.on('SIGTERM', () => {
    console.log('SIGTERM received');
    if (server) {
        server.close();
    }
});
