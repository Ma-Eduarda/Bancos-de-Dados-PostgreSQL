CREATE DATABASE ecommerce;

-- SET SCHEMA 'public';

-- DROP TABLE IF EXISTS item_pedido;
-- DROP TABLE IF EXISTS produto;
-- DROP TABLE IF EXISTS categoria;
-- DROP TABLE IF EXISTS pedido;
-- DROP TABLE IF EXISTS transportadora;
-- DROP TABLE IF EXISTS cliente;
-- DROP TABLE IF EXISTS funcionario;

CREATE TABLE cliente(
 id SERIAL PRIMARY KEY,
 nome VARCHAR (50) NOT NULL,
 cpf VARCHAR (11) NOT NULL
);

CREATE TABLE funcionario (
 id SERIAL PRIMARY KEY,
 nome VARCHAR (50) NOT NULL,
 data_nascimento DATE NOT NULL,
 salario float NOT NULL
);

CREATE TABLE transportadora (
 id SERIAL PRIMARY KEY,
 nome VARCHAR (50) NOT NULL,
 telefone VARCHAR (15) NOT NULL
);

CREATE TABLE pedido(
 id SERIAL PRIMARY KEY,
 data DATE NOT NULL,
 id_cliente INT NOT NULL,
 id_transportadora INT,
 id_funcionario INT NOT NULL,
 FOREIGN KEY (id_cliente) references cliente(id),
 FOREIGN KEY (id_transportadora) references transportadora(id),
 FOREIGN KEY (id_funcionario) references funcionario(id)
);

CREATE TABLE categoria(
 id SERIAL PRIMARY KEY,
 nome VARCHAR (50) NOT NULL,
 descricao VARCHAR (100) NOT NULL
);

CREATE TABLE produto(
 id SERIAL PRIMARY KEY,
 nome VARCHAR (50) NOT NULL,
 descricao VARCHAR (100) NOT NULL,
 preco float,
 id_categoria INT,
 FOREIGN KEY (id_categoria) references categoria(id)
);

CREATE TABLE item_pedido (
 id_pedido INT NOT NULL,
 id_produto INT NOT NULL,
 PRIMARY KEY(id_pedido, id_produto),
 FOREIGN KEY (id_pedido) references pedido(id),
 FOREIGN KEY (id_produto) references produto(id)
);

INSERT INTO cliente (nome, cpf) VALUES('João Maria', '12345678910');
INSERT INTO cliente (nome, cpf) VALUES('Pedro Paulo', '98745612310');
INSERT INTO cliente (nome, cpf) VALUES('Felix Monteiro', '85754632124');
INSERT INTO cliente (nome, cpf) VALUES('Max Silva', '07654630105');

INSERT INTO funcionario (nome, data_nascimento, salario) VALUES('Felipe Silveira', '1990-12-12', 2500);
INSERT INTO funcionario (nome, data_nascimento, salario) VALUES('Leonardo Filgueira', '1995-10-10', 3000);
INSERT INTO funcionario (nome, data_nascimento, salario) VALUES('Matheus Oliveira', '1992-08-01', 2000);
INSERT INTO funcionario (nome, data_nascimento, salario) VALUES('Carlos André', '1997-10-10', 4000);

INSERT INTO transportadora (nome, telefone) VALUES('Correios', '99817-7161');
INSERT INTO transportadora (nome, telefone) VALUES('Brasil Express', '99631-6151');
INSERT INTO transportadora (nome, telefone) VALUES('Nordeste Express', '99875-9090');

INSERT INTO pedido (data, id_cliente, id_transportadora, id_funcionario) VALUES('2025-02-27', 1, 1, 2);
INSERT INTO pedido (data, id_cliente, id_transportadora, id_funcionario) VALUES('2025-02-28', 2, 2, 1);
INSERT INTO pedido (data, id_cliente, id_funcionario) VALUES('2025-03-01', 1, 2);
INSERT INTO pedido (data, id_cliente, id_transportadora, id_funcionario) VALUES('2025-03-28', 2, 2, 4);

INSERT INTO categoria (nome, descricao) VALUES('Alimentos', 'Alimentos em geral');
INSERT INTO categoria (nome, descricao) VALUES('Bebidas', 'Bebidas em geral');

INSERT INTO produto (nome, descricao, preco, id_categoria) VALUES('Feijão Preto', 'Feijão Preto', 8.50, 1);
INSERT INTO produto (nome, descricao, id_categoria) VALUES('Feijão Verde', 'Feijão Verde', 1);
INSERT INTO produto (nome, descricao, preco) VALUES('Feijão Branco', 'Feijão Branco', 5.50);
INSERT INTO produto (nome, descricao, preco, id_categoria) VALUES('Arroz São Joaquim', 'Arroz São Joaquim', 7.50, 1);
INSERT INTO produto (nome, descricao, preco, id_categoria) VALUES('Café São Braz', 'Café São Braz', 14.90, 2);
INSERT INTO produto (nome, descricao, id_categoria) VALUES('Achocolatado Nescau', 'Achocolatado Nescau', 2);
INSERT INTO produto (nome, descricao, id_categoria) VALUES('Água Mineral', 'Água Mineral', 2);

INSERT INTO item_pedido (id_pedido, id_produto) VALUES(1, 1);
INSERT INTO item_pedido (id_pedido, id_produto) VALUES(1, 4);
INSERT INTO item_pedido (id_pedido, id_produto) VALUES(2, 5);
INSERT INTO item_pedido (id_pedido, id_produto) VALUES(3, 1);
INSERT INTO item_pedido (id_pedido, id_produto) VALUES(3, 5);
INSERT INTO item_pedido (id_pedido, id_produto) VALUES(4, 1);



-- 1) Produtos com "Feijão" no nome e que pertençam a alguma categoria
SELECT p.id, p.nome, c.nome AS categoria
FROM produto p
JOIN categoria c ON p.id_categoria = c.id
WHERE p.nome LIKE '%Feijão%';


-- 2) Produtos com "Feijão" no nome, que tenham categoria e preço definido
SELECT p.id, p.nome, c.nome AS categoria
FROM produto p
JOIN categoria c ON p.id_categoria = c.id
WHERE p.nome LIKE '%Feijão%'
AND p.preco IS NOT NULL;


-- 3) Produtos com "Feijão" no nome, sem preço definido, independentemente da categoria
SELECT p.id, p.nome, c.nome AS categoria
FROM produto p
LEFT JOIN categoria c ON p.id_categoria = c.id
WHERE p.nome LIKE '%Feijão%'
AND p.preco IS NULL;


-- 4) Funcionários que realizaram pedidos e nasceram após 01/01/1990, sem duplicação e ordenados do mais velho ao mais novo
SELECT DISTINCT f.id, f.nome, f.data_nascimento
FROM funcionario f
JOIN pedido p ON f.id = p.id_funcionario
WHERE f.data_nascimento > '1990-01-01'
ORDER BY f.data_nascimento ASC;


--5) Pedidos e produtos comprados pelo cliente com CPF "12345678910"
SELECT pe.id AS id_pedido, pe.data, pr.id AS id_produto, pr.nome AS produto
FROM pedido pe
JOIN cliente c ON pe.id_cliente = c.id
JOIN item_pedido ip ON pe.id = ip.id_pedido
JOIN produto pr ON ip.id_produto = pr.id
WHERE c.cpf = '12345678910';


-- 6) Transportadoras associadas a pelo menos um pedido (usando subconsulta)
SELECT t.id, t.nome
FROM transportadora t
WHERE t.id IN (SELECT DISTINCT id_transportadora FROM pedido WHERE id_transportadora IS NOT NULL);


-- 7) Pedidos do cliente com CPF "12345678910" (usando subconsulta)
SELECT *
FROM pedido
WHERE id_cliente = (SELECT id FROM cliente WHERE cpf = '12345678910');

