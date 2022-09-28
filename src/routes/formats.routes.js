import { Router } from "express";
import * as formatsCtrl from "../controllers/formats.controller";
import { verifyToken } from "../middelwares";
const router = Router();

router.get('/:type', verifyToken, formatsCtrl.getFormats);
router.post('/',verifyToken, formatsCtrl.createFormat);
router.get('/:type/:id', verifyToken, formatsCtrl.getFormatById);
router.put('/', verifyToken, formatsCtrl.updateFormat);
router.put('/:type/:id',verifyToken, formatsCtrl.undeleteFormat);
router.delete('/:type/:id',verifyToken, formatsCtrl.deleteFormatById);
router.purge('/:type/:id/',verifyToken, formatsCtrl.eraseFormatById);


export default router;