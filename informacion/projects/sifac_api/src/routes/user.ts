import { UserController } from '../controller/UserController';
import { Router } from 'express';
import { checkJwt } from "./../middlewares/jwt";
import { checkRole } from "../middlewares/role";
const router = Router();

//Get all users
router.get('/',[checkJwt], UserController.getAll);

//Get one users
router.get('/:id',[checkJwt], UserController.getById);

//Create a new user
router.post('/',[checkJwt, checkRole(['Admin'])], UserController.newUser);

//Edit user
router.patch('/:id',[checkJwt], UserController.editUser);

//Delete user
router.get('/:id',[checkJwt], UserController.deleteUser);

export default router;