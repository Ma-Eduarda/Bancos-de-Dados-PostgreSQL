create table emgregados(
  cpf varchar,
  nome varchar,
  salario float,
  endereco varchar
);

insert into emgregados(cpf, nome, salario, endereco)
values('333', 'Maria', 5000, 'Rua A, JP-PB'),
('777', 'José', 3000, 'Rua B, Guarabira-PB'),
('999', 'Priscila', 3000, 'Rua C, Guarabira-PB'),
('888', 'Paulo', 7000, null);

select * from emgregados;
select salario from emgregados where nome = 'José';
select endereco from emgregados where nome = 'José' or cpf = '333';
select distinct salario from emgregados;
select salario from emgregados where salario between 2000 and 4000;
select nome from emgregados where endereco like '%JP%'; 
select nome from emgregados where endereco is null;
