import pool from "../database.js";
import { setQuery } from "../libs/helpers.js";

export const createFormat = async (req, res)=>{
   
    const {data, type} =req.body;
    
   
    try {
        const result = await pool.query("INSERT INTO "+ type +" SET ? ", [ data]);
    if(result.affectedRows)
        res.json({status:200, data:result, msj:"registro creado con exito"});
    else
    res.json({status:204, data:{}, msj:"No se pudo crear registro, intentelo nuevamente"});     

    } catch (error) {
        console.log(error);
        res.json({status:205, data : error, msj:error.sqlMessage});     
    }
}

export const getFormatById =async (req, res)=>{
    
    
    try {
        const Format = await pool.query("SELECT * FROM "+ req.params.type +" WHERE IdFormat_PK=?", [req.params.id]);

        if(Format.length>0)
            res.json({status:200, data:Format, msj:"datos consultados con exito"});
        else
            res.json({status:204, data:{}, msj:"No se encontrardo datos para es ID"});
        } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:error.sqlMessage});     
        }       
}

export const getFormats = async (req, res)=>{

    try {
        const result = await pool.query("SELECT * FROM "+ req.params.type +"  WHERE 1 ")
        res.json({status:200, data:result, msj:"consulta ejecutada con exito"});
    } catch (error) {
        console.log(error)
        res.json({status:205, data : error, msj:error.sqlMessage});     
}  
}

export const deleteFormatById = async (req, res)=>{
    const Status ="delete"; 
    try {
        const result = await pool.query("UPDATE "+ req.params.type +" SET Status=? WHERE  Status='solicitado' AND IdFormat_PK = ?", [Status, req.params.id]);
        if(result.affectedRows)
            res.json({status:200, data:{}, msj:"registro borrado con exito"});
        else
            res.json({status:204, data:{}, msj:error.sqlMessage});   
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:error.sqlMessage});     
    }   
}

export const undeleteFormat = async (req, res)=>{
    const query= setQuery(req.params.type)
    const Status ="active"
    try {
        const result = await pool.query("UPDATE "+ req.params.type +" SET Status=? WHERE  Status='delete' AND IdFormat_PK = ?", [Status, req.params.id]);
        if(result.affectedRows)
            res.json({status:200, data:{}, msj:"registro restaurado con exito"});
        else
            res.json({status:204, data:{}, msj:error.sqlMessage});     
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:error.sqlMessage});     
    } 
}

export const updateFormat = async (req, res)=>{
    const {data , type} =req.body;

    const id = data["IdFormat_PK"]
    console.log(data, type , id);
    try {
        const result = await pool.query("UPDATE "+ type +" SET ? WHERE IdFormat_PK = ?", [data, id]);
        if(result.affectedRows)
            res.json({status:200, data:{}, msj:"registro actualizado con exito"});
        else
            res.json({status:204, data:{}, msj:error.sqlMessage}); 
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:error.sqlMessage});     
    }            
}

export const eraseFormatById = async (req, res)=>{
    try {
        const result = await pool.query("DELETE FROM "+ req.params.type +" WHERE  IdFormat_PK = ?", [ req.params.id]);
        if(result.affectedRows)
            
            res.json({status:200, data:{}, msj:"registro borrado con exito"});
        else
            res.json({status:204, data:{}, msj:error.sqlMessage});   
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:error.sqlMessage});     
    }     
}


