import pool from "../database.js";
import { setQuery } from "../libs/helpers.js";

export const createCompany = async (req, res)=>{
   
    const {data, type} =req.body;
    const query= setQuery(type)
    console.log(query.table)
    try {
        const result = await pool.query("INSERT INTO "+ query.table +" SET ? ", [ data]);
    if(result.affectedRows)
        res.json({status:200, data:{}, msj:"registro creado con exito con exito"});
    else
    res.json({status:204, data:{}, msj:"No se pudo crear registro, intentelo nuevamente"});     

    } catch (error) {
        console.log(error)
        res.json({status:205, data : error, msj:"No se pudo crear el registro, verifique que no ha sido creada previamente"});     
    }
}


export const getCompanyById =async (req, res)=>{
    const query= setQuery(req.params.type)
    try {
        const company = await pool.query("SELECT * FROM "+ query.table +" WHERE "+ query.field +"=?", [req.params.id]);

        if(company.length>0)
            res.json({status:200, data:company, msj:"Datos consultados con exito"});
        else
            res.json({status:204, data:{}, msj:"No se encontrardo datos para es ID"});
        } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
        }       
}

export const getCompanies = async (req, res)=>{
    const query= setQuery(req.params.type)
    try {
        const companies = await pool.query("SELECT * FROM "+ query.table +"  WHERE Status='active' ")
        res.json({status:200, data:companies, msj:"consulta ejecutada con exito"});
    } catch (error) {
        console.log(error)
        res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
}  
}

export const deleteCompanyById = async (req, res)=>{
    const query= setQuery(req.params.type)
    const Status ="delete"; 
    try {
        const result = await pool.query("UPDATE "+ query.table +" SET Status=? WHERE  Status='active' AND "+ query.field +" = ?", [Status, req.params.id]);
        if(result.affectedRows)
            res.json({status:200, data:{}, msj:"registro borrado con exito"});
        else
            res.json({status:204, data:{}, msj:"No se pudo borrar registro, intente mas tarde"});   
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
    }   
}

export const undeleteCompany = async (req, res)=>{
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

export const updateCompany = async (req, res)=>{
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

export const eraseCompanyById = async (req, res)=>{
    const query= setQuery(req.params.type)
    try {
        const result = await pool.query("DELETE FROM "+ query.table +" WHERE  "+ query.field +" = ?", [ req.params.id]);
        if(result.affectedRows)
            res.json({status:200, data:{}, msj:"registro borrado con exito"});
        else
            res.json({status:204, data:{}, msj:"No se pudo borrar registro, intente mas tarde"});   
    } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:"No se pudo completar la consulta"});     
    }     
}


