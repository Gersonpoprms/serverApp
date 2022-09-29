import { Router } from "express";
import * as formDataCtrl from "../controllers/formData.controller.js";
import { verifyToken, saveFile } from "../middelwares/index.js";
import  multer from "multer";
import path from 'path'
import  fs  from "fs";

const router = Router();
//Set Storage Engine


const storage = multer.diskStorage({
    destination:  (req, file, cb)=> {
        fs.mkdir('./public/'+ req.params.folder + '/',(err)=>{
            cb(null, './public/'+ req.params.folder + '/');
         })},
    filename:  (req, file, cb)=> {
        cb(null, req.params.name+ 
    path.extname(file.originalname));
    }
  })



router.post('/single/:folder/:name', multer({ storage: storage}).single('docs'), verifyToken ,formDataCtrl.single);
router.get('/getFile/:folder/:name', verifyToken,formDataCtrl.getFile);


export default router;





