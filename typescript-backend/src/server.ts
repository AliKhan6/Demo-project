import express, { Express } from "express";
import { sequelize } from "./db";
import intializeRoutes from "./routes";
import multer from 'multer';

// Set up multer for file storage
const upload = multer({ dest: 'uploads/' });

const server = async (app: Express) => {
  //Authenticate DB
  await sequelize.authenticate();

  // Note: Ensure that the 'uploads/' directory exists or configure multer to store the files as per your requirement.

  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));

  // Apply middleware
  app.use(express.static("public"));

  // Initialize routes with multer middleware for file uploads

  await intializeRoutes(app);


  app.listen(3000, () => {
    console.log("Server running on", 3000);
  });
};

const app = express();
server(app);
