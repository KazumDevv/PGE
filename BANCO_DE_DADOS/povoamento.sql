USE PGE;

INSERT INTO Pessoa (nome_pessoa, cpf, email) VALUES
('pessoa1', '123.456.789-00', 'pessoa1@email.com'),
('pessoa2', '987.654.321-00', 'pessao2@email.com'),
('pessoa3', '123.456.789-01', 'pessoa3@email.com'),
('pessoa4', '987.654.321-02', 'pessao4@email.com'),
('pessoa5', '987.654.321-03', 'pessao5@email.com');

INSERT INTO Procurador (id_procurador, oab) VALUES
(1, 'OAB123456'),
(2, 'OAB654321');

INSERT INTO Prazo (data_inicio, data_vencimento) VALUES
('2025-03-14', '2025-03-21'),
('2025-03-10', '2025-03-25');

INSERT INTO Processo (orgao, assunto, status, id_procurador, id_prazo) VALUES
('orgao1', 'Ação Trabalhista', 'Em andamento', 1, 1),
('orgao2', 'Recurso Criminal', 'Concluído', 2, 2);

INSERT INTO Cliente (id_cliente, id_processo) VALUES
(3, 1),
(4, 2),
(5, 1);

INSERT INTO Documento (id_processo, nome_documento, tipo_documento) VALUES
(1, 'Petição Inicial - Processo 1', 'Petição Inicial'),
(2, 'Recurso - Processo 2', 'Recurso');
