import { Router } from "express";
import * as employeeCtrl from "../controllers/employee.controller";
import { verifyToken } from "../middelwares";
const router = Router();

router.get('/:type', verifyToken, employeeCtrl.getEmployees);
router.post('/',verifyToken, employeeCtrl.createEmployee);
router.get('/:type/:id', verifyToken, employeeCtrl.getEmployeeById);
router.put('/', verifyToken, employeeCtrl.updateEmployee);
router.put('/:type/:id',verifyToken, employeeCtrl.undeleteEmployee);
router.delete('/:type/:id/:del',verifyToken, employeeCtrl.deleteEmployeeById);
router.purge('/:type/:id/:del',verifyToken, employeeCtrl.eraseEmployeeById);


export default router;