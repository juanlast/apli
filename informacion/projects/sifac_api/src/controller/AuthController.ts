import { getRepository } from "typeorm";
import { Request, Response } from "express";
import { User } from "../entity/User";
import * as jwt from 'jsonwebtoken';
import config from '../config/config';
import { validate } from "class-validator";

class AuthController {
    static login = async (req: Request, res: Response) => {

        const { username, password } = req.body;

        if (!(username && password)) {
            res.status(400).json({ message: 'Username & Password are required!' });
        }

        const userRepository = getRepository(User);
        let user: User;

        try {
            user = await userRepository.findOneOrFail({ where: { username } });
        } catch (e) {
            return res.status(400).json({ message: 'Username or Password incorrecct!' });
        }

        //check password

        if (!user.checkPassword(password)) {
            return res.status(400).json({ message: 'Username or Password are incorrecct!' });
        }

        const token = jwt.sign({ userId: user.id, username: user.username }, config.jwtSecret, { expiresIn: '1h' });

        res.json({ message: 'OK', token, userId: user.id, role: user.role });
    }

    static changePassword = async (req: Request, res: Response) => {
        const { userId } = res.locals.jwtPayload;
        const { oldPassword, newPassword } = req.body;

        if (!(oldPassword && newPassword)) {
            res.status(400).json({ message: 'Old Password & New Password are requiered' });
        }

        const userRepository = getRepository(User);
        let user: User;

        try {
            user = await userRepository.findOneOrFail(userId);
        } catch (error) {
            res.status(400).json({ message: 'Something goes wrong!' });
        }

        if(!user.checkPassword(oldPassword)){
            return res.status(401).json({messaje: 'Check your old password'});
        }

        user.password = newPassword;
        const validateOpt={validationError: {target: false, value: false}}
        const errors= await validate(user, validateOpt);

        if(errors.length > 0){
            return res.status(400).json(errors);
        }

        //Hash password

        user.hashPassword();
        userRepository.save(user);
        res.json({messaje: 'Password change!'});
    }
}

export default AuthController;