create table professor (
    id integer primary key,
    nome varchar(100)
);

create table curso (
    id integer primary key,
    nome varchar(100),
    id_professor integer references professor(id)
);

create table aluno (
    id integer primary key,
    nome varchar(100),
    id_curso integer references curso(id)
);

create sequence professor_id_seq start 1;
create sequence curso_id_seq start 1;
create sequence aluno_id_seq start 1;

insert into professor values (nextval('professor_id_seq'), 'ana');
insert into professor values (nextval('professor_id_seq'), 'joão');

insert into professor values (nextval('professor_id_seq'), 'Julia');

insert into curso values (nextval('curso_id_seq'), 'TI', 1);
insert into curso values (nextval('curso_id_seq'), 'TSI', 2);

insert into aluno values (nextval('aluno_id_seq'), 'carlos', 1);
insert into aluno values (nextval('aluno_id_seq'), 'maria', 2);


select setval('professor_id_seq', 50);
select setval('curso_id_seq', 100);
select setval('aluno_id_seq', 150);

select nextval('professor_id_seq');  
select nextval('curso_id_seq');      
select nextval('aluno_id_seq');     

drop sequence professor_id_seq;
drop sequence curso_id_seq;
drop sequence aluno_id_seq;

select * from professor;
select * from aluno;
select * from curso;

