CREATE DATABASE IF NOT EXISTS PGE;
USE PGE;

CREATE TABLE Pessoa (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome_pessoa VARCHAR(255) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Procurador (
    id_procurador INT PRIMARY KEY,
    oab VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (id_procurador) REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Prazo (
    id_prazo INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_vencimento DATE NOT NULL
);

CREATE TABLE Processo (
    id_processo INT AUTO_INCREMENT PRIMARY KEY,
    orgao VARCHAR(255) NOT NULL,
    assunto VARCHAR(255) NOT NULL,
    status ENUM('Em andamento', 'Concluído', 'Vencido') NOT NULL,
    id_procurador INT NOT NULL,
    id_prazo INT NOT NULL,
    FOREIGN KEY (id_prazo) REFERENCES Prazo(id_prazo),
    FOREIGN KEY (id_procurador) REFERENCES Procurador(id_procurador)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    id_processo INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_processo) REFERENCES Processo(id_processo)
);

CREATE TABLE Documento (
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    id_processo INT NOT NULL,
    nome_documento VARCHAR(255) NOT NULL,
    tipo_documento ENUM('Petição Inicial', 'Contestação', 'Recurso', 'Despacho') NOT NULL,
    FOREIGN KEY (id_processo) REFERENCES Processo(id_processo)
);
