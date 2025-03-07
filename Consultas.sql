create table empregados(
  cpf varchar,
  nome varchar,
  salario float,
  endereco varchar,
  depto integer,
  foreign key(depto) references departamentos(codDep)
);

create table departamentos(
	codDep integer,
	nome varchar,
	setor varchar,
	primary key(codDep)
);

insert into empregados(depto, cpf, nome, salario, endereco)
values(1, '333', 'Maria', 5000, 'Rua A, JP-PB'),
(1,'777', 'José', 3000, 'Rua B, Guarabira-PB'),
(2,'999', 'Priscila', 3000, 'Rua C, Guarabira-PB'),
(3,'888', 'Paulo', 7000, null);

insert into departamentos(codDep,nome, setor)
values(1, 'Produção', 'A1'), (2, 'Contábil', 'D2'), (3, 'RH', 'A1');

select * from departamentos;
select * from empregados;
select salario from empregados where nome = 'José';
select endereco from empregados where nome = 'José' or cpf = '333';
select distinct salario from empregados;
select salario from empregados where salario between 2000 and 4000;
select nome from empregados where endereco like '%JP%'; 
select nome from empregados where endereco is null;

select sum(salario), max(salario), min(salario), avg(salario) from empregados; 

select max(salario), min(salario) from empregados e, departamentos d
where e.depto = d.coddep and d.nome = 'Produção';

select depto, count(*) from empregados group by depto;

select depto, max(salario) from empregados group by depto;

select depto, max(salario) from empregados where salario > 4000 group by depto;

alter table empregados add column sexo varchar;

UPDATE empregados
SET sexo= 'M'
WHERE nome = 'Paulo';

drop table empregados;
drop table departamentos;
