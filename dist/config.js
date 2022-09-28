/**
 * Reading Environment Variables
 */
import { config } from "dotenv";
config();
export default {
  database: {
    connectionLimit: 10,
    host: process.env.DATABASE_HOST || "localhost",
    user: process.env.DATABASE_USER || "root",
    password: process.env.DATABASE_PASSWORD || "",
    database: process.env.DATABASE_NAME || "appservices"
  },
  port: process.env.PORT || 4010,
  SECRET: 'RMS-WebApp-API',
  dest: './public/'
};