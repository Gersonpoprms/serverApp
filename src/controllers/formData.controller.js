import pool from "../database.js";
import { setQuery } from "../libs/helpers.js";
import path from 'path'

export const single = async (req, res)=>{
    console.log(req)
    res.json({status:200, data:req.file, msj:"archivo guardada"});
}
export const getFile = async (req, res)=>{
   // res.json({status:200, data:'./public/'+ req.params.folder + '/'+ req.params.name, msj:"archivo enviado"});
   // res.sendFile( './public/'+ req.params.folder + '/'+ req.params.name);
   res.sendFile(path.join(__dirname,'../../public/'+ req.params.folder + '/'+ req.params.name));
}
export const array = async (req, res)=>{
    res.json({status:200, data:{}, msj:"archivo multiple guardada"});
}

