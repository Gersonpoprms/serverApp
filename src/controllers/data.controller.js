import pool from "../database.js";
import { setQuery } from "../libs/helpers.js";



export const getData = async (req, res) => {

    const query = setQuery(req.params.type)
    try {
        const companies = await pool.query("SELECT * FROM " + query.table + "  WHERE 1")
        res.json({ status: 200, data: companies, msj: "consulta datos ejecutada con exito" });
    } catch (error) {
        console.log(error)
        res.json({ status: 205, data: error, msj: "No se pudo completar la consulta de datos" });
    }
}

export const getMultiData = async (req, res) => {


    try {
        const companies = await pool.query("SELECT * FROM st_multidata  WHERE type=?", [req.params.type])
        res.json({ status: 200, data: companies, msj: "consulta datos ejecutada con exito" });
    } catch (error) {
        console.log(error)
        res.json({ status: 205, data: error, msj: "No se pudo completar la consulta de datos" });
    }
}
export const getFullData = async (req, res) => {

    try {
        const companies = await pool.query("SELECT *  FROM " + req.body.table + " WHERE " + req.body.column + "=?",[req.body.id])
        res.json({ status: 200, data: companies, msj: "consulta datos ejecutada con exito" });
    } catch (error) {
        console.log(error)
        res.json({ status: 205, data: error, msj: "No se pudo completar la consulta de datos" });
    }
}

export const getUniqueList = async (req, res) => {

    try {
        const companies = await pool.query(" SELECT DISTINCT " + req.params.column + " FROM " + req.params.table + " ORDER BY " + req.params.column + " ASC  ")
        res.json({ status: 200, data: companies, msj: "consulta datos ejecutada con exito" });
    } catch (error) {
        console.log(error)
        res.json({ status: 205, data: error, msj: "No se pudo completar la consulta de datos" });
    }
}

/*export const getFullData = async (req, res)=>{
    const {table, column, id} =req.params;

    
        //const res = await pool.query("SELECT * FROM "+ table +" WHERE " + column + " = ?",[id])
        try {
            //const res = await pool.query("SELECT * FROM "+ table +" WHERE " + column + " = ?",[id])
        const res = await pool.query("SELECT * FROM employeepersonalinfo WHERE IdEmployee_PK = '80200973'")
            res.json({status:200, data:res, msj:"consulta datos ejecutada con exito"});
        } catch (error) {
            console.log(error)
            res.json({status:205, data : error, msj:"No se pudo completar la consulta de datos"});     
    }   
}*/
