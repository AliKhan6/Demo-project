import fs from 'fs';
import path from 'path';

// Define a type for the environment configuration
type EnvConfig = {
    PORT?: string;
    username?: string;
    password?: string;
    database?: string;
    host?: string;
    dialect?: string;
    port?: string;
};

// Load environment variables from config.json
const envFilePath = path.join(__dirname, '../../config.json');
const rawEnvData = fs.readFileSync(envFilePath, { encoding: 'utf8' });
const envData: Record<string, EnvConfig> = JSON.parse(rawEnvData);

// Determine the environment based on NODE_ENV (default to 'development')
const currentEnv = process.env.NODE_ENV || 'dev';
// Get the configuration for the current environment
const currentEnvConfig = envData[currentEnv];

// Set environment variables globally
process.env = { ...process.env, ...currentEnvConfig };
console.log("Current Environment: ", currentEnv);

// Export the configuration
export const config = {
    PORT: process.env.PORT,
    db: {
        username: process.env.username,
        password: process.env.password,
        database: process.env.database,
        host: process.env.host,
        dialect: process.env.dialect,
        port: process.env.port,
    },
};
