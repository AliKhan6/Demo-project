// Try changing the file content to:
import express = require('express');

declare module 'express-serve-static-core' {
    interface Request {
        user?: any; // Define the user property
    }
}
