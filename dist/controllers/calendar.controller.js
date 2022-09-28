import pool from "../database";
import { setQuery } from "../libs/helpers";
export const createEvent = async (req, res) => {
  const {
    data,
    type
  } = req.body;

  try {
    const result = await pool.query("INSERT INTO calendar SET ? ", [data]);
    if (result.affectedRows) res.json({
      status: 200,
      data: result,
      msj: "registro creado con exito"
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
      msj: error.sqlMessage
    });
  }
};
export const getEventById = async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM calendar WHERE IdEvent_PK=?", [req.params.id]);
    if (result.length > 0) res.json({
      status: 200,
      data: result,
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
      msj: error.sqlMessage
    });
  }
};
export const getEvents = async (req, res) => {
  var data = {
    type: req.params.type,
    IdFormat_FK: req.params.IdFormat_FK,
    idEq: req.params.idEq
  };
  if (data.type === '@') data.type = '%';
  if (data.IdFormat_FK === '@') data.IdFormat_FK = '%';
  if (data.idEq === '@') data.idEq = '%';

  try {
    const result = await pool.query("SELECT * FROM calendar WHERE type LIKE ? And IdFormat_FK LIKE ? And idEq LIKE ?", [data.type, data.IdFormat_FK, data.idEq]);
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
      msj: error.sqlMessage
    });
  }
};
export const deleteEventById = async (req, res) => {
  const Status = "delete";

  try {
    const result = await pool.query("UPDATE calendar SET Status=? WHERE  Status='solicitado' AND IdEvent_PK = ?", [Status, req.params.id]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "evento borrado con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: error.sqlMessage
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: error.sqlMessage
    });
  }
};
export const undeleteEvent = async (req, res) => {
  const Status = "active";

  try {
    const result = await pool.query("UPDATE calendar SET Status=? WHERE  Status='delete' AND IdEvent_PK = ?", [Status, req.params.id]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "evento restaurado con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: error.sqlMessage
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: error.sqlMessage
    });
  }
};
export const updateEvent = async (req, res) => {
  const {
    data,
    type
  } = req.body;
  const id = data["IdEvent_PK"];

  try {
    const result = await pool.query("UPDATE calendar SET ? WHERE IdEvent_PK = ?", [data, id]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "evento actualizado con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: error.sqlMessage
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: error.sqlMessage
    });
  }
};
export const eraseEventById = async (req, res) => {
  try {
    const result = await pool.query("DELETE FROM calendar WHERE  IdEvent_PK = ?", [req.params.id]);
    if (result.affectedRows) res.json({
      status: 200,
      data: {},
      msj: "evento borrado con exito"
    });else res.json({
      status: 204,
      data: {},
      msj: error.sqlMessage
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 205,
      data: error,
      msj: error.sqlMessage
    });
  }
};