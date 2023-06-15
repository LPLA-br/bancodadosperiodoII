/* Armazenamento seguro de senha */
CREATE SCHEMA IF NOT EXISTS SENHAS;
USE SENHAS;

CREATE TABLE IF NOT EXISTS Usuario (
    login VARCHAR(20) NOT NULL,
    HashSenha VARCHAR(43) NOT NULL,
    UNIQUE(login)
);

/*procedimento armazenado de senha */

DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS adicionarUsuario( IN login VARCHAR(20), IN senha VARCHAR(20) )
BEGIN
        INSERT INTO Usuario( login, HashSenha )
        VALUES ( login, PASSWORD(senha) );
END $$

DELIMITER ;

CALL adicionarUsuario( "luizito", "123" );

SELECT * FROM Usuario;
