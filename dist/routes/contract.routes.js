import { Router } from "express";
import * as contractCtrl from "../controllers/contract.controller.js";
import { verifyToken } from "../middelwares/index.js";
const router = Router();
router.get('/:type', verifyToken, contractCtrl.getContracts);
router.post('/', verifyToken, contractCtrl.createContract);
router.get('/:type/:id', verifyToken, contractCtrl.getContractById);
router.put('/', verifyToken, contractCtrl.updateContract);
router.put('/:type/:id', verifyToken, contractCtrl.undeleteContract);
router.delete('/:type/:id', verifyToken, contractCtrl.deleteContractById);
router.purge('/:type/:id/', verifyToken, contractCtrl.eraseContractById);
export default router;