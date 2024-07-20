import { Request, Response } from "express";
import AuthService from "../services/auth.service";
import { UserInput } from "../db/models/user.model";

export default class AuthController {
  private readonly authService: AuthService;

  constructor() {
    this.authService = new AuthService();
  }

  signup = async (req: Request, res: Response): Promise<any> => {
    const userData: UserInput = req.body;
    let response;
    try {
      response = await this.authService.signup(userData);
      return res.status(200).json(response);
    } catch (err) {
      console.log(err);
      res.status(200).json({
        success: false,
        message: 'An unexpected error occurred, please try again later.',
        data: null
      });
    }
  }

  login = async (req: Request, res: Response): Promise<any> => {
    const userData = req.body;
    let response;
    try {
      response = await this.authService.login(userData.email, userData.password);
      return res.status(200).json(response);
    } catch (err) {
      console.log(err);
      res.status(200).json({
        success: false,
        message: 'An unexpected error occurred, please try again later.',
        data: null
      });
    }
  }

}
