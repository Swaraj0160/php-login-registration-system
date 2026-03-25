CREATE DATABASE IF NOT EXISTS users_db;
USE users_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@gmail.com', '$2y$10$examplehashedpassword', 'admin'),
('Normal User', 'user@gmail.com', '$2y$10$examplehashedpassword', 'user');
