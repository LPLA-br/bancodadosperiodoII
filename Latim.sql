--comandos pré elaborados para o database Latim
--após execução comente para não re-executar.

DROP DATABASE IF EXISTS Latim;
CREATE DATABASE IF NOT EXISTS Latim;
USE Latim;

CREATE TABLE IF NOT EXISTS VerbosIndicativo
(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	s1praesens VARCHAR(30),
	s2praesens VARCHAR(30),
	s3praesens VARCHAR(30),
	p1praesens VARCHAR(30),
	p2praesens VARCHAR(30),
	p3praesens VARCHAR(30),
	s1imperfectum VARCHAR(30),
	s2imperfectum VARCHAR(30),
	s3imperfectum VARCHAR(30),
	p1imperfectum VARCHAR(30),
	p2imperfectum VARCHAR(30),
	p3imperfectum VARCHAR(30),
	s1perfectum VARCHAR(30),
	s2perfectum VARCHAR(30),
	s3perfectum VARCHAR(30),
	p1perfectum VARCHAR(30),
	p2perfectum VARCHAR(30),
	p3perfectum VARCHAR(30),
	s1plusquamperfectum VARCHAR(30),
    s2plusquamperfectum VARCHAR(30),
    s3plusquamperfectum VARCHAR(30),
    p1plusquamperfectum VARCHAR(30),
    p2plusquamperfectum VARCHAR(30),
    p3plusquamperfectum VARCHAR(30),
	s1futurumsimplex VARCHAR(30),
	s2futurumsimplex VARCHAR(30),
	s3futurumsimplex VARCHAR(30),
	p1futurumsimplex VARCHAR(30),
	p2futurumsimplex VARCHAR(30),
	p3futurumsimplex VARCHAR(30),
	s1futurumexactum VARCHAR(30),
	s2futurumexactum VARCHAR(30),
	s3futurumexactum VARCHAR(30),
	p1futurumexactum VARCHAR(30),
	p2futurumexactum VARCHAR(30),
	p3futurumexactum VARCHAR(30),
	infinitivo VARCHAR(30),
	gerundio VARCHAR(30), 
	participio VARCHAR(30),
	Traducao VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Nomes (
	ID SMALLINT PRIMARY KEY,
	Genero VARCHAR(50),
	NomS VARCHAR(50),NomP VARCHAR(50),
	GenS VARCHAR(50),GenP VARCHAR(50),
	VocS VARCHAR(50),VocP VARCHAR(50),
	DatS VARCHAR(50),DatP VARCHAR(50),
	AblS VARCHAR(50),AblP VARCHAR(50),
	AcuS VARCHAR(50),AcuP VARCHAR(50),
	Traducao VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS Invariaveis (
	ID SMALLINT PRIMARY KEY,
	Classe VARCHAR(25),
	Latim VARCHAR(15),
	TradPT VARCHAR(50)
);

INSERT INTO Nomes
VALUES (
	"0",
	"f",
	"stella","stellae",
	"stellae","stellarum",
	"stella","stellae",
	"stellae","stellis",
	"stella","stellis",
	"stellam","stellas",
	"estrela"
),
(
	"1",
	"f",
	"femina","feminae",
	"feminae","feminarum",
	"femina","feminae",
	"feminae","feminis",
	"femina","feminis",
	"feminam","feminas",
	"mulher"
),
(
	"2",
	"f",
	"servus","servi",
	"servi","servorum",
	"servus","servi",
	"servo","servis",
	"servo","servis",
	"servum","servos",
	"servo,escravo"
);

INSERT INTO Invariaveis
VALUES ("0","conjuncao","ad","para,até,a"),
("1","conjuncao","et","e"),
("2","conjuncao","aut","ou"),
("3","conjuncao","sed","mas"),
("4","conjuncao","igitur","logo");

