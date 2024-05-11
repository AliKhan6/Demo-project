import { Request, Response } from "express";
import AuthService from "../services/auth.service";

export default class AuthController {
  private readonly authService: AuthService;

  constructor() {
    this.authService = new AuthService();
  }

  async login(req: Request, res: Response) {
    const { email, password } = req.body;

    const user = await this.authService.login(email, password);
    res.status(200).json(user);
  }

  async logout(req: Request, res: Response) {
    const { email, password } = req.body;

    const user = await this.authService.login(email, password);
    res.status(200).json(user);
  }

  async signup(req: Request, res: Response) { }
}






