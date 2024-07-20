import { Request, Response, NextFunction } from 'express';
import { isNull, isUndefined } from "lodash";
import User from '../db/models/user.model';

export const checkDuplicateEmail = async (req: Request, res: Response, next: NextFunction) => {
    let userData = req.body;
    if (!isNull(userData?.email) || !isUndefined(userData.email)) {
        try {
            let user = await User.findOne({ where: { email: userData.email } });
            if (user) {
                res.status(200).json({
                    "success": false,
                    "error": "Email already exist!",
                    "data": null
                })
            } else {
                next();
            }
        } catch (e) {
            const err = e as Error;
            res.status(200).json({
                "success": false,
                "error": err.message,
                "data": null
            })
        }

    } else {
        res.status(200).json({
            "success": false,
            "error": "Email is required!",
            "data": null
        })
    }
}