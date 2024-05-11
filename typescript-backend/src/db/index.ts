import { Sequelize } from 'sequelize-typescript';
import Users from './models/user.model';
import { config } from '../config/config';

// Setup connection
export const sequelize = new Sequelize({
  database: config.db.database,
  dialect: config.db.dialect as any || 'postgres',
  username: config.db.username,
  password: config.db.password,
  host: config.db.host
});

// Add models to Sequelize
sequelize.addModels([Users]);
