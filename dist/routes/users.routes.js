import { Router } from "express";
import { verifyToken } from "../middelwares/index.js";
import * as userCtrl from '../controllers/user.controller.js';
const router = Router();
router.post('/', verifyToken, userCtrl.signup);
router.get('/', verifyToken, userCtrl.getAll);
router.post('/getById', verifyToken, userCtrl.getById);
router.put('/', verifyToken, userCtrl.update);
router.delete('/', verifyToken, userCtrl.del);
router.lock('/', verifyToken, userCtrl.unDelete);
router.link('/', verifyToken, userCtrl.erase); ///--metodos uniamente ara desarrollo, eliminar par productivos

router.post('/permission', userCtrl.setPermission);
router.put('/permission', userCtrl.getPermission);
export default router;