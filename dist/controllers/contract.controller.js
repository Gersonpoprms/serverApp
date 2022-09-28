import pool from "../database";
import { setQuery } from "../libs/helpers";
export const createContract = async (req, res) => {
  const {
    data,
    type
  } = req.body;
  const query = setQuery(type);
  console.log(query.table);

  try {
    const result = await pool.query("INSERT INTO " + query.table + " SET ? ", [data]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "registro creado con exito con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: "No se pudo crear registro, intentelo nuevamente"
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: "No se pudo crear el registro, verifique que no ha sido creada previamente"
    });
  }
};
export const getContractById = async (req, res) => {
  const query = setQuery(req.params.type);

  try {
    const Contract = await pool.query("SELECT * FROM " + query.table + " WHERE " + query.field + "=?", [req.params.id]);
    if (Contract.length > 0) res.json({
      status: 200,
      data: Contract,
      msj: "datos consultados con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: "No se encontrardo datos para es ID"
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: "No se pudo completar la consulta"
    });
  }
};
export const getContracts = async (req, res) => {
  const query = setQuery(req.params.type);

  try {
    const result = await pool.query("SELECT * FROM " + query.table + "  WHERE Status='active' ");
    res.json({
      status: 200,
      data: result,
      msj: "consulta ejecutada con exito"
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: "No se pudo completar la consulta"
    });
  }
};
export const deleteContractById = async (req, res) => {
  const query = setQuery(req.params.type);
  const Status = "delete";

  try {
    const result = await pool.query("UPDATE " + query.table + " SET Status=? WHERE  Status='active' AND " + query.field + " = ?", [Status, req.params.id]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "registro borrado con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: "No se pudo borrar registro, intente mas tarde"
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: "No se pudo completar la consulta"
    });
  }
};
export const undeleteContract = async (req, res) => {
  const query = setQuery(req.params.type);
  const Status = "active";

  try {
    const result = await pool.query("UPDATE " + query.table + " SET Status=? WHERE  Status='delete' AND " + query.field + " = ?", [Status, req.params.id]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "registro restaurado con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: "No se pudo restaurar compañia, intente mas tarde"
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: "No se pudo completar la consulta"
    });
  }
};
export const updateContract = async (req, res) => {
  const {
    data,
    type
  } = req.body;
  const query = setQuery(type);
  const id = data[query.field];

  try {
    const result = await pool.query("UPDATE " + query.table + " SET ? WHERE " + query.field + " = ?", [data, id]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "registro actualizado con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: "No se pudo actualizar, intente mas tarde"
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: "No se pudo completar la consulta"
    });
  }
};
export const eraseContractById = async (req, res) => {
  const query = setQuery(req.params.type);

  try {
    const result = await pool.query("DELETE FROM " + query.table + " WHERE  " + query.field + " = ?", [req.params.id]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "registro borrado con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: "No se pudo borrar registro, intente mas tarde"
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: "No se pudo completar la consulta"
    });
  }
};