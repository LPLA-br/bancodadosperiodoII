-- Este código é uma referência Não executável.
-- LPLA-br 2022  MARIADB --

--NOTA: Toda tabela que referência outra(s) devem ser
--	definidas por último(código lido de cima para baixo).

-- Documento escrito com base no Mariadb

------------------- SEÇÃO NULL -------------------

--OPERADORES MATEMÁTICOS
--	+		Soma
--	-		Subtração
--	*		Múltiplicação
--	/	DIV	Divisão
--	%	MOD	Módulo

--OPERADORES DE ATRIBUIÇÃO
--	:=	atribuir valor

--OPERADORES DE COMPARAÇÃO
--	=		     	igual a
--	<>		     	não igual a 
--	>		     	maior que
--	<		     	menor que
--	>=		     	maior que ou igual
--	<=		     	menor que ou igual
--	<=>			NULL-safe equal Operador
--	BETWEEN x AND y		TRUE se entre x e y (pode ser negado)
-- 	COALESCE		Retorna o primeiro valor não NULL
--	GREATEST		Retorna o maior argumento
--	LEAST			Retorna o menor argumento
--	IS			é (pode ser negado)
--	IS NULL			é núlo ATENÇÃO Única forma de testar se é NULL
--	IN			em ...

-- OPERADORES LÓGICOS
--	!	NOT
--	&&	AND
--		XOR
--	||	OR

-- ?
--	ALL
--	ANY
--	EXISTS	existe(pode ter prefixo de negação:NOT IN)
--	IN	está em(pode ter prefixo de negação:NOT IN)
--	LIKE	expressões regulares estilo sql
--	SOME

--	ORDER BY atributo [ASC|DESC]

--	GROUP BY atributo [ASC|DESC][HAVING] logica;

--CONSTRAINTS (restrições)
--	NOT NULL	valor obrigatório
--	UNIQUE		chave aternativa	opcional por padrão
--	PRIMARY KEY	chave primária		obrigatório por padrão
--	FOREIGN KEY	chave estrangeira	opcional por padrão
--	CHECK
--	DEFAULT
--	CREATE INDEX

--DOMINIOS
--	CHAR(tamanhofixo)
--	VARCHAR(tamanho)
--	TEXT
--	INT ou INTERGER
--	INT UNSIGNED
--	SMALLINT
--	NUMERIC(parteInteira,parteDecimal)
--	REAL, DOUBLE PRECISION
--	FLOAT(precisão)
--
--EXPRESSÕES REGULARES SQL
--	% fuciona como * do globbing do shell bash
--	_ fuciona como ? do globbing do shell bash

--FUNÇÕES UTEIS
-- now() retorna string de data atual.

--FUNÇÕES DE AGREGAÇÃO
--avg()		média Aritmética
--min()		menor valor
--max()		maior valor
--sum()		somatória
--count()	contagem

------------------- SEÇÃO I --------------------- DOS BANCOS DE DADOS E TABELAS --

-------------------------------------------CREATE DATABASE----------------------------------------

-- Criar banco de dados: CREATE DATABASE
CREATE DATABASE IF NOT EXISTS Supermercado;
CREATE SCHEMA IF NOT EXISTS Example;

-- USE define seu database de trabalho atual.
USE Supermercado;

--Se você não utilizar o USE terá que referenciar na forma BANCODEDADOS.TABELA

-------------------------------------------CREATE TABLE----------------------------------------

CREATE TABLE Fornecedores (
	Cod_Fornec SMALLINT PRIMARY KEY AUTO_INCREMENT,
	Nome_Fornec VARCHAR(50)
);

CREATE TABLE Produtos (
	ID_Prod SMALLINT,
	Nome_Prod VARCHAR(50) NOT NULL,
	Quant_Prod SMALLINT NOT NULL,
	Preco_Prod DECIMAL(10,2),
	Cod_Fornec SMALLINT,
	Cod_unico CHAR(5),
	PRIMARY KEY (ID_Prod),
	FOREIGN KEY (Cod_Fornec) REFERENCES Fornecedores(Cod_Fornec),
	UNIQUE(Cod_unico)
);

-- Mostrar Tabelas de um database sem USE.
SHOW TABLES FROM Supermercado;

-- Descreve Tabelas de um database (com USE).
DESCRIBE Produtos;
DESCRIBE Forncenecedores;

-- Criará a tabela Produtos somente se ela não existe ainda.
CREATE TABLE IF NOT EXISTS Produtos;

-------------------------------------------INSERT INTO----------------------------------------

INSERT INTO Fornecedores (Cod_Fornec, Nome_Fornec)
VALUES (1, "Redstene"), (2, "EQR");

INSERT INTO Produtos (ID_Prod, Nome_Prod, Quant_Prod, Preco_Prod, Cod_Fornec, Cod_unico)
VALUES (100, "Monitor LCD", 12, 550.00, 1, "ak9ig"),
(101, "Roteador Banda Larga", 8, 130.00, 1, "6etgy"),
(102, "Teclado", 15, 40.00, 1, "5deot"),
(103, "Pendrive 64gb", 22, 48.00, 1, "65gut"),
(104, "Webcam", 6, 170.00, 2, "morl1"),
(105, "Marreta Mágica", 2, 9756.50, 2, "de6se");

------------------------------------------ALTER TABLE----------------------------------------

-- Adicionar Coluna em uma tabela.
-- COLUMN opcional(depende das versões do mysql)

ALTER TABLE Produtos
ADD COLUMN Volume VARCHAR(10),
ADD COLUMN Peso SMALLINT NOT NULL;

-- Modificar definição da coluna.

ALTER TABLE Produtos
MODIFY COLUMN Preco_Prod DECIMAL(9,2) NOT NULL;

ALTER TABLE Produtos
MODIFY Preco_Prod DECIMAL(9,2);

-- Deletar Coluna em uma tabela.

ALTER TABLE Produtos
DROP COLUMN Volume,
DROP COLUMN Peso;

--------------------------------------------SELECT FROM----------------------------------------



--------------------CONSULTAS-----------------------
--       SELECT → o que será retornado/exibido    --
--       WHERE → testes lógicos a serem feitos.   --
----------------------------------------------------


SELECT * FROM Produtos; 			--TODA A TABELA.
SELECT Nome_Fornec FROM Fornecedores; 	--UMA COLUNA ESPECIFICA.
SELECT Nome_Prod, Preco_Prod FROM Produtos; --DUAS COLUNAS ESPECIFICAS.

----------------------------------------------------
--                   DISTINCT                     --
--    retorna coluna omitindo valores iguais      --
----------------------------------------------------

SELECT DISTINCT Nome_Prod FROM Produtos;    


----------------------------------------------------
--                   BETWEEN                      --
--     valores dentro de um campo delimitado      --
----------------------------------------------------

SELECT Nome_Prod, Preco_Prod FROM Produtos WHERE Preco_Prod BETWEEN 10 AND 100;

------------------------------------------------------------------------
-- IMPORTANTE! WHERE é indepedente das colunas selecionadas por SELECT--
------------------------------------------------------------------------

-- CONDIÇÕES LÓGICAS APÓS WHERE.

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101; 	--PRODUTO COM ID ESPECIFICO.

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101 OR Nome_Prod = "Retornar Banda Larga";

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101 AND Nome_Prod = "Roteador Banda Larga";

SELECT Nome_Prod FROM Produtos
WHERE NOT ID_Prod = 101;

SELECT Nome_Prod FROM Produtos
WHERE ID_Prod >= 101 AND ( Quant_Prod >= 1  OR Preco_Prod > 50.0  );

-------------------------------------
--             LIKE                --
-- expressões regulares estilo sql --
--                                 --
-------------------------------------

-------------------------------------------------------------
-- %    Zero ou mais caracteres.
-- _    Um único caractere
-- []   Qualquer um dos caractere contidos entre colchetes
-- ^    negação
-- -    campo de um caractere até outro
-------------------------------------------------------------

--retorna todos produtos comessados por M.
SELECT Nome_Prod FROM Produtos WHERE Nome_Prod LIKE "M%"; 
--retorna todos os produtos com 4 caracteres de tamanho no nome.
SELECT Nome_Prod FROM Produtos WHERE Nome_Prod LIKE "____";
--retorna todos os produtos com pelomenos 4 caracteres de tamanho no nome.
SELECT Nome_Prod FROM Produtos WHERE Nome_Prod LIKE "____%";
--retorna todos os produtos que contém Marreta no nome.
SELECT Nome_Prod FROM Produtos WHERE Nome_Prod LIKE "%Marreta%";


---------------------------------------------
--             PER EXEMPLUM                --
---------------------------------------------
-- Cliente(id, nome,    credito, bairro)   --
--         1   josé     100      a         --
--         2   ana      200      a         --
--         3   clinton	400      b         --
--         4   marco    405      c         --
--         5   júlia    543      a         --
--         6   ania     734      c         --
---------------------------------------------

-----------------------------------------
---               IN                  ---
---            está em ...            ---
-----------------------------------------

-- considere IN como "está em..."
SELECT nome FROM Cliente WHERE bairro IN ("a", "b");
-- → josé ana clinton júlia
SELECT nome FROM Cliente WHERE bairro NOT IN ("a","b");
-- → marco ania

-----------------------------------------
---            ORDER BY               ---
---           ordene por              ---
-----------------------------------------

-- Ordenação ascedente ou descedente por alfabeto ou número.

SELECT nome, credito FROM Cliente ORDER BY nome DESC;
SELECT nome, credito FROM Cliente ORDER BY nome ASC;

SELECT Nome_Prod, Preco_Prod
FROM Produtos
ORDER BY Nome_Prod; --ORDEM ALFABÉTICA.

SELECT Nome_Prod
FROM Produtos
ORDER BY Nome_Prod ASC; --ORDEM ALFABÉTICA ASCEDENTE.

SELECT Nome_Prod
FROM Produtos
ORDER BY Nome_Prod DESC; --ORDEM ALFABÉTICA DESCEDENTE.

-----------------------------------------
--              LIMIT                  --
--      limitar o número de linhas     --
-----------------------------------------

SELECT name FROM city LIMIT 10; 

-----------------------------------------
--                 ALIAS               --
--               GROUP BY              --
-----------------------------------------

SELECT idVeiculoAutomotivo AS iva FROM veiculos GROUP BY marca ASC;

-----------------------------------------
--             IS ou NOT IS            --
-----------------------------------------

SELECT * FROM Tabelinha WHERE Valor IS NULL;
SELECT * FROM Tabelinha WHERE Valor IS NOT NULL;

-------------------------------------------------------------------
-- TESTADOS NO MARIADB com o banco de dados demostrativo do mysql:-
-- world com tabelas: city, country, countrylanguage		  -
-------------------------------------------------------------------

-------------------------------------------------------------------
--              HAVING fuciona da mesma forma que WHERE          --
--                     Necessário após GROUP BY                  --
-------------------------------------------------------------------

--retorna o número de cidades por 'distrito'
SELECT CountryCode, District, count(Name) AS NumeroDeCidadesPorDistrito
FROM city GROUP BY District HAVING CountryCode = 'BRA' ORDER BY NumeroDeCidadesPorDistrito DESC;

-- negação lógica de HAVING
SELECT CountryCode, District, count(Name) AS NumeroDeCidadesPorDistrito
FROM city GROUP BY District HAVING NOT CountryCode <> 'BRA' ORDER BY NumeroDeCidadesPorDistrito DESC;

--línguas e número de paises em que é falada.
SELECT Language, count(CountyCode) FROM countrylanguage GROUP BY Language;
--português
SELECT Language, count(CountyCode) FROM countrylanguage GROUP BY Language HAVING Language = "portuguese";

-------------------------------------------UPDATE----------------------------------------

-- I - NÃO FARÁS UPDATE SEM WHERE

--UPDATE tables SET atributo = valor WHERE condição_lógica;

-- Alterar um registro na tabela: UPDATE

UPDATE Produtos
SET Preco_Prod = 999.00, Quant_Prod = 15
WHERE ID_Prod = 100;

--------------------------------------------DELETE----------------------------------------

-- Excluir tupla de uma tabela: DELETE FROM
-- Operações de UPDATE e DELETE são afetadas pela relação: primary key e foreign key

DELETE FROM Produtos
WHERE ID_Prod = 101; --DELETE sem WHERE resulta em deleção de tudo.

-----------------------------------------------TRUNCATE----------------------------------------

-- Apagar todos os dados de uma tabela. Não toda ela.

TRUNCATE TABLE Produtos;

-----------------------------------------------DROP----------------------------------------

-- Deletar a tabela inteira.

DROP TABLE IF EXISTS Produtos;

-- Deletar o banco de dados.

DROP DATABASE IF EXISTS Supermercado;

------------------- SEÇÃO II -------------------------- DOS USUÁRIOS E CONTAS --

-- apenas root ou um usuário poderoso
-- do SGBD pode operar aqui.
-- localhost = 127.0.0.1

/*------------NÍVEIS DE PERMISSÃO------------
    GLOBAL
    DATABASE
    TABLE
    COLUMN
    FUNCTION AND PROCEDURES
 -------------------------------------------*/

-- Criação de usuário.
CREATE USER IF NOT EXISTS "Marcolino"@"localhost" IDENTIFIED BY "senhaForte123";

-- senha com hash
CREATE USER IF NOT EXISTS "Marcolino"@"localhost" IDENTIFIED BY PASSWORD "senhaForte123";

-- Alteração de senha de usuário.
ALTER USER 'fulano'@'localhost' IDENTIFIED BY 'novaSenha123';
-- ou
SET PASSWORD FOR 'fulano'@'localhost' = PASSWORD 'NOVVUSDIESMENSIS';

-- GRANT in Tables for a user.
-- USE banco; para poder dar permissões de tabela abaixo ao novo usuário

GRANT INSERT ON Tabela TO "Marcolino"@"localhost";
GRANT UPDATE ( coluna1, coluna2 ) ON Tabela TO "Marcolino"@"localhost";

GRANT USAGE ON *.* TO 'fulano'@'localhost';

REVOKE INSERT ON Tabela TO "Marcolino"@"localhost";


-- principais permissões das tabelas:
-- ALTER, CREATE, DELETE, DROP, INSERT, SELECT, UPDATE.
-- principais perimissões das colunas
-- INSERT (col_list), SELECT (col_list), UPDATE (col_list)

-- Mostrar privilégios de um usuário
SHOW GRANTS FOR "Marcolino"@"localhost";

-- ROLES
SET DEFAULT ROLE algumaregra FOR 'fulano'@'hostname';
SET DEFAULT ROLE FOR NONE FOR 'fulano'@'hostname';











------------------- SEÇÃO UNIX --------------------- DA LINHA DE COMANDO LINUX --

--  Iniciar sessão interativa:
--	mysql -u USUARIO -p		u=usuario; p=senha;

--  Executar script sql
--	mysql -u USUARIO -p < NOME.sql

--  Executar e imprimir no terminal
--	mysql -u USUARIO -t -e "INSTRUÇÃO_SQL;" -p	t=formatoDeTabela e=executar

--  Backup (cria arquivo .sql no diretório corrente com o backup)
--	mysqldump -u USUARIO -p BANCODADOSNOME > NOME.sql











/* ######################################################################## */











/* CONSULTAS ANINHADAS */

/* consultas aninhadas e joins */
USE world;

/* consultas aninhadas só podem ser feitas com uma coluna de exibição.
   senão...
   ERROR 1241: operand should contain 1 column
 */

/* Todas as cidade que situam-se no brasil */
SELECT Name FROM city WHERE CountryCode IN
	( SELECT CountryCode FROM country WHERE CountryCode = "BRA" );

/* Todas as cidades Portuguesas que tem população maior que 100.000*/
SELECT Name, Population, District FROM city WHERE CountryCode IN
	( SELECT CountryCode FROM country WHERE CountryCode = "PTR" )
AND Population > 100000;

/* Paises menos populosos que São Paulo.*/
/* A subconsulta deve retornar 1 valor de outra tabela */
SELECT Name, Population FROM country WHERE 
Population < ( SELECT Population FROM city WHERE Name = 'São paulo' )
ORDER BY Population DESC;











/* ######################################################################## */











/* JOINS */

/* join combina colunas de duas ou mais tabelas (Produto Cartesiano)
   literalmente exibindo uma nova tabela não existente no bando de dados.

   SELECT colunas FROM tabelaesquerda (OPERAÇÃO JOIN) tabeladireita (LÓGICAS) ...;
*/

/*    DESCRIÇÕES
INNER JOIN
 SELECT [Tabela.coluna] FROM A INNER JOIN B ON A.col = B.col;
 |a|AB|b|

FULL OUTER EXCLUSIVO
 SELECT [] FROM A FULL OUTER JOIN B ON A.col = B.col WHERE A.col IS NULL OR B.col IS NULL;
 |A|ab|B|

FULL OUTER INCLUSIVO (TUDO)
 SELECT [] FROM A FULL OUTER JOIN B ON A.col = B.col;
 |A|AB|B|

LEFT INCLUSIVO
 SELECT [Tabela.colunas] FROM A LEFT OUTER JOIN B ON A.col = B.col;
 |A|AB|b|

LEFT EXCLUSIVO
 SELECT [Tabela.coluna] FROM A LEFT OUTER JOIN B ON A.col = B.col WHERE B.col IS NULL;
 |A|ab|b|

RIGHT INCLUSIVO
 SELECT [] FROM A RIGHT OUTER JOIN B ON A.col = B.col;
 |a|AB|B|

RIGHT EXCLUSIVO
 SELECT [] FROM A LEFT OUTER JOIN B ON A.col = B.col WHERE A.col IS NULL;
 |a|ab|B|
*/

USE NEOTWITER;
/*
Usuarios(id,login,senha)
Videos(id,titulo,descrição)
Gostinhas(id_usuario, id_video, Gostou)
*/

/*fusão sem lógica das tabelas*/
SELECT * FROM Usuarios INNER JOIN Mensagens;

/* SELECT colunas FROM tabelaA INNER JOIN tabelaB ON tabelaA.id = tabelaB.idForasteiro; */
/* fusão lógica de ids PRIMARY KEY e FOREIGN KEY */
SELECT * FROM Mensagens INNER JOIN Usuarios ON
Mensagens.id_usuario = Usuarios.id;


/*Como join une tabelas então é possível
  SELECIONAR dados de ambas tabelas
  com a especificação TABELA.ATRIBUTO*/
SELECT Mensagens.id, texto, data_post, Usuarios.login
FROM Mensagens INNER JOIN Usuarios ON Mensagens.id_usuario = Usuarios.id;

/* foco no lado Usuarios que está a direita de RIGHT JOIN */
SELECT Usuarios.login, Gostinhas.id_video FROM Gostinhas RIGHT JOIN Usuarios ON Gostinhas.id_usuario = Usuarios.id;

