/**
 * Reading Environment Variables
 */
 import { config } from "dotenv";
 import fs from "fs";
 config();
 



/*  export default {
   database: {
     connectionLimit: 10,
     host: process.env.DATABASE_HOST || "containers-us-west-83.railway.app",
     user: process.env.DATABASE_USER || "root",
     password: process.env.DATABASE_PASSWORD || "lSbcLmR5CD8vHgGMzNgt",
     database: process.env.DATABASE_NAME || "railway",
     port: process.env.DATABASE_PORT || 6404
     
   },
   port: process.env.PORT || 4010,
   SECRET: 'RMS-WebApp-API',
   dest:'./public/'
 }; */
/* ------------MIcrosoft azure ------------------- */ 
export default {

database:{
  host:process.env.DATABASE_HOST || "us-cdbr-east-06.cleardb.net", 
  user:process.env.DATABASE_USER || "b972f77bd8247b", 
  password:process.env.DATABASE_PASSWORD || "446c9ad4", 
  database:process.env.DATABASE_NAME || "heroku_c0b91b37c09dd03", 
  port: process.env.DATABASE_PORT || 3306, 
  },

  port: process.env.PORT || 4010,
  SECRET: 'RMS-WebApp-API',
  dest:'./public/'
}

/* database:{
  host:process.env.DATABASE_HOST || "rmsappserver.mysql.database.azure.com", 
  user:process.env.DATABASE_USER || "rmsappserver", 
  password:process.env.DATABASE_PASSWORD || "G3r50np0p@", 
  database:process.env.DATABASE_NAME || "appservices", 
  port: process.env.DATABASE_PORT || 3306, 
  },

  port: process.env.PORT || 4010,
  SECRET: 'RMS-WebApp-API',
  dest:'./public/'
} */



/* ssl:{
    ca:fs.readFileSync("public/SSL/DigiCertGlobalRootCA.crt.pem")
      }
  }, */
/* export default {
   database: {
     connectionLimit: 10,
     host: process.env.DATABASE_HOST || "localhost",
     user: process.env.DATABASE_USER || "root",
     password: process.env.DATABASE_PASSWORD || "",
     database: process.env.DATABASE_NAME || "appservices",
   },
   port: process.env.PORT || 4010,
   SECRET: 'RMS-WebApp-API',
   dest:'./public/'
 }; */
 