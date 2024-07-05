USE BDCREDISIMPLES;

SELECT TABLE_NAME  -- listar as tabelas disponiveis
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';


SELECT * FROM cliente;

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'cliente';

INSERT INTO cliente (nome, cpf, idade, data_nascimento, email, telefone, fonte_renda, faixa_renda)
VALUES ('Tiago da Paz', '57036419261', 45, '1980-10-15', 'paz15@exemplo.com', '(84)0413-5930', 'autônomo', 'Baixa renda');

INSERT INTO cliente (nome, cpf, idade, data_nascimento, email, telefone, fonte_renda, faixa_renda, profissao)
VALUES('Raquel Jesus','35240879656',29,'1989-05-08', 'raquel2019@example.net','(11)1666 6664)','CLT', 'Baixa Renda', 'Costureira');

ALTER TABLE cliente
ADD profissao VARCHAR(100); --Inserindo colina profissão a tabela cliente

UPDATE cliente
SET profissao = 'Motorista de Uber'  --Inserindo dado do atributo profissao do idcliente 1
WHERE idcliente = 1;

SELECT * FROM cliente;

INSERT INTO cliente (nome, cpf, idade, data_nascimento, email, telefone, fonte_renda, faixa_renda, profissao)
VALUES 
('Ana Julia Moraes', '273.498.651-55', 32, '1992-10-15', 'Anajulia@example.com', '(84) 0413-5930', 'CLT', 'Média renda', 'Contadora'),
('Evelyn Caldeira', '541.730.986-93', 27, '1996-05-12', 'evelyn12@example.com', '0500-557-3583', 'Servidor público Estadual', 'Média renda', 'Técnico em Enfermagem'),
('Alexia Novaes', '968.415.302-33', 37, '1987-08-23', 'novais578@example.net', '(31) 6306-4522', 'Contrato PJ', 'Média renda', 'Consultoria de RH'),
('Alana da Rocha', '132.490.865-33', 33, '1990-02-11', 'rocha50@example.net', '(031) 7553-0116', 'CLT', 'Baixa renda', 'Vendedor varejo');



SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'produto';

ALTER TABLE cliente 
ALTER COLUMN cpf VARCHAR(14);


INSERT INTO produto (nome_produto, descrição, tipo_produto,valor_maximo, valor_minimo, numero_parcelas_maximo, condicoes_especiais)
VALUES
('Crédito direto ao consumidor - energia','Débito na fatura de energia','Crédito Fatura de energia', 2.200,500, 24, 'Não comprova renda'),
('Crédito com débito em conta', 'Debitado em conta','Débito em conta', 3.000, 500, 18, 'Comprova renda'),
('Crédito pessoal com garantia AUTO','Carros de até 20 anos como garantia', 'Débito em conta', 50.000, 5.000, 36,'Comprova renda'),
('Energia', 'Desconto na fatura de energia','Débito na fatura de energia', 2.200, 400, 22, 'Não comprova renda'),
('Crédito pessoal Boleto', 'Pagamento por boleto','Boleto',10.000, 500, 24,'Comprova renda'),
('Crédito consignado', 'Desconto em folha de pagamento - Até 30% da renda', 'Consignado',5.000, 300,36, 'Não comprova renda')
;

SELECT * FROM produto;

DELETE FROM cliente;

ALTER TABLE cliente  ---Apaguei os dados do clientes para remover colunas da tabela cliente
DROP COLUMN profissao;
DROP COLUMN fonte_renda;
DROP COLUMN faixa_renda;

SELECT * FROM fonte_renda;

INSERT INTO fonte_renda (descricao)
VALUES
('consignado'),
('Contrato PJ'),
('Servdor Municipal'),
('Servidor Estadual'),
('Servidor Federal'),
('Autônomo'),
('Pensionista aposentado'),
('Pensionaista do governo'),
('Renda de aluguel'),
('Empresário')
;


SELECT * FROM profissao;

SELECT nome, idade
FROM cliente
ORDER BY idade DESC;
