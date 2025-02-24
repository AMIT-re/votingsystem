-- Create the database
CREATE DATABASE voting_system;

-- Use the newly created database
USE voting_system;

-- Create a user for the voting system
CREATE USER 'root'@'localhost' IDENTIFIED BY '12345';

-- Grant all privileges on the voting_system database to the user
GRANT ALL PRIVILEGES ON voting_system.* TO 'root'@'localhost';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;

-- Create a table for Users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Create a table for Candidates
CREATE TABLE candidates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    logo_url VARCHAR(255) NOT NULL
);

-- Create a table for Votes
CREATE TABLE votes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    candidate_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (candidate_id) REFERENCES candidates(id)
);
DESCRIBE candidates;
ALTER TABLE candidates ADD COLUMN logoUrl VARCHAR(255) NOT NULL;
DESCRIBE votes;
ALTER TABLE votes ADD COLUMN userId INT NOT NULL;
ALTER TABLE votes ADD CONSTRAINT fk_user FOREIGN KEY (userId) REFERENCES users(id);
SELECT * FROM users WHERE id = 1;
DELETE FROM users WHERE id = 1;
ALTER TABLE users AUTO_INCREMENT = 1;
ALTER TABLE candidates MODIFY logo_url VARCHAR(255) DEFAULT 'https://default-url.com';
ALTER TABLE candidates MODIFY logo_url VARCHAR(255) NULL;
ALTER TABLE candidates MODIFY COLUMN logo_url VARCHAR(255) DEFAULT 'https://default-url.com' NULL;
ALTER TABLE users AUTO_INCREMENT = 1;
ALTER TABLE candidates MODIFY logoUrl VARCHAR(255) NULL;
ALTER TABLE candidates MODIFY logoUrl VARCHAR(255) DEFAULT 'default_url_value';



