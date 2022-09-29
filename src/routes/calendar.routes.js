import { Router } from "express";
import * as calendarCtrl from "../controllers/calendar.controller";
import { verifyToken } from "../middelwares";
const router = Router();




router.get('/:type/:IdFormat_FK/:idEq', verifyToken, calendarCtrl.getEvents);
router.post('/',verifyToken, calendarCtrl.createEvent);
router.get('/:type/:id', verifyToken, calendarCtrl.getEventById);
router.put('/', verifyToken, calendarCtrl.updateEvent);
router.put('/:type/:id',verifyToken, calendarCtrl.undeleteEvent);
router.delete('/:type/:id/:del',verifyToken, calendarCtrl.deleteEventById);
router.purge('/:type/:id/:del',verifyToken, calendarCtrl.eraseEventById);


export default router;