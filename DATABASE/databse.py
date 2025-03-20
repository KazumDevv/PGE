import mysql.connector

conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="joao1234"  
)

cursor = conexao.cursor()

cursor.execute("""CREATE DATABASE IF NOT EXISTS PGE;
USE PGE;

CREATE TABLE Pessoa (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome_pessoa VARCHAR(255) NOT NULL,
    cpf VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Procurador (
    id_procurador INT PRIMARY KEY,
    oab VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (id_procurador) REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    FOREIGN KEY (id_cliente) REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Processo (
    id_processo INT AUTO_INCREMENT PRIMARY KEY,
    numero_processo VARCHAR(50) UNIQUE NOT NULL,
    orgao VARCHAR(255) NOT NULL,
    assunto VARCHAR(255) NOT NULL,
    status ENUM('Em andamento', 'Concluído', 'vencido') NOT NULL,
    id_procurador INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_procurador) REFERENCES Procurador(id_procurador),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Prazo (
    id_prazo INT AUTO_INCREMENT PRIMARY KEY,
    id_processo INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_vencimento DATE NOT NULL,
    FOREIGN KEY (id_processo) REFERENCES Processo(id_processo)
);

CREATE TABLE Documento (
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    id_processo INT NOT NULL,
    nome_documento VARCHAR(255) NOT NULL,
    tipo_documento ENUM('Petição Inicial', 'Contestação', 'Recurso', 'Despacho') NOT NULL,
    caminho_arquivo VARCHAR(500) NOT NULL,
    FOREIGN KEY (id_processo) REFERENCES Processo(id_processo)
);
""")

print("Tabela criada com sucesso!")
cursor.close()
conexao.close()
