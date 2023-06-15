/* PROCEDIMENTOS ARMAZENADOS */

/* coleção de comandos que podem ser executados de uma só vez */

DROP SCHEMA IF EXISTS PROCEDIMENTOS;
CREATE SCHEMA IF NOT EXISTS PROCEDIMENTOS;
USE PROCEDIMENTOS;

CREATE TABLE IF NOT EXISTS Pessoas
(
    nome VARCHAR(10) NOT NULL,
    idade INT 
);


INSERT INTO Pessoas( nome, idade )
VALUES
("Gerônio", 86),
("Mércio", 32),
("Givanelson", 20);


/*       TIPOS DE PARÂMETROS

IN  parâmetro referênciavel pelo procedimento. O valor não pode ser sobrescrito
    por ele.

OUT não pode ser referenciado pelo procedimento, mas o valor do parâmetro pode
    ser sobrescrito pelo procedimento.

INOUT O parâmetro pode ser referenciado pelo procedimento e o valor do parâmetro
      pode ser sobrescrito pelo procedimento.

*/


DROP PROCEDURE IF EXISTS mostrarPessoas;

DELIMITER $$
$$
CREATE PROCEDURE mostrarPessoas()
BEGIN
    /* DECLARAÇÃO */

    DECLARE variavel VARCHAR(20) DEFAULT '';
    DECLARE variavel2 INT DEFAULT 10;
    SET variavel = 'demostração';
    SET variavel2 = 20;

    /* EXECUÇÃO */

    SELECT * FROM Pessoas;

END $$
DELIMITER ;





DELIMITER $$
$$
CREATE PROCEDURE IF NOT EXISTS aposentadosOuNao()
BEGIN
    /*DECLARAÇÃO*/
    /*EXECUÇÃO*/
    SELECT nome AS posAposentados FROM Pessoas WHERE idade > 60;
    SELECT nome AS anteAposentados FROM Pessoas WHERE idade < 60;
END $$
DELIMITER ;







DELIMITER $$
$$
CREATE PROCEDURE IF NOT EXISTS adicionarPessoa( IN Nome VARCHAR(10), IN Idade INT  )
BEGIN
    /*DECLARAÇÃO*/
    /*EXECUÇÃO*/
    INSERT INTO Pessoas( nome, idade ) VALUES ( Nome, Idade );
END $$
DELIMITER ;






DELIMITER $$
$$
CREATE PROCEDURE IF NOT EXISTS maisVelho( OUT Ovelho INT )
BEGIN
    /*DECLARAÇÃO*/
    /*EXECUTION*/

    /* jogando INTO "Ovelho" */
    SELECT MAX(idade) INTO Ovelho FROM Pessoas;
END $$
DELIMITER ;



DELIMITER $$
$$
CREATE PROCEDURE IF NOT EXISTS obterIdadePeloNome( INOUT Valor VARCHAR(10) )
BEGIN
    /*DECLARAÇÃO*/
    /*EXECUÇÃO*/
    SELECT idade INTO Valor FROM Pessoas WHERE nome = Valor;
END $$
DELIMITER ;



CALL aposentadosOuNao();
CALL adicionarPessoa("Ginalva",32);
CALL adicionarPessoa("Marcolino",121);
CALL mostrarPessoas();

/* variável @RetornoVelho é temporária da sessão. */
CALL maisVelho(@MaisVelho);

SET @Nome = 'Ginalva';
CALL obterIdadePeloNome(@Nome);


SELECT @MaisVelho;
SELECT @Nome;
