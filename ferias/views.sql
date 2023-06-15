/* MYSQL VIEWS */
USE world;

DROP VIEW IF EXISTS populacao;

CREATE VIEW IF NOT EXISTS populacao AS
SELECT Name, Population FROM city WHERE CountryCode = 'BRA';

SELECT * FROM populacao;

CREATE OR REPLACE VIEW populacao AS 
SELECT Population FROM city WHERE CountryCode = 'BRA';

SELECT * FROM populacao;

DROP VIEW populacao;
