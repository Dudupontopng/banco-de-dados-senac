create table funcionario (
    id serial primary key,
    nome varchar(100) not null,
    cargo varchar(50) not null,
    salario decimal(10, 2) not null,
    data_admissao date not null
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

create table forma_pagamento (
    id int primary key,
    nome varchar(20)
);

create table status (
    id int primary key,
    nome varchar(30)
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
);

INSERT INTO usuario (nome, cpf, email, telefone, ativo)
VALUES
('João Silva', '12345678901', 'joao.silva@gmail.com', '(11) 99876-1234', TRUE),
('Maria Oliveira', '23456789012', 'maria.oliveira@yahoo.com', '(21) 99765-4321', TRUE),
('Carlos Souza', '34567890123', 'carlos.souza@hotmail.com', '(31) 99654-3210', FALSE),
('Ana Pereira', '45678901234', 'ana.pereira@gmail.com', '(41) 99543-2109', TRUE),
('Fernanda Lima', '56789012345', 'fernanda.lima@outlook.com', '(51) 99432-1098', FALSE),
('Ricardo Gomes', '67890123456', 'ricardo.gomes@gmail.com', '(61) 99321-0987', TRUE),
('Patricia Alves', '78901234567', 'patricia.alves@yahoo.com', '(71) 99210-9876', TRUE),
('Lucas Martins', '89012345678', 'lucas.martins@hotmail.com', '(81) 99109-8765', FALSE),
('Juliana Rocha', '90123456789', 'juliana.rocha@gmail.com', '(91) 99098-7654', TRUE),
('Bruno Carvalho', '01234567890', 'bruno.carvalho@outlook.com', '(92) 98987-6543', TRUE);

insert into forma_pagamento (id, nome) values
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'PIX'),
(4, 'Dinheiro'),
(5, 'Boleto');

select * from forma_pagamento;

insert into status (id, nome) values
(1, 'Pago'),
(2, 'Pendente'),
(3, 'Enviado'),
(4, 'Cancelado');

select * from status;

INSERT INTO pedido (usuario_id, valor_total, status_id, forma_pagamento_id, observacao)
VALUES
(1, 250.75, 1, 1, 'Entrega expressa'),
(2, 89.90, 2, 3, 'Cliente pediu embalagem presente'),
(3, 560.00, 3, 5, NULL),
(4, 120.50, 4, 2, 'Pagamento não aprovado'),
(2, 999.99, 1, 3, 'Entrega agendada'),
(2, 45.00, 2, 4, NULL),
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
);

insert into produto (nome, preco, estoque) values ('camisa', 80.00, 5);
insert into produto (nome, preco, estoque) values ('calça', 110.00, 3);
insert into produto (nome, preco) values ('tenis', 200.00);

select * from produto order by preco asc;

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