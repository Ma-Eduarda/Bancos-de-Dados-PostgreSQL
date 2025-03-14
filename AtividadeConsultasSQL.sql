CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(50),
    id_gerente INTEGER
);

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    primeiro_nome VARCHAR(100) NOT NULL,
    segundo_nome VARCHAR(100),
    ultimo_nome VARCHAR(100),
    data_nascimento DATE,
    cpf CHAR(14),
    rg VARCHAR(20),
    cidade VARCHAR(100),
    funcao VARCHAR(100),
    salario DOUBLE PRECISION,
    id_departamento INTEGER REFERENCES departamentos(id)
);


INSERT INTO departamentos (nome, localizacao, id_gerente) VALUES
('TI', 'São Paulo', 1),
('RH', 'Rio de Janeiro', 2),
('Financeiro', 'Belo Horizonte', 3);

INSERT INTO funcionarios (primeiro_nome, segundo_nome, ultimo_nome, data_nascimento, cpf, rg, cidade, funcao, salario, id_departamento) VALUES
('Carlos', 'Silva', NULL, '1990-05-20', '123.456.789-00', '1234567', 'São Paulo', 'Desenvolvedor', 3000, 1),
('Ana', 'Santos', 'Oliveira', '1985-10-10', '987.654.321-00', '7654321', 'Rio de Janeiro', 'Analista de RH', 2500, 2),
('João', NULL, 'Souza', '1992-07-15', '111.222.333-44', '1122334', 'São Paulo', 'Gerente de Projetos', 5000, 1),
('Maria', NULL, 'Ferreira', '1988-02-03', '222.333.444-55', '2233445', 'Belo Horizonte', 'Contadora', 3500, 3),
('Paulo', 'Henrique', 'Lima', '1995-08-25', '333.444.555-66', '3344556', 'São Paulo', 'Estagiário', 1200, 1);


-- 1 Funcionários com salário superior a R$ 1.000,00
SELECT primeiro_nome FROM funcionarios WHERE salario > 1000;


-- 2 Total da folha de pagamento
SELECT SUM(salario) AS total_folha FROM funcionarios;


-- 3 Cidades dos funcionários
SELECT DISTINCT cidade FROM funcionarios;


-- 4 Quantidade de funcionários na empresa
SELECT COUNT(*) AS total_funcionarios FROM funcionarios;


-- 5 Nome do funcionário, nome do departamento e função
SELECT f.primeiro_nome, d.nome AS departamento, f.funcao 
FROM funcionarios f 
JOIN departamentos d ON f.id_departamento = d.id;


-- 6 Departamentos com seus gerentes
SELECT d.nome AS departamento, f.primeiro_nome AS gerente
FROM departamentos d
JOIN funcionarios f ON d.id_gerente = f.id;


-- 7 Valor da folha de pagamento por departamento
SELECT d.nome AS departamento, SUM(f.salario) AS total_folha
FROM funcionarios f
JOIN departamentos d ON f.id_departamento = d.id
GROUP BY d.nome;


-- 8 Funcionários sem segundo nome
SELECT primeiro_nome, ultimo_nome 
FROM funcionarios 
WHERE segundo_nome IS NULL;


select * from funcionarios;
