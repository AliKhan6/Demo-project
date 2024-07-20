import { Express } from "express";
import AuthController from "../controllers/auth.controller";
import { checkDuplicateEmail } from '../middlewares/auth.middleware';


export default class AuthRoutes {
  private static readonly authController = new AuthController();

  static async init(app: Express) {
    app.post("/api/signup", checkDuplicateEmail, this.authController.signup);
    app.post("/api/login", this.authController.login);

  }
}
