import { Router } from "express";
import * as commercialCtrl from "../controllers/commercial.controller.js";
import { verifyToken } from "../middelwares/index.js";
const router = Router();

/*  Commercial types
    CCT: Commercial Contrats
    CSR: Commercial Services
*/



router.get('/:type', verifyToken, commercialCtrl.getCommercials);
router.post('/',verifyToken, commercialCtrl.createCommercial);
router.get('/:type/:id', verifyToken, commercialCtrl.getCommercialById);
router.put('/', verifyToken, commercialCtrl.updateCommercial);
router.put('/:type/:id',verifyToken, commercialCtrl.undeleteCommercial);
router.delete('/:type/:id/:del',verifyToken, commercialCtrl.deleteCommercialById);
router.purge('/:type/:id/:del',verifyToken, commercialCtrl.eraseCommercialById);


export default router;