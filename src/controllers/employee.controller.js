

import pool from "../database.js";
import { setQuery } from "../libs/helpers.js";

export const createEmployee = async (req, res)=>{
    const {data, type} =req.body;
    const query= setQuery(type)
   

    try {
        const result = await pool.query("INSERT INTO "+ query.table +" SET ? ", [ data]);
    if(result.affectedRows)
        res.json({status:200, data:{}, msj:"registro creado con exito"});
    else
    res.json({status:204, data:{}, msj:"No se pudo crear registro, intentelo nuevamente"});     

    } catch (error) {
        console.log(error)
        res.json({status:205, data : error, msj:"No se pudo crear el registro, verifique que no ha sido creada previamente"});     
    }
}

export const getEmployeeById =async (req, res)=>{
    
    const query= setQuery(req.params.type)

    try {
        const result = await pool.query("SELECT * FROM "+ query.table +" WHERE "+ query.field +"=?", [req.params.id]);

        if(result.length>0)
            res.json({status:200, data:result, msj:"datos consultados con exito"});
        else
            res.json({status:204, data:{}, msj:"No se encontrardo datos para es ID"});
        } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
        }       
}

export const getEmployees = async (req, res)=>{
    console.log(req.params.type);
    const query= setQuery(req.params.type)
    try {
        const result = await pool.query("SELECT * FROM "+ query.table +"  WHERE 1")
        res.json({status:200, data:result, msj:"consulta ejecutada con exito"});
    } catch (error) {
        console.log(error)
        res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
}  
}

export const deleteEmployeeById = async (req, res)=>{
    const Status ="delete"; 
    const query= setQuery(req.params.type)
    if (req.params.del==="erase") {
        try {
            const result = await pool.query("DELETE FROM "+ query.table +" WHERE  "+ query.field + " = ?", [ req.params.id]);
            if(result.affectedRows)
                res.json({status:200, data:{}, msj:"registro borrado con exito"});
            else
                res.json({status:204, data:{}, msj:"No se pudo borrar registro, intente mas tarde"});   
        } catch (error) {
                console.log(error)
                res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
        }    
    }


    else{
        try {
            const result = await pool.query("UPDATE "+ query.table +" SET Status=? WHERE  Status='active' AND "+ query.field +" = ?", [Status, req.params.id]);
            if(result.affectedRows)
                res.json({status:200, data:{}, msj:"registro borrado con exito"});
            else
                res.json({status:204, data:{}, msj:"No se pudo borrar registro, intente mas tarde"});   
        } catch (error) {
                res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
        }
    }   
}

export const undeleteEmployee = async (req, res)=>{
    const query= setQuery(req.params.type)
    const Status ="active"
    try {
        const result = await pool.query("UPDATE "+ query.table +" SET Status=? WHERE  Status='delete' AND " + query.field +" = ?", [Status, req.params.id]);
        if(result.affectedRows)
            res.json({status:200, data:{}, msj:"registro restaurado con exito"});
        else
            res.json({status:204, data:{}, msj:"No se pudo restaurar compañia, intente mas tarde"});     
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
    } 
}

export const updateEmployee = async (req, res)=>{

    const {data , type} =req.body;
    const query= setQuery(type)
    const id = data[query.field]
    
    try {
        const result = await pool.query("UPDATE "+ query.table +" SET ? WHERE " + query.field +" = ?", [data, id]);
        if(result.affectedRows)
            res.json({status:200, data:{}, msj:"registro actualizado con exito"});
        else
            res.json({status:204, data:{}, msj:"No se pudo actualizar, intente mas tarde"}); 
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
    }            
}

export const eraseEmployeeById = async (req, res)=>{
    

    const query= setQuery(req.params.type)

    try {
        const result = await pool.query("DELETE FROM "+ query.table +" WHERE  "+ query.field + " = ?", [ req.params.id]);
        if(result.affectedRows)
            res.json({status:200, data:{}, msj:"registro borrado con exito"});
        else
            res.json({status:204, data:{}, msj:"No se pudo borrar registro, intente mas tarde"});   
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
    }     
}



