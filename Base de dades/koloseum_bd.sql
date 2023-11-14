-- CREATE SCHEMA IF NOT EXISTS `koloseum_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci ;

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS koloseum_db;
USE koloseum_db;

-- Table of Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Table of Tournaments
CREATE TABLE Tournaments (
    tournament_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Table of Inscriptions
CREATE TABLE Inscriptions (
    inscription_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tournament_id INT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id)
);

-- Table of Results
CREATE TABLE Results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tournament_id INT,
    score INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id)
);


