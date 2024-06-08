# Demo Project

This project contains both the frontend and backend of an application. The frontend is developed using Flutter, and the backend is developed using TypeScript with Sequelize.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Frontend Setup (Flutter)](#frontend-setup-flutter)
- [Backend Setup (TypeScript with Sequelize)](#backend-setup-typescript-with-sequelize)
- [Running the Project](#running-the-project)
- [Additional Information](#additional-information)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Node.js and npm installed. You can download them from [nodejs.org](https://nodejs.org/).
- Flutter SDK installed. You can follow the instructions from the [official Flutter documentation](https://flutter.dev/docs/get-started/install).
- PostgreSQL installed and running. You can download it from [postgresql.org](https://www.postgresql.org/).
- Any IDE or text editor, such as VS Code or IntelliJ IDEA.

## Frontend Setup (Flutter)

1. **Clone the repository:**
   ```sh
   git https://github.com/AliKhan6/Demo-project.git
   cd Demo-project/mobile-app

2. Install dependencies:
   flutter pub get
3. Run the Flutter app:
   flutter pub get
   
## Backend Setup (TypeScript with Sequelize)
   cd typescript-backend/
1. npm install

2. Configure environment variables:
Create a config.json file in the backend directory and add below details into it.
```{
  "dev": {
    "database": "testingDB",
    "dialect": "postgres",
    "username": "root",
    "password": "testingDB-pass",
    "host": "127.0.0.1",
    "AUTH_SECRET":"GF3K1kgs0eHvUJDEGD28AawsDfcW1BgnrnPYmmRCZgs="
  },
  "test": {
    "database": "testingDB",
    "dialect": "postgres",
    "username": "root",
    "password": "database_test",
    "host": "127.0.0.1"
  },
  "prod": {
    "username": "root",
    "password": null,
    "database": "database_production",
    "host": "127.0.0.1",
    "dialect": "mysql"
  }
}
```
2. Set Environment variable:
   export NODE_ENV=dev --// For Mac or Linux users
   set NODE_ENV=dev --// For windows users
3. Run database migrations:
   npx sequelize-cli db:migrate --config "config.json"
4. Start backend Server:
   npm run dev or nodemon dev


Running the Project
To run the project, follow these steps:

1. Start the backend server:
Navigate to the backend directory and start the server.
cd typescript-backend/
npm run dev OR nodemon dev

2. Run the Flutter app:
Navigate to the frontend directory and run the app.
cd mobile-app/
flutter run

Now your project should be up and running. The Flutter app will be served on your device/emulator, and the backend server will be running locally.







   

