create table ambulatorios (
    nroa int primary key,
    andar int,
    capacidade int
);

create table medicos (
    codm int primary key,
    cpf varchar(11),
    nome varchar(100),
    idade int,
    cidade varchar(100),
    especialidade varchar(100),
    nroa int,
    foreign key (nroa) references ambulatorios(nroa)
);

create table pacientes (
    codp int primary key,
    cpf varchar(11),
    nome varchar(100),
    idade int,
    cidade varchar(100),
    doenca varchar(100)
);

create table consultas (
    codm int,
    codp int,
    data date,
    hora time,
    foreign key (codm) references medicos(codm),
    foreign key (codp) references pacientes(codp)
);

insert into ambulatorios values
(1, 2, 10),
(2, 3, 15);

insert into medicos values
(101, '11111111111', 'ana silva', 45, 'joão pessoa', 'cardiologia', 1),
(102, '22222222222', 'pedro silva', 50, 'campina grande', 'pediatria', 2),
(103, '33333333333', 'joão silva', 38, 'guarabira', 'dermatologia', 1);

insert into pacientes values
(201, '99999999999', 'daniel silva', 30, 'joão pessoa', 'gripe'),
(202, '88888888888', 'maria silva', 25, 'campina grande', 'alergia');

insert into consultas values
(101, 201, '2025-05-10', '08:00:00'),
(102, 202, '2025-05-10', '09:30:00');

create view vw_medico_paciente_hora as
select 
    m.nome as nome_medico,
    p.nome as nome_paciente,
    c.hora
from consultas c
join medicos m on c.codm = m.codm
join pacientes p on c.codp = p.codp;

create view vw_hora_andar_medico as
select 
    c.hora,
    a.andar,
    m.codm
from consultas c
join medicos m on c.codm = m.codm
join ambulatorios a on m.nroa = a.nroa;

create view vw_medico_consultas_completo as
select 
    m.nome as nome_medico,
    c.data,
    c.hora
from medicos m
left join consultas c on m.codm = c.codm;

create view vw_dados_paciente_medico_ambulatorio as
select 
    p.idade as idade_paciente,
    p.doenca,
    m.nome as nome_medico,
    m.nroa as cod_ambulatorio
from consultas c
join pacientes p on c.codp = p.codp
join medicos m on c.codm = m.codm;
  
