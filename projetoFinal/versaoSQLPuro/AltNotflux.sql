/*Versão alternativa em SQL puro*/

DROP DATABASE IF EXISTS Notflux;
CREATE DATABASE IF NOT EXISTS Notflux;
USE Notflux;

CREATE TABLE IF NOT EXISTS plano
(
	id INT,
	nome VARCHAR(50) NOT NULL,
	valor INT NOT NULL,
	duracaoDiasUnix VARCHAR(12) NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO plano(id,nome,valor,duracaoDiasUnix) VALUES
(1,"basico",100,"864000"),
(2,"master",200,"1728000"),
(3,"premium",300,"2592000");

CREATE TABLE IF NOT EXISTS usuarios
(
	id INT AUTO_INCREMENT,
	login VARCHAR(50) NOT NULL,
	senha VARCHAR(50) NOT NULL,
    plano INT,
    dataInicio VARCHAR(20),
	PRIMARY KEY(id),
	UNIQUE( login ),
	UNIQUE( senha ),
    FOREIGN KEY(plano) REFERENCES plano(id)
);

/*
Demostrencio(plano1),Fulazio(plano3) -> estão com planos válidos.
Menocrito(plano1),Democrito(plano3) -> planos inválidos.
 */
INSERT INTO usuarios(login,senha,plano,dataInicio) VALUES
("Demostrencio","culumlectorismanducavi"),
("Democrito","Ginoliza78"),
("Fulazio","ui89"),
("Menocrito","septNoct");

CREATE TABLE IF NOT EXISTS videos
(
	id INT AUTO_INCREMENT,
	titulo VARCHAR(50) NOT NULL,
	ano VARCHAR(4),
	categoria VARCHAR(50),
	PRIMARY KEY(id)
);

INSERT INTO videos(titulo,ano,categoria) VALUES
("Bem Vindo a Notflux", YEAR(NOW()),"Apresentação"),
("Serra do Boró", "2019", "Comédia,ação"),
("Nao Resisti a sogra", "2003", "Comédia,romance"),
("As desaventuras de um pistoleiro na cachaça", "1969", "Tiroteio,ação"),
("Luta na cachaçaria", "1972","Ação"),
("Visitei a prima", "1969","Comédia,romance");

/*#########################SETOR DOS RELACIONAMENTOS#########################*/

CREATE TABLE IF NOT EXISTS assistiu
(
	id INT,
	data VARCHAR(20),
	idUsuario INT NOT NULL,
	idVideo INT NOT NULL,
	FOREIGN KEY (idUsuario) REFERENCES usuarios(id),
	FOREIGN KEY (idVideo) REFERENCES videos( id ),
	PRIMARY KEY(id)
);

/*#########################SETOR DAS QUESTÕES#########################*/
/*---Comandos puros e isolados----*/


