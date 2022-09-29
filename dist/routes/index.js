import { Router } from "express";
import { verifyToken } from "../middelwares/index.js";
import user from "./users.routes.js";
import auth from "./auth.routes.js";
import companies from "./companies.routes.js";
import employees from "./employee.routes.js";
import contracts from "./contract.routes.js";
import commercial from "./commercial.routes.js";
import calendar from "./calendar.routes.js";
import formats from "./formats.routes.js";
import formData from './formData.routes.js';
import * as data from "../controllers/data.controller.js";
const router = Router();
router.use("/api/auth", auth);
router.use("/api/user", user);
router.use("/api/companies", companies);
router.use("/api/contracts", contracts);
router.use("/api/employees", employees);
router.use("/api/commercial", commercial);
router.use("/api/formats", formats);
router.use("/api/formData", formData);
router.use("/api/calendar", calendar); // consultas personalizadas

router.use("/api/uniqueList/:table/:column", verifyToken, data.getUniqueList);
router.use("/api/data/:type/", verifyToken, data.getData);
router.use("/api/mdata/:type/", verifyToken, data.getMultiData);
router.use("/api/fulldata/", verifyToken, data.getFullData);
export default router;