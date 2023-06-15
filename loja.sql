DROP SCHEMA IF EXISTS Loja;
CREATE SCHEMA IF NOT EXISTS Loja;
USE Loja;

/* Na lei deste país (cuziquistão) só é possível ser sócio de um estabelecimento. */

CREATE TABLE Comercio
(
    Id INT AUTO_INCREMENT,
    Nome VARCHAR(20),
    PRIMARY KEY (Id)
);

CREATE TABLE Socios
(
    ComercioAlvo INT,
    NomeSocio VARCHAR(20),
    FOREIGN KEY ( ComercioAlvo ) REFERENCES Comercio(Id)
);

INSERT INTO Comercio( Nome )
VALUES
("Mixosofty"),
("Gologle"),
("sputfivi"),
("ardidas");


INSERT INTO Socios( ComercioAlvo, NomeSocio )
VALUES
(1,"Jairo"),
(2,"Miraneida"),
(2,"Mércio"),
(3,"Galeno"),
(3,"Marilusca"),
(3,"Nairo");

SELECT * FROM Comercio;
SELECT * FROM Socios;

