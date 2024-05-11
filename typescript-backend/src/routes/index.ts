import { Express } from "express";
import AuthRoutes from "./auth.routes";
import HealthCheckRoutes from "./heath.check.routes";

const intializeRoutes = async (app: Express) => {
  //router to be setup

  HealthCheckRoutes.init(app);
  AuthRoutes.init(app);
};

export default intializeRoutes;
