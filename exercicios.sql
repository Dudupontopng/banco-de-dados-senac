create table funcionario (
    id serial primary key,
    nome varchar(100) not null,
    cargo varchar(50) not null,
    salario decimal(10, 2) not null,
    data_admissao date not null
-- ============================================================================
-- 1. ESTRUTURA ADMINISTRATIVA (FUNCIONÁRIOS)
-- ============================================================================

CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_admissao DATE NOT NULL
);

insert into funcionario (nome, cargo, salario, data_admissao)
values ('lorenzo', 'desenvolvedor', 5000.00, '2025-02-07');

insert into funcionario (nome, cargo, salario, data_admissao)
values ('vitor', 'desenvolvedor', 3000.00, '2026-03-28');

insert into funcionario (nome, cargo, salario, data_admissao)
values ('arthur', 'vendedor', 2000.00, '2025-08-13');

select * from funcionario;

--seleciona os funcionarios com salario maior que 3000
select nome, salario
from funcionario
where salario > 3000;

--seleciona os funcionarios que foram admissionados em 2025
select nome, salario
from funcionario
where extract(year from data_admissao) = 2025;

--lista nome e cargo apenas dos desenvolvedores
select nome, cargo
from funcionario
where cargo = 'desenvolvedor';

--Atualizar o cargo para gerente
update funcionario
set cargo = 'Gerente'
where id = 1;

--Deletar funcionario
delete from funcionario
where id = 2;

create table usuario (
    id serial primary key,
    nome varchar(100) not null,
    cpf varchar(11) unique not null,
    email varchar(100) unique,
    telefone varchar(20),
    data_cadastro timestamp not null default current_timestamp,
    ativo boolean default true
);
INSERT INTO funcionario (nome, cargo, salario, data_admissao) VALUES 
('lorenzo', 'desenvolvedor', 5000.00, '2025-02-07'),
('vitor', 'desenvolvedor', 3000.00, '2026-03-28'),
('arthur', 'vendedor', 2000.00, '2025-08-13');

create table forma_pagamento (
    id int primary key,
    nome varchar(20)
);
-- Consultas e modificações de funcionários
SELECT * FROM funcionario;

SELECT nome, salario FROM funcionario WHERE salario > 3000;

SELECT nome, salario FROM funcionario WHERE EXTRACT(YEAR FROM data_admissao) = 2025;

SELECT nome, cargo FROM funcionario WHERE cargo = 'desenvolvedor';

create table status (
    id int primary key,
    nome varchar(30)
UPDATE funcionario SET cargo = 'Gerente' WHERE id = 1;

DELETE FROM funcionario WHERE id = 2;


-- ============================================================================
-- 2. LOCALIZAÇÃO (CIDADES)
-- ============================================================================

CREATE TABLE cidade (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL
);

create table pedido (
    id serial primary key,
    usuario_id int not null,
    data_pedido timestamp not null default current_timestamp,
    valor_total decimal(10, 2) not null,
    status_id int not null,
    forma_pagamento_id int not null,
    observacao varchar(200),
    foreign key (usuario_id) references usuario(id),
    foreign key (forma_pagamento_id) references forma_pagamento(id),
    foreign key (status_id) references status(id)
INSERT INTO cidade (nome, estado) VALUES
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG'),
('Curitiba', 'PR'),
('Fortaleza', 'CE');


-- ============================================================================
-- 3. CLIENTES E USUÁRIOS
-- ============================================================================

CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE,
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

INSERT INTO usuario (nome, cpf, email, telefone, ativo)
VALUES
INSERT INTO usuario (nome, cpf, email, telefone, ativo) VALUES
('João Silva', '12345678901', 'joao.silva@gmail.com', '(11) 99876-1234', TRUE),
('Maria Oliveira', '23456789012', 'maria.oliveira@yahoo.com', '(21) 99765-4321', TRUE),
('Carlos Souza', '34567890123', 'carlos.souza@hotmail.com', '(31) 99654-3210', FALSE),
@@ -87,25 +75,124 @@ VALUES
('Juliana Rocha', '90123456789', 'juliana.rocha@gmail.com', '(91) 99098-7654', TRUE),
('Bruno Carvalho', '01234567890', 'bruno.carvalho@outlook.com', '(92) 98987-6543', TRUE);

insert into forma_pagamento (id, nome) values
-- Vinculação de usuários às suas respectivas cidades
UPDATE usuario SET cidade_id = 3 WHERE id = 1;
UPDATE usuario SET cidade_id = 3 WHERE id = 2;
UPDATE usuario SET cidade_id = 2 WHERE id = 3;
UPDATE usuario SET cidade_id = 1 WHERE id = 4;
UPDATE usuario SET cidade_id = 3 WHERE id = 5;
UPDATE usuario SET cidade_id = 2 WHERE id = 6;

SELECT * FROM usuario;

-- Listagem de usuários e suas cidades
SELECT u.id, u.nome, u.cpf, c.nome AS nome_cidade, c.estado
FROM usuario u 
LEFT JOIN cidade c ON u.cidade_id = c.id;


-- 3.1 TABELA EXTRA DE CLIENTES (do seu segundo bloco)
CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    genero VARCHAR(1) NOT NULL,
    data_nascimento DATE NOT NULL
);

INSERT INTO cliente (nome, email, genero, data_nascimento) VALUES 
('João da Silva', 'joao@email.com', 'M', '1990-05-12'),
('João da Silva', 'joao@email.com', 'M', '1990-05-12'),
('Maria Souza','maria@email.com' ,'F', '1988-09-23');

SELECT * FROM cliente;
SELECT nome, email FROM cliente;
SELECT * FROM cliente WHERE nome = 'Maria Souza';
SELECT * FROM cliente WHERE genero = 'M';
SELECT * FROM cliente ORDER BY data_nascimento DESC;
UPDATE cliente SET email = 'maria.souza@email.com' WHERE id = 2;
DELETE FROM cliente WHERE id = 3;


-- ============================================================================
-- 4. DOCUMENTAÇÃO (PASSAPORTES)
-- ============================================================================

CREATE TABLE passaporte (
    id SERIAL PRIMARY KEY,
    numero VARCHAR(20) NOT NULL UNIQUE,
    usuario_id INT UNIQUE, 
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

INSERT INTO passaporte (numero, usuario_id) VALUES 
('BR100001', 1),
('BR100002', 2),
('BR100003', 3),
('BR100004', 4),
('BR100005', 5),
('BR100006', 6),
('BR100007', 7),
('BR100008', 8),
('BR100009', 9),
('BR100010', 10);

SELECT u.nome, u.cpf, p.numero, p.usuario_id
FROM usuario u 
INNER JOIN passaporte p ON u.id = p.usuario_id
WHERE u.id = 2;


-- ============================================================================
-- 5. VENDAS - APOIO (FORMA DE PAGAMENTO E STATUS)
-- ============================================================================

CREATE TABLE forma_pagamento (
    id INT PRIMARY KEY,
    nome VARCHAR(20)
);

CREATE TABLE status (
    id INT PRIMARY KEY,
    nome VARCHAR(30)
);

INSERT INTO forma_pagamento (id, nome) VALUES
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'PIX'),
(4, 'Dinheiro'),
(5, 'Boleto');

select * from forma_pagamento;
SELECT * FROM forma_pagamento;

insert into status (id, nome) values
INSERT INTO status (id, nome) VALUES
(1, 'Pago'),
(2, 'Pendente'),
(3, 'Enviado'),
(4, 'Cancelado');

select * from status;
SELECT * FROM status;


-- ============================================================================
-- 6. VENDAS - PEDIDOS
-- ============================================================================

INSERT INTO pedido (usuario_id, valor_total, status_id, forma_pagamento_id, observacao)
VALUES
CREATE TABLE pedido (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2) NOT NULL,
    status_id INT NOT NULL,
    forma_pagamento_id INT NOT NULL,
    observacao VARCHAR(200),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (forma_pagamento_id) REFERENCES forma_pagamento(id),
    FOREIGN KEY (status_id) REFERENCES status(id)
);

INSERT INTO pedido (usuario_id, valor_total, status_id, forma_pagamento_id, observacao) VALUES
(1, 250.75, 1, 1, 'Entrega expressa'),
(2, 89.90, 2, 3, 'Cliente pediu embalagem presente'),
(3, 560.00, 3, 5, NULL),
@@ -115,89 +202,194 @@ VALUES
(1, 310.20, 3, 1, 'Entregar após 18h'),
(3, 780.40, 1, 5, NULL),
(1, 150.00, 2, 3, 'Primeira compra do cliente'),
(5, 67.89, 1, 2, NULL);

select p.usuario_id, u.nome, p.valor_total, p.status_id, s.nome, p.forma_pagamento_id, f.nome, p.observacao
from pedido p
inner join usuario u on p.usuario_id = u.id 
inner join status s on p.status_id = s.id 
inner join forma_pagamento f on p.forma_pagamento_id = f.id;

--Juntar tabelas
select p.id, p.usuario_id, u.nome, p.data_pedido, p.valor_total
from pedido p
inner join usuario u on p.usuario_id = u.id;

INSERT INTO pedido (usuario_id, valor_total, status_id, forma_pagamento_id, observacao)
VALUES (5, 120.99, 1, 3, 'Força magalu');

select * from pedido;

create table produto (
    id serial primary key,
    nome varchar(100) not null,
    preco decimal(10, 2) not null,
    estoque int default 0
(5, 67.89, 1, 2, NULL),
(5, 120.99, 1, 3, 'Força magalu');

SELECT * FROM pedido;

-- Detalhamento dos pedidos com Joins
SELECT p.usuario_id, u.nome, p.valor_total, p.status_id, s.nome AS status_nome, p.forma_pagamento_id, f.nome AS forma_pagamento_nome, p.observacao
FROM pedido p
INNER JOIN usuario u ON p.usuario_id = u.id 
INNER JOIN status s ON p.status_id = s.id 
INNER JOIN forma_pagamento f ON p.forma_pagamento_id = f.id;

SELECT p.id, p.usuario_id, u.nome, p.data_pedido, p.valor_total
FROM pedido p
INNER JOIN usuario u ON p.usuario_id = u.id;

-- Filtro específico de pedidos do usuário 1
SELECT p.id, p.valor_total, u.id AS usuario_id, u.nome AS nome_usuario
FROM usuario u
INNER JOIN pedido p ON p.usuario_id = u.id
WHERE u.id = 1;


-- ============================================================================
-- 7. CATÁLOGO DE PRODUTOS
-- ============================================================================

CREATE TABLE produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

INSERT INTO produto (nome, descricao, preco, estoque) VALUES
('Mouse Gamer', 'Mouse RGB 7200 DPI', 150.00, 25),
('Teclado Mecânico', 'Teclado switch blue', 350.00, 15),
('Monitor 24"', 'Monitor Full HD IPS', 899.90, 10),
('Headset Gamer', 'Headset com microfone', 250.75, 20),
('Notebook i5', 'Notebook 16GB RAM SSD 512GB', 4500.00, 5),
('Cadeira Gamer', 'Cadeira ergonômica reclinável', 1200.50, 8),
('Webcam HD', 'Webcam 1080p', 89.90, 30),
('Mousepad XXL', 'Mousepad extra grande', 45.00, 40),
('SSD 1TB', 'SSD NVMe Gen4', 560.00, 12),
('Fonte 650W', 'Fonte modular 80 Plus Bronze', 310.20, 18);

-- Operações extras de produtos do seu bloco de notas
SELECT * FROM produto ORDER BY preco ASC;
UPDATE produto SET preco = 80.00 WHERE id = 1;
DELETE FROM produto WHERE id = 4;


-- ============================================================================
-- 8. RELAÇÃO PEDIDO x PRODUTO (ITENS DO PEDIDO)
-- ============================================================================

CREATE TABLE pedido_produto (
    id SERIAL PRIMARY KEY,
    pedido_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL,
    valor_total NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

insert into produto (nome, preco, estoque) values ('camisa', 80.00, 5);
insert into produto (nome, preco, estoque) values ('calça', 110.00, 3);
insert into produto (nome, preco) values ('tenis', 200.00);

select * from produto order by preco asc;
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade, valor_unitario, valor_total) VALUES
(1, 8, 3, 45.00, 135.00),
(1, 1, 1, 115.75, 115.75),
(2, 7, 1, 89.90, 89.90),
(3, 8, 4, 45.00, 180.00),
(3, 1, 2, 150.00, 300.00),
(3, 7, 1, 80.00, 80.00),
(4, 8, 2, 45.00, 90.00),
(4, 1, 1, 30.50, 30.50),
(5, 3, 1, 899.90, 899.90),
(5, 8, 2, 45.00, 90.00),
(5, 1, 1, 10.09, 10.09),
(6, 8, 1, 45.00, 45.00),
(7, 8, 2, 45.00, 90.00),
(7, 1, 1, 150.00, 150.00),
(7, 7, 2, 35.10, 70.20),
(8, 9, 1, 560.00, 560.00),
(8, 8, 2, 45.00, 90.00),
(8, 1, 1, 130.40, 130.40),
(9, 8, 2, 45.00, 90.00),
(9, 1, 2, 30.00, 60.00),
(10, 8, 1, 45.00, 45.00),
(10, 1, 3, 7.63, 22.89);

-- Relatório completo cruzando tudo (Pedido, Usuário e Produtos)
SELECT 
    pp.pedido_id AS pedido_id,
    u.nome AS nome_usuario,
    ped.data_pedido,
    prod.nome AS nome_produto,
    pp.valor_unitario,
    pp.quantidade,
    ped.valor_total
FROM pedido_produto pp
INNER JOIN pedido ped ON ped.id = pp.pedido_id
INNER JOIN produto prod ON prod.id = pp.produto_id
INNER JOIN usuario u ON ped.usuario_id = u.id
WHERE u.id = 1;


-- ============================================================================
-- 9. CONSULTAS FINAIS DE MÉTRICAS (CORRIGIDAS)
-- ============================================================================

-- Seleciona ID dos pedidos que faturaram entre 100 e 500
SELECT id FROM pedido WHERE valor_total BETWEEN 100 AND 500;

-- Conta quantos usuários utilizam e-mail do Outlook (Ignorando maiúsculas/minúsculas com ILIKE)
SELECT COUNT(id) FROM usuario WHERE email ILIKE '%outlook%';

select * from pedido where valor_total = (select max(valor_total) from pedido);

select * from produto where preco = (select max(preco) from produto);

select avg(preco) from produto p
inner join pedido_produto pp
on p.id=pp.pedido_id;

select p.id,
p.valor_total,
p.data_pedido,
u.nome,
pr.nome
from produto pr
inner join pedido_produto pp
on pr.id=pp.produto_id
inner join pedido p
on pp.pedido_id = p.id
inner join usuario u
on p.usuario_id=u.id
where p.valor_total > 300;

select u.nome,
c.nome,
c.estado
from cidade c
inner join usuario u
on c.id=u.cidade_id
where u.ativo = 'false'

update produto 
set preco = 80.00
where id = 1;

delete from produto
where id = 4;

create table cliente (
    id serial primary key,
    nome varchar(100) not null,
    email varchar(100),
    genero varchar(1) not null,
    data_nascimento date not null
);

insert into cliente (nome, email, genero, data_nascimento)
values ('João da Silva', 'joao@email.com', 'M', '1990-05-12');

insert into cliente (nome, email, genero, data_nascimento)
values ('João da Silva', 'joao@email.com', 'M', '1990-05-12');

insert into cliente (nome, genero, data_nascimento)
values ('Maria Souza', 'F', '1988-09-23');

-- seleciona todas as colunas de cliente
select * 
from cliente;

--seleciona somente nome e email de cliente
select nome, email
from cliente;

--filtra o cliente pelo nome(tipo if)
select *
from cliente 
where nome = 'Maria Souza';

--seleciona todas as colunas q o genero for 'M'
select *
from cliente 
where genero = 'M';

--ordena os clientes pela data de nascimento de forma descrescente
select *
from cliente 
order by data_nascimento desc;

--atualiza email do cliente
update cliente
set email = 'maria.souza@email.com'
where id = 2;

--deleta o cliente com id 3
delete from cliente 
where id = 3;
set preco = preco * 1.15
where nome ilike '%mouse%'

select * from produto;

select u.nome,
count(p.id) as total_pedidos
from usuario u 
left join pedido p
on u.id=p.id
group by u.nome;


select pr.nome,
sum(pr.preco) as valor__total_vendido
from produto pr
inner join pedido_produto pp
on pp.produto_id=pr.id
left join pedido p
on p.id=pp.pedido_id
group by pr.nome;

SELECT 
    u.nome AS nome_usuario,
    p.id AS pedido_id,
    p.valor_total AS valor_do_pedido
FROM usuario u
INNER JOIN pedido p 
ON u.id = p.usuario_id
WHERE p.valor_total > (SELECT AVG(valor_total) FROM pedido)
ORDER BY p.valor_total DESC;


select pr.nome,
pr.preco
from produto pr
where pr.preco > (select avg(preco) from produto)

select avg(preco) from produto
