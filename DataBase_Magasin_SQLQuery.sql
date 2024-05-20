CREATE DATABASE Magasin;
GO
USE Magasin;
GO

CREATE TABLE Categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Produits (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(10, 2) NOT NULL,
    categorie_id INT,
    FOREIGN KEY (categorie_id) REFERENCES Categories(id)
);
GO

CREATE TABLE Achats (
    id INT IDENTITY(1,1) PRIMARY KEY,
    produit_id INT,
    date_achat DATE,
    FOREIGN KEY (produit_id) REFERENCES Produits(id)
);
GO

INSERT INTO Categories (nom) VALUES ('Électronique'), ('Vêtements'), ('Alimentation');
GO

INSERT INTO Produits (nom, prix, categorie_id) VALUES 
('Téléphone', 599.99, 1),
('Ordinateur portable', 999.99, 1),
('Écouteurs', 49.99, 1),
('T-shirt', 19.99, 2),
('Jeans', 49.99, 2),
('Veste', 99.99, 2),
('Pomme', 0.99, 3),
('Banane', 0.79, 3),
('Pain', 1.29, 3);
GO

INSERT INTO Achats (produit_id, date_achat) VALUES
(1, '2019-01-15'), (2, '2019-02-20'), (3, '2019-03-10'),
(4, '2019-04-25'), (5, '2019-05-30'), (6, '2019-06-15'),
(7, '2019-07-10'), (8, '2019-08-20'), (9, '2019-09-25'),
(1, '2019-10-10'), (2, '2019-11-15'), (3, '2019-12-20'),
(4, '2020-01-15'), (5, '2020-02-20'), (6, '2020-03-10'),
(7, '2020-04-25'), (8, '2020-05-30'), (9, '2020-06-15');
GO

SELECT c.nom AS categorie, COUNT(a.id) AS nombre_achats
FROM Achats a
JOIN Produits p ON a.produit_id = p.id
JOIN Categories c ON p.categorie_id = c.id
GROUP BY c.nom;
GO

SELECT c.nom AS categorie, SUM(p.prix) AS somme_prix
FROM Achats a
JOIN Produits p ON a.produit_id = p.id
JOIN Categories c ON p.categorie_id = c.id
GROUP BY c.nom;
GO

SELECT COUNT(*) AS nombre_achats_2019_2020
FROM Achats
WHERE YEAR(date_achat) BETWEEN 2019 AND 2020;
GO
