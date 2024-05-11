import { RequestHandler } from "express";

export const healthCheckController: RequestHandler = async (req, res) => {
  res.send("Welcome to To the Template");
};
