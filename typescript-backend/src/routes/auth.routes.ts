import { Express } from "express";
import AuthController from "../controllers/auth.controller";

export default class AuthRoutes {
  private static readonly authController = new AuthController();

  static async init(app: Express) {
    app.post("/login", this.authController.login);
  }
}
