/* ESTRUTURAS PROGRAMÁTICAS

 */

DROP SCHEMA IF EXISTS PROG;
CREATE SCHEMA IF NOT EXISTS PROG;
USE PROG;

IF TRUE THEN
    CREATE TABLE IF NOT EXISTS numero
    (
        id INT AUTO_INCREMENT,
        valor INT NOT NULL,
        PRIMARY_KEY( id )
    );
ELSE IF FALSE THEN
    SELECT "aaa";
ELSE
    SELECT "bbb";
END IF;

DELIMITER $$
BEGIN
    /*DECLARAÇÃO*/
    DECLARE valor INT UNSIGNED DEFAULT 666;

    BEGIN
        DECLARE valor VARCHAR(20) DEFAULT "20COMER70CORRER";
    END
    /*EXECUÇÃO*/

    SET @valor=1;
    SELECT valor;

    COMMIT;
END $$
DELIMITER ;

