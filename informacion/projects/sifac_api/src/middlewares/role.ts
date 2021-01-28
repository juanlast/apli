import { Request, Response, NextFunction } from "express";
import { User } from "../entity/User";
import { getRepository } from "typeorm";
import { start } from "repl";
import { Stats } from "fs";

export const checkRole = (roles: Array<string>) => {
    return async (req: Request, res: Response, next: NextFunction) => {
        const { userId } = res.locals.jwtPayload;
        const userReporitory = getRepository(User);
        let user: User;

        try {
            user = await userReporitory.findOneOrFail(userId);
        } catch (e) {
            return res.status(401).json({message: 'Not Authorized'});
        }

        //check

        const { role } = user;
        if(roles.includes(role)){
            next();
        }else{
            res.status(401).json({message: 'Not Authorized'});
        }
    }
};