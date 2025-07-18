create table clientes (
  id serial primary key,
  nome varchar(100),
  cpf varchar(11)
);

create table produtos (
  id serial primary key,
  nome varchar(100),
  preco numeric(10,2) 
);


insert into clientes (nome, cpf) values
('ana', '11111111111'),
('carlos', '22222222222');

insert into produtos (nome, preco) values
('cadeira', 150.00),
('mesa', 300.00),
('notebook', 2500.00);


create role gerente;
create role vendedor;
create role estagiario;


grant select, insert, update, delete on clientes, produtos, pedidos to gerente;
grant select, insert on clientes, produtos, pedidos to vendedor;
grant select on clientes to estagiario;

create role joao login password '123';
create role maria login password '123';
create role pedro login password '123';

grant gerente to joao;
grant vendedor to maria;
grant estagiario to pedro;


-- logado como gerente 
-- insert into clientes (nome, cpf) values ('julia', '33333333333');
-- update clientes set nome = 'ana maria' where id = 1;
-- delete from pedidos where id = 1;
-- select * from pedidos;

-- logado como vendedor
-- insert into clientes (nome, cpf) values ('alan', '44444444444');
-- select * from produtos;
-- update clientes set nome = 'carlos jr' where id = 2;  
-- delete from pedidos where id = 1;  -- deve falhar

-- logado como estagiario 
-- select * from clientes; 
-- insert into clientes (nome, cpf) values ('teste', '55555555555');  
-- select * from produtos;  -- deve falhar
-- insert into pedidos (cliente_id, produto_id, quantidade) values (3, 3, 1);  
