import { Router } from "express";
import * as companyCtrl from "../controllers/companies.controller.js";
import { verifyToken } from "../middelwares/index.js";
const router =Router();


router.get('/:type', verifyToken, companyCtrl.getCompanies);
router.post('/',verifyToken, companyCtrl.createCompany);
router.get('/:type/:id', verifyToken, companyCtrl.getCompanyById);
router.put('/', verifyToken, companyCtrl.updateCompany);
router.put('/:type/:id',verifyToken, companyCtrl.undeleteCompany);
router.delete('/:type/:id',verifyToken, companyCtrl.deleteCompanyById);
router.purge('/:type/:id/',verifyToken, companyCtrl.eraseCompanyById);

export default router;