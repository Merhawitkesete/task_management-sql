CREATE DATABASE task_management;
USE task_management;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL
);


CREATE TABLE Tasks (
    TaskID INT AUTO_INCREMENT PRIMARY KEY,
    TaskName VARCHAR(100) NOT NULL,
    Description TEXT,
    Status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    Priority ENUM('Low', 'Medium', 'High') DEFAULT 'Low',
    DueDate DATE,
    AssignedTo INT,
    ProjectID INT,
    FOREIGN KEY (AssignedTo) REFERENCES Users(UserID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Users (Username, Email) VALUES
('milana', 'milana@gmail.com'),
('lis', 'lis@gmail.com');
SELECT * FROM Users;

INSERT INTO Projects (ProjectName) VALUES
('calculator'),
('game app');
SELECT * FROM Projects;

INSERT INTO Tasks (TaskName, Description, Status, Priority, DueDate, AssignedTo, ProjectID) VALUES
('Develop user authentication module', ' Implement user authentication functionality, including user registration, login, and password management. ', 'Pending', 'Medium', '2024-05-15', 1, 1),
('Set up database server', ' Install and configure the database server software on the designated server machine. ', 'In Progress', 'High', '2023-05-20', 2, 1),
('Design UI wireframes', 'Create wireframes and mockups for the user interface of the Task Management Application.', 'Completed', 'Low', '2024-01-10', 1, 2);

SELECT * FROM Tasks;
SELECT * FROM Tasks WHERE AssignedTo = 1;

SELECT * FROM Tasks WHERE ProjectID = 1;

UPDATE Tasks SET Status = 'Completed' WHERE TaskID = 1;

UPDATE Tasks SET Priority = 'High' WHERE TaskID = 2;


DELETE FROM Tasks WHERE TaskID = 3;









