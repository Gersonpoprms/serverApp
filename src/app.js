import express from 'express';
import morgan from "morgan";
import pkg from "../package.json" assert { type: "json" };
import config from "./config.js";
import cors from "cors"
import routes from "./routes/index.js";
//import {createRoles} from "./libs/initialSetup";



const { database, port } = config;
const app = express();
//createRoles();
app.use(express.json());
app.set('pkg', pkg);
app.use(morgan('dev'));
app.use(cors());
app.use('/public', express.static('public'));

// Settings
app.set("port", port);

app.get('/api', (req, res)=>{
    res.json({
        name: app.get('pkg').name,
        description: app.get('pkg').description,
        version: app.get('pkg').version,
        author: app.get('pkg').author
    
    });
});

app.use(routes);

export default app;


