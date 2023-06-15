USE DESCONTOS;

DROP TABLE IF EXISTS Descontos2;
CREATE TABLE IF NOT EXISTS Descontos2(
	Id_nf INT UNSIGNED NOT NULL,
	Id_item INT UNSIGNED NOT NULL,
	Cod_prod INT UNSIGNED NOT NULL,
	Valor_unit DECIMAL(5,2) NOT NULL,
	Quantidade INT UNSIGNED NOT NULL,
	Desconto INT UNSIGNED
);

INSERT INTO Descontos2( Id_nf, Id_item, Cod_prod, Valor_unit, Quantidade, Desconto )
VALUES
( 1,1,1,25.00,10,5 ),
( 1,2,2,13.50,3,NULL ),
( 1,3,1,15.00,2,NULL ),
( 1,4,2,10.00,1,NULL ),
( 1,5,1,30.00,1,NULL ),
( 2,5,1,30.00,1,NULL ),
( 2,5,2,30.00,1,NULL ),
( 2,5,3,30.00,1,NULL ),
( 2,5,4,30.00,1,NULL ),
( 2,5,4,30.00,1,NULL );
