import { Router } from "express";
import { verifyToken } from "../middelwares";
import user from "./users.routes";
import auth from "./auth.routes";
import companies from "./companies.routes";
import employees from "./employee.routes";
import contracts from "./contract.routes";
import commercial from "./commercial.routes";
import calendar from "./calendar.routes";
import formats from "./formats.routes";
import formData from './formData.routes';
import * as data from "../controllers/data.controller";
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