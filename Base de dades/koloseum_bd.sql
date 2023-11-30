-- CREATE SCHEMA IF NOT EXISTS `koloseum_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci ;
-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS koloseum_db;
USE koloseum_db;

-- Users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Tournaments table
CREATE TABLE tournaments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Registrations table
CREATE TABLE registrations (
    user_id INT,
    tournament_id INT,
    PRIMARY KEY (user_id, tournament_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (tournament_id) REFERENCES tournaments(id)
);
