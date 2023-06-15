drop database if exists suap;
create database if not exists suap;
use suap;

create table alunos
(
	id int auto_increment,
	nome varchar(20),
	matricula int,
	primary key ( id )
);

create table disciplinas
(
	id int auto_increment,
	nome varchar(20),
	primary key(id)
);

create table matriculas
(
	id_aluno int,
	id_disciplina int,
	foreign key( id_aluno ) references alunos(id),
	foreign key( id_disciplina ) references disciplinas(id),
	primary key( id_aluno, id_disciplina )
);

insert into disciplinas(nome) values
("POO"),("Banco de dados"),("Filosofia"),("Front end");

insert into alunos(nome, matricula) values
("kevin", 1),("MauwMauw", 2),("MotoMoto", 3),("Jamymy", 4);

insert into matriculas(id_aluno, id_disciplina) values
(1,3),(1,2),(2,4),(2,2),(2,3),(4,2);

select alunos.nome, matriculas.id_disciplina from alunos
	inner join matriculas;

select alunos.nome, matriculas.id_disciplina from alunos
	inner join matriculas on alunos.id = matriculas.id_aluno;

/*aluno matriculado na disciplinas tabela matricula conecta aluno a disciplina*/
select alunos.nome, disciplinas.nome from alunos
	inner join matriculas on alunos.id = matriculas.id_aluno
		inner join disciplinas on matriculas.id_disciplina = disciplinas.id;

/* disciplinas a direita, mostrar disciplina mesmo que não haja alunos */
select alunos.nome, disciplinas.nome from alunos
	inner join matriculas on alunos.id = matriculas.id_aluno
		right outer join disciplinas on matriculas.id_disciplina = disciplinas.id;

/*  */
select alunos.nome, disciplinas.nome from alunos
	left outer join matriculas on alunos.id = matriculas.id_aluno
		left outer join disciplinas on matriculas.id_disciplina = disciplinas.id;

/* join              = inner join
   (left|right) join = (left|right) outer join
 */
