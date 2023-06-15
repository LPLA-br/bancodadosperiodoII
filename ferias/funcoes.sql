/* FUNÇÕES E PROGRAMAÇÃO */

DROP SCHEMA IF EXISTS FUNCOES;
CREATE SCHEMA IF NOT EXISTS FUNCOES;
USE FUNCOES;

CREATE TABLE IF NOT EXISTS balacoDia
(
    idFilial INT NOT NULL AUTO_INCREMENT,
    ganho INT NOT NULL,
    gasto INT NOT NULL,
    dia DATETIME NOT NULL,
    responsavel VARCHAR(10) NOT NULL,
    PRIMARY KEY(idFilial)
);

INSERT INTO balacoDia( gasto, ganho, dia, responsavel )
VALUES
( 100, 120, CURRENT_DATE(), "Dorneles" ),
( 674, 20, CURRENT_DATE(), "Merson" ),
( 326, 9, CURRENT_DATE(), "Janatalia" ),
( 113, 10, CURRENT_DATE(), "Milda" ),
( 14, 234, CURRENT_DATE(), "Analia" );

DELIMITER $$
CREATE FUNCTION Soma( IN valora INT, IN valorb INT ) RETURNS INT
BEGIN
    /*DECLARAÇÃO*/
    /*EXECUÇÃO*/
    RETURN valora + valorb;
END $$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION OperacaoAleatoriaA( IN valora INT, IN valorb INT ) RETURNS VARCHAR(30)
BEGIN
    /*DECLARAÇÃO*/

    DECLARE soma, outro INT;
    DECLARE none VARCHAR(10) DEFAULT "ALEAT";

    /*EXECUÇÃO*/

    SET soma = Soma(valora, valorb) + 1;
    SET outro = valora - valorb;

    IF soma > 100 THEN
        RETURN "ALEAT1";
    ELSEIF soma = 100 THEN
        RETURN "ALEAT2";
    ELSE
        RETURN "ALEAT3";
    END IF;

    RETURN "rinoceteio";

END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION OperacaoAleatoriaB() RETURNS INT
BEGIN
    /*DECLARAÇÃO*/
    /*EXECUÇÃO*/    
    RETURN 0;
END $$
DELIMITER ;

SET @a = 10;
SET @b = 20;
SET @resultado = Soma( @a, @b );

SELECT @resultado;

SET @resultadoB = OperacaoAleatoriaA( @a, @b );
SELECT @resultadoB;
