-- Criação do Banco de Dados para a Insight Places
CREATE DATABASE IF NOT EXISTS insight_places;
USE insight_places;

-- 1. Tabela de Proprietários
CREATE TABLE IF NOT EXISTS proprietarios (
    id_proprietario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20)
);

-- 2. Tabela de Clientes (Hóspedes)
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20)
);

-- 3. Tabela de Hospedagens (Imóveis)
CREATE TABLE IF NOT EXISTS hospedagens (
    id_hospedagem INT AUTO_INCREMENT PRIMARY KEY,
    id_proprietario INT NOT NULL,
    tipo ENUM('Apartamento', 'Casa', 'Quarto', 'Chácara') NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    diaria DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_proprietario) REFERENCES proprietarios(id_proprietario)
);

-- 4. Tabela de Reservas
CREATE TABLE IF NOT EXISTS reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_hospedagem INT NOT NULL,
    id_cliente INT NOT NULL,
    data_checkin DATE NOT NULL,
    data_checkout DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    status_reserva ENUM('Confirmada', 'Cancelada', 'Concluída') DEFAULT 'Confirmada',
    FOREIGN KEY (id_hospedagem) REFERENCES hospedagens(id_hospedagem),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- 5. Tabela de Avaliações
CREATE TABLE IF NOT EXISTS avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATE NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);

-- Exemplo de Inserção de Dados (DML)
INSERT INTO proprietarios (nome, cpf, email, telefone) 
VALUES ('Carlos Silva', '111.222.333-44', 'carlos@email.com', '(11) 98765-4321');

INSERT INTO clientes (nome, cpf, email, telefone) 
VALUES ('Ana Souza', '555.666.777-88', 'ana@email.com', '(21) 99999-8888');

INSERT INTO hospedagens (id_proprietario, tipo, endereco, cidade, estado, diaria) 
VALUES (1, 'Apartamento', 'Av. Atlântica, 100', 'Rio de Janeiro', 'RJ', 250.00);

INSERT INTO reservas (id_hospedagem, id_cliente, data_checkin, data_checkout, valor_total) 
VALUES (1, 1, '2026-11-01', '2026-11-05', 1000.00);
