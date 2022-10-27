USE master
GO

CREATE DATABASE Secrets
GO

USE Secrets
GO

CREATE TABLE Employees(
   Code INT PRIMARY KEY NOT NULL,
   EmployeeName VARCHAR(50) NOT NULL,
   EmployeePassword VARCHAR(50) NOT NULL,
)
GO

INSERT INTO Employees
    (Code, EmployeeName, EmployeePassword)
VALUES
    (1, 'Jose Carlos', 'a123123'),
    (2, 'Maria Santos', '123456'),
    (3, 'Janete Souza', 'vaicurinthia123'),
    (4, 'Henrique Silva', 'SENHACHATA1'),
    (5, 'Carlos Nascimento', '@dd23#r%ssWIJ3')
GO

SELECT * from Employees
GO

CREATE TABLE Articles(
   Code INT PRIMARY KEY NOT NULL,
   ArticleTitle VARCHAR(100) NOT NULL,
   ArticleDesc VARCHAR(1000) NOT NULL,
)
GO

INSERT INTO Articles
    (Code, ArticleTitle, ArticleDesc)
VALUES
    (1, 'Pluto is not a planet', 'Discover the latest news from our solar system.'),
    (2, 'New space images', 'The telescope James Webb is changing the way we see the space.'),
    (3, 'Superhero movies', 'DC is not dead, and Black Adam is here to fight Marvels heroes.'),
    (4, 'COVID legacy', 'Many countries are investing on laboratories to produce vaccines.'),
    (5, 'Climate and health', 'Climate is affecting peoples health even more.'),
    (6, 'The vape problem', 'Researchers are concerned about the effects of vapes on young users.'),
    (7, 'A hot UK', 'United Kingdoms temperatures are getting hotter each year due to climate changes.'),
    (8, 'Flying cars are real', 'More and more models of flying cars are being released.')
GO

SELECT * from Articles
GO
