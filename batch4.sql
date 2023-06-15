
USE world;

/* country
CodeNameContinentRegionSurfaceAreaIndepYearPopulationLifeExpectancyGNPGNPOldLocalNameGovernmentFormHeadOfStateCapitalCode2*/

/* countrylanguage
CountryCodeLanguageIsOfficialPercentage
*/

select * from country where Code in (select CountryCode from countrylanguage where Language = 'portuguese' and IsOfficial = 'T');

select Name, Continent, Language from country JOIN countrylanguage on country.Code = countrylanguage.CountryCode where CountryCode = 'BRA';

USE undefined;

/*(inner|outer) join*/

select * from Fornecedor inner join Produto; /*concatenação sem lógica de tablelas. para t1=4 e t2=6 entao tabela resultante t1*t2 = 24 linhas*/
select * from Fornecedor inner join Produto on Forncedor.id = Produto.id_fornecedor; /*concatenação lógica de tabelas levando em conta a relação*/


select * from Fornecedor left outer join Produto on Forncedor.id = Produto.id_fornecedor; /* apareça resultados indepedentemente de haver associação ou não */
select * from Fornecedor right outer join produto on Forncedor.id = produto.id_fornecedor; /*TABELA_ESQUERDA (left|right) outer join TABELA_DIREITA*/

