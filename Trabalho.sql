create database esports;

create table arena (
    id_arena serial primary key,
    nome_arena varchar(100) not null,
    capacidade int not null,
    modalidade varchar(50) not null
);

create table times (
    id_time serial primary key,
    nome_time varchar(100) not null,
    modalidade varchar(50)
);

create table patrocinador (
    id_patrocinador serial primary key,
    nome_patrocinador varchar(100) not null,
    email_patrocinador varchar(100) not null,
    telefone_patrocinador varchar(20) not null
);
create table patrocinio_time(
id_patrocinio_time serial primary key,
fk_patrocinio int,
fk_time int,
foreign key(fk_patrocinio) references patrocinador(id_patrocinador),
foreign key(fk_time) references times(id_time)
);
create table streamer (
    id_streamer serial primary key,
    nome_streamer varchar(50) not null,
    plataforma varchar(50),
    seguidores int,
    fk_time int,
	foreign key(fk_time) references times(id_time)
);

create table jogadores (
    id_jogador serial primary key,
    fk_time int,
    nome_jogador varchar(100) not null,
    nickname varchar(100) not null,
    data_nascimento date not null,
    salario decimal(10,2) not null,
    foreign key (fk_time) references times(id_time)
);

create table partida (
    id_partida serial primary key,
    fk_time_casa int,
    fk_time_visitante int,
    fk_arena int,
    horario time,
    foreign key (fk_time_casa) references times(id_time),
    foreign key (fk_time_visitante) references times(id_time),
    foreign key (fk_arena) references arena(id_arena)
);
create table resultado(
id_resultado serial primary key,
time_ganhador int, 
time_perdedor int,
fk_partida int,
foreign key(time_ganhador) references times(id_time),
foreign key(time_perdedor) references times(id_time),
foreign key(fk_partida) references partida(id_partida)
);

create table ingresso (
    id_ingresso serial primary key,
    tipo varchar(50) not null,
    fk_arena int,
    foreign key (fk_arena) references arena(id_arena)
);

create table visitante (
	id_visitante serial primary key,
    nome_visitante varchar(100) not null,
    email_visitante varchar(100) not null,
    telefone_visitante varchar(20) not null
);
create table vendas(
id_venda serial primary key,
fk_visitante int,
fk_ingresso int,
foreign key(fk_visitante) references visitante(id_visitante),
foreign key(fk_ingresso) references ingresso(id_ingresso)
);

INSERT INTO arena (nome_arena, capacidade, modalidade) VALUES
('Arena CBLOL', 1500, 'League of Legends'),
('Jeunesse Arena', 12000, 'Counter-Strike 2'),
('Allianz Parque eSports', 5000, 'Valorant'),
('Maracanãzinho eSports', 8000, 'Free Fire'),
('Arena Gamer SP', 1200, 'Rainbow Six Siege'),
('Gimnásio Ibirapuera', 10000, 'League of Legends'),
('Espaço Unimed Games', 3000, 'Rocket League'),
('Arena eSports BR', 2000, 'Valorant'),
('Cyber Space Arena', 800, 'StarCraft II'),
('Alpha Gaming Stage', 2500, 'Dota 2');

INSERT INTO times (nome_time, modalidade) VALUES
('LOUD', 'League of Legends'),
('FURIA', 'Counter-Strike 2'),
('MIBR', 'Valorant'),
('Pain Gaming', 'League of Legends'),
('Fluxo', 'Free Fire'),
('Los Grandes', 'Rainbow Six Siege'),
('w7m esports', 'Rainbow Six Siege'),
('Red Canids', 'League of Legends'),
('Team Liquid', 'Valorant'),
('Imperial Esports', 'Counter-Strike 2');

INSERT INTO patrocinador (nome_patrocinador, email_patrocinador, telefone_patrocinador) VALUES
('Banco Itaú', 'marketing@itau.com.br', '11999991111'),
('Red Bull', 'sports@redbull.com', '11999992222'),
('Betano', 'patrocinios@betano.com', '11999993333'),
('Corsair', 'brasil@corsair.com', '11999994444'),
('Logitech G', 'suporte@logitechg.com', '11999995555'),
('Razer Brasil', 'contato@razer.com.br', '11999996666'),
('Monster Energy', 'sales@monsterenergy.com', '11999997777'),
('TNT Energy Drink', 'parcerias@tnt.com.br', '11999998888'),
('Intel', 'inside@intel.com', '11999999999'),
('Nvidia', 'geforce@nvidia.com', '11999990000');

INSERT INTO visitante (nome_visitante, email_visitante, telefone_visitante) VALUES
('Carlos Silva', 'carlos.silva@email.com', '11988881111'),
('Ana Souza', 'ana.souza@email.com', '21988882222'),
('Marcos Oliveira', 'marcos.oli@email.com', '31988883333'),
('Julia Costa', 'julia.costa@email.com', '51988884444'),
('Lucas Pereira', 'lucas.p@email.com', '19988885555'),
('Beatriz Lima', 'bia.lima@email.com', '41988886666'),
('Gabriel Almeida', 'gabriel.al@email.com', '81988887777'),
('Mariana Santos', 'mari.santos@email.com', '71988888888'),
('Rodrigo Ribeiro', 'rodrigo.r@email.com', '27988889999'),
('Amanda Martins', 'amanda.m@email.com', '11988880000');

INSERT INTO patrocinio_time (fk_patrocinio, fk_time) VALUES
(1, 1), (2, 1),
(3, 2), (4, 2),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8);

INSERT INTO streamer (nome_streamer, plataforma, seguidores, fk_time) VALUES
('Coringa', 'Twitch', 3500000, 1),
('Gaules', 'Twitch', 4000000, 2),
('Tt', 'YouTube', 500000, 3),
('brTT', 'Twitch', 1200000, 4),
('Nobru', 'YouTube', 13000000, 5),
('El Gato', 'Booyah', 2000000, 6),
('Voltan', 'Twitch', 800000, 1),
('Fallen', 'Twitch', 1500000, 10),
('Alanzoka', 'Twitch', 6000000, 9),
('Cerol', 'YouTube', 7000000, 5);

INSERT INTO jogadores (fk_time, nome_jogador, nickname, data_nascimento, salario) VALUES
(1, 'Gabriel Sota', 'Fallen', '1991-05-30', 50000.00),
(1, 'Leonardo Souza', 'Robo', '1998-03-12', 25000.00),
(2, 'Yuri Santos', 'Yuurih', '1999-12-22', 30000.00),
(2, 'Kaike Cerato', 'Kscerato', '1999-09-12', 35000.00),
(3, 'João Miranda', 'jzz', '2002-04-05', 18000.00),
(4, 'Thiago Rodrigues', 'Tinowns', '1997-05-06', 28000.00),
(4, 'Matheus Rossini', 'Dynquedo', '1997-10-15', 22000.00),
(5, 'Bruno Goes', 'Nobru', '2001-01-20', 40000.00),
(9, 'Erick Santos', 'aspas', '2003-06-15', 60000.00),
(10, 'Felipe Gonçalves', 'brTT', '1991-02-19', 45000.00);

INSERT INTO ingresso (tipo, fk_arena) VALUES
('Pista Premium', 1),
('Cadeira Inferior', 1),
('Camarote Gamer', 2),
('Arquibancada', 2),
('VIP Experience', 3),
('Pista Comum', 3),
('Cadeira Superior', 4),
('Meia-Entrada Estudante', 5),
('Ingresso Social', 6),
('Passaporte 3 Dias', 7);

INSERT INTO partida (fk_time_casa, fk_time_visitante, fk_arena, horario) VALUES
(1, 4, 1, '13:00:00'),
(2, 10, 2, '15:30:00'),
(3, 9, 3, '18:00:00'),
(5, 8, 4, '14:00:00'),
(6, 7, 5, '19:00:00'),
(1, 2, 6, '16:00:00'),
(4, 8, 1, '13:00:00'),
(9, 3, 3, '21:00:00'),
(10, 2, 2, '17:45:00'),
(7, 6, 5, '20:00:00');

INSERT INTO resultado (time_ganhador, time_perdedor, fk_partida) VALUES
(1, 4, 1),
(2, 10, 2),
(9, 3, 3),
(5, 8, 4),
(7, 6, 5),
(1, 2, 6),
(4, 8, 7),
(9, 3, 8),
(10, 2, 9),
(6, 7, 10);

INSERT INTO vendas (fk_visitante, fk_ingresso) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
