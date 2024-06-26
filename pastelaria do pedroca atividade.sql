CREATE DATABASE pastelaria_do_Vidu;
USE pastelaria_do_Vidu;

CREATE TABLE clientes_pastelaria(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
apelido VARCHAR(15),
data_nascimento CHAR(8),
telefone CHAR(15) NOT NULL UNIQUE,
cpf CHAR(14) NOT NULL UNIQUE,
email VARCHAR(40) UNIQUE,
cep CHAR(8),
rua VARCHAR(50) NOT NULL,
casa INT, 
bairro VARCHAR(30),
cidade VARCHAR(45)
);

CREATE TABLE pastel(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
categoria VARCHAR(45),
tamanho VARCHAR(15)
);

CREATE TABLE recheios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
ingredientes TEXT,
preco DECIMAL(10,2)
);

CREATE TABLE pastel_recheio (
id_pastel INT,
id_recheio INT,
FOREIGN KEY (id_pastel) REFERENCES pastel(id),
FOREIGN KEY (id_recheio) REFERENCES recheios(id),
PRIMARY KEY (id_pastel, id_recheio)
);

CREATE TABLE Pedidos (
id INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT,
data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
forma_pagamento VARCHAR(50),
FOREIGN KEY (id_cliente) REFERENCES clientes_pastelaria(id)
);

CREATE TABLE Precos_Pasteis (
id INT PRIMARY KEY AUTO_INCREMENT,
id_pastel INT,
id_recheio INT,
tamanho VARCHAR(20),
preco DECIMAL(10,2),
FOREIGN KEY (id_pastel) REFERENCES pastel(id),
FOREIGN KEY (id_recheio) REFERENCES recheios(id)
);

CREATE TABLE Pedido_Pastel (
id_pedido INT,
id_pastel INT,
quantidade INT,
FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
FOREIGN KEY (id_pastel) REFERENCES pastel(id),
PRIMARY KEY (id_pedido, id_pastel)
);
INSERT INTO clientes_pastelaria (nome, apelido, data_nacimento, telefone, cpf, email, cep, rua, casa, bairro, cidade) 
VALUES ('MARIA', 'MARI', '18/04/1999', '(75)982569387', '896-555-600.32', 'MARIA36@GMAIL.COM','44050-898','RUA POJUCA', 'PEDROCA' 'FEIRA DE SANTANA')
       ('JOANA', 'ANA', '09/07/2004', '(75)986594289', '963-584-521.87', 'JOANA98@GMAIL.COM', '44086-978', 'RUA DA PALMA', 'BARAUNA', 'FEIRA DE SANATANA')
       ('MARCOS', 'CABEÇA', '17/06/2008', '(75)982642590', '864-900-666.89', 'MARCOS25@GMAIL.COM', '44058-963', 'RUA VARGAS', 'TOMBA', 'FEIRA DE SANTANA')
       ('EDVALDO', 'BABALU', '17/08/2006', '(75)982569984', '898-500-444.48', 'EDVALDO96@GMAIL.COM', '44075-854', 'RUA GUSTA',' MANGABEIRA', 'FEIRA DE SANTANA')
       ('ANTONIO', 'TONINHO', '18/08/2007', '(75)982546752', '869-444-569-85', 'ANTONIO@GMAIL.COM', '44058-963', 'RUA SANTOS', 'BARAUNA', 'FEIRA DE SANTANA')
