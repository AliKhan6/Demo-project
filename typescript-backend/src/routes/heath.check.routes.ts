import { Express } from "express";
import { healthCheckController } from "../controllers/health.check.controller";

export default class HealthCheckRoutes {
  constructor() {}

  static async init(app: Express) {
    app.get("/", healthCheckController);
  }
}
