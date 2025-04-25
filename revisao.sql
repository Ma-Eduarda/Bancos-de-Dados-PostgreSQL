CREATE TABLE Motorista (
    CodMot INTEGER PRIMARY KEY,
    CPF NUMERIC(10),
    CNH NUMERIC(10),
    Nome VARCHAR(50),
    Endereco VARCHAR(100)
);

CREATE TABLE Veiculo (
    Placa CHAR(7) PRIMARY KEY,
    Capacidade INTEGER
);

CREATE TABLE Entrega (
    Hora TIME,
    Data DATE,
    NumVen INTEGER,
    Placa CHAR(7),
    CodMot INTEGER,
    PRIMARY KEY (NumVen, Placa, CodMot),
    FOREIGN KEY (Placa) REFERENCES Veiculo(Placa),
    FOREIGN KEY (CodMot) REFERENCES Motorista(CodMot)
);

CREATE TABLE Vendedor (
    CodVdd INTEGER PRIMARY KEY,
    CPF NUMERIC(11),
    V_Comissao NUMERIC(4,2),
    Nome VARCHAR(50),
    Endereco VARCHAR(100)
);

CREATE TABLE Cliente (
    CodCli INTEGER PRIMARY KEY,
    Nome VARCHAR(50),
    Tel CHAR(20),
    Endereco VARCHAR(100),
    CPF NUMERIC(11),
    Email VARCHAR(50)
);


CREATE TABLE Produto (
    CodPro INTEGER PRIMARY KEY,
    Custo NUMERIC(11,2),
    Descricao TEXT,
    Preco NUMERIC(11,2),
    Nome VARCHAR(50)
);


CREATE TABLE Venda (
    NumVen INTEGER PRIMARY KEY,
    Valor_Total NUMERIC(11,2),
    CodVdd INTEGER,
    CodCli INTEGER,
    FOREIGN KEY (CodVdd) REFERENCES Vendedor(CodVdd),
    FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);


CREATE TABLE Item_venda (
    CodPro INTEGER,
    NumVen INTEGER,
    VUnitario NUMERIC(11,2),
    Qtd INTEGER,
    PRIMARY KEY (CodPro, NumVen),
    FOREIGN KEY (CodPro) REFERENCES Produto(CodPro),
    FOREIGN KEY (NumVen) REFERENCES Venda(NumVen)
);


INSERT INTO Motorista (CodMot, CPF, CNH, Nome, Endereco) VALUES
(1, 1234567890, 9876543210, 'Carlos Silva', 'Rua A, 100'),
(2, 2345678901, 8765432109, 'Fernanda Lima', 'Rua B, 200'),
(3, 3456789012, 7654321098, 'João Souza', 'Rua C, 300');


INSERT INTO Veiculo (Placa, Capacidade) VALUES
('ABC1234', 500),
('DEF5678', 1000),
('GHI9012', 750);

INSERT INTO Vendedor (CodVdd, CPF, V_Comissao, Nome, Endereco) VALUES
(1, 11122233344, 5.50, 'Paula Ramos', 'Av. Central, 50'),
(2, 55566677788, 6.75, 'Bruno Castro', 'Av. Norte, 80'),
(3, 99988877766, 4.25, 'Lucas Alves', 'Rua das Flores, 120');


INSERT INTO Cliente (CodCli, Nome, Tel, Endereco, CPF, Email) VALUES
(1, 'Mariana Souza', '83999990001', 'Rua Jardim, 45', 12312312312, 'mariana@email.com'),
(2, 'Ricardo Lima', '83988880002', 'Av. Paulista, 200', 45645645645, 'ricardo@email.com'),
(3, 'Bruna Ferreira', '83977770003', 'Rua da Paz, 78', 78978978978, 'bruna@email.com');


INSERT INTO Produto (CodPro, Custo, Descricao, Preco, Nome) VALUES
(1, 500.00, 'Sofá', 1200.00, 'Sofá'),
(2, 300.00, 'Mesa', 750.00, 'Mesa'),
(3, 150.00, 'Cadeira', 250.00, 'Cadeira');

INSERT INTO Venda (NumVen, Valor_Total, CodVdd, CodCli) VALUES
(1, 1700.00, 1, 1),
(2, 1000.00, 2, 2),
(3, 500.00, 3, 3);

INSERT INTO Item_venda (CodPro, NumVen, VUnitario, Qtd) VALUES
(1, 1, 1200.00, 1),
(2, 1, 750.00, 1),
(2, 2, 750.00, 1),
(3, 2, 250.00, 1),
(3, 3, 250.00, 2);

INSERT INTO Entrega (Hora, Data, NumVen, Placa, CodMot) VALUES
('10:00', '2025-04-20', 1, 'ABC1234', 1),
('14:00', '2025-04-21', 2, 'DEF5678', 2),
('09:00', '2025-04-22', 3, 'GHI9012', 3);
