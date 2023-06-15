/* GATILHOS e EVENTOS*/
/*
Os gatilhos são objetos associados
a uma tabela, são ativados quando
um evento em particular ocorre em
uma tabela.

-Executar verificações de valores.
-Fazer cálculos sobre os valores informados em
 uma atualização.

 Os eventos são 
 */

DROP SCHEMA IF EXISTS GATILHOS;
CREATE SCHEMA IF NOT EXISTS GATILHOS;
USE GATILHOS;

CREATE TABLE IF NOT EXISTS Livros
(
    id INT AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY( id )
);

CREATE TABLE IF NOT EXISTS registrosDeAtosNoEstoque
(
    id INT AUTO_INCREMENT,
    data VARCHAR(22) NOT NULL,
    descricao VARCHAR(1000) NOT NULL,
    PRIMARY KEY( id )
);

CREATE TRIGGER IF NOT EXISTS adicaoDeLivro
    AFTER INSERT ON Livros FOR EACH ROW
        INSERT INTO registrosDeAtosNoEstoque( data, descricao ) VALUES ( NOW(), "Novo livro inserido" );

CREATE TRIGGER IF NOT EXISTS remocaoDeLivro
    AFTER DELETE ON Livros FOR EACH ROW
        INSERT INTO registrosDeAtosNoEstoque( data, descricao ) VALUES ( NOW(), "Um livro removido" );


-- Evento no estilo crontab
CREATE EVENT passagemDasHoras
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR
    DO INSERT INTO registrosDeAtosNoEstoque( data, descricao ) VALUES( CURRENT_TIME(), "PASSAGEM DE 1 HORA"  );
