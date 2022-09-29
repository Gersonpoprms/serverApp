import mysql from "mysql";
import { promisify } from "util";
import config from "./config";

const { database } = config;

const pool = mysql.createPool(database);

pool.getConnection((err, connection) => {
 if (connection) connection.release();
  console.log("DB is Connected");
   if (err) {
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
      console.error("Database connection was closed.");
    }
    if (err.code === "ER_CON_COUNT_ERROR") {
      console.error("Database has to many connections");
    }
    if (err.code === "ECONNREFUSED") {
      console.error("Database connection was refused");
    }
  }

  

  return;
});

// Promisify Pool Querys
pool.query = promisify(pool.query);

export default pool;
