create table cliente (
id_cliente serial,
nome varchar(60),
cpf varchar(11),
data_nasc date,
sexo varchar(1),
salario float,
primary key(id_cliente)
);


create table DVD (
id_dvd serial, 
titulo varchar(60), 
genero varchar(60), 
duracao varchar(60), 
situacao varchar(60),
primary key(id_dvd)
);


create table locacoes (
id serial,
id_cliente integer,
id_dvd integer,
data date,
primary key(id),
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_dvd) references DVD(id_dvd)
);


insert into DVD (titulo, genero, duracao, situacao)
values ('X-Men', 'Ação', '02:30:00', 'alugado');

insert into DVD (titulo, genero, duracao, situacao)
values ('Mario', 'Animação', '02:10:00', 'alugado');

insert into cliente (nome, cpf, data_nasc, sexo, salario)
values('João', '8245738', '1979-10-02', 'M', '1500.00');

insert into cliente (nome, cpf, data_nasc, sexo, salario)
values('Maria', '8245738', '1989-10-02', 'F', '1500.00');

insert into locacoes (id_cliente, id_dvd, data)
values(1, 1, '2025-02-20');

insert into locacoes (id_cliente, id_dvd, data)
values(2, 2, '2025-02-20');


select * from DVD;
select * from cliente;
select * from locacoes;
