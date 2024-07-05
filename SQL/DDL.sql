CREATE DATABASE BDCREDISIMPLES;

CREATE TABLE cliente (
    idcliente INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(11) NOT NULL,
    idade INT NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    fonte_renda VARCHAR(50),
    faixa_renda VARCHAR(50),
    id_profissao INT,
    FOREIGN KEY (profissao_id) REFERENCES profissao(idprofissao)
);

CREATE TABLE produto (
	idproduto 	INT IDENTITY PRIMARY KEY NOT NULL,
	nome_produto VARCHAR(255) NOT NULL,	
	descrição	TEXT,	
	tipo_produto 	VARCHAR(100) NOT NULL,	
	valor_minimo	DECIMAL(10, 2) NOT NULL	,
	valor_maximo	DECIMAL(10, 2) NOT NULL,	
	numero_parcelas_maximo	INT NOT NULL,	
	condicoes_especiais	 TEXT	
);


CREATE TABLE contrato (
    idcontrato INT IDENTITY(1,1) PRIMARY KEY,
    valor_emprestimo DECIMAL(10, 2) NOT NULL,
    numero_parcelas INT NOT NULL,
    taxa_juros DECIMAL(5, 2) NOT NULL,
    data_contratacao DATE NOT NULL,
    status_contrato VARCHAR(20) NOT NULL,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(idcliente),
    FOREIGN KEY (produto_id) REFERENCES produto(idproduto)
);

CREATE TABLE pagamento (
	idpagamento 	INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	numero_parcela	INT NOT NULL,	
	valor_parcela	DECIMAL (10,2) NOT NULL,	
	data_vencimento	DATE NOT NULL,	
	data_pagamento	DATE,	
	status_pagamento VARCHAR (200) NOT NULL,	
	contrato_id	INT NOT NULL,	
	FOREIGN KEY (contrato_id)REFERENCES contrato(idcontrato)	
);
CREATE TABLE perfil_demografico (
	idperfildemografico	INT IDENTITY PRIMARY KEY NOT NULL,	
	idade_media	INT NOT NULL,	
	distribuicao_idade	VARCHAR(255) NOT NULL,	
	distribuicao_sexo	VARCHAR(255) NOT NULL,	
	);

CREATE TABLE profissao (
    idprofissao INT PRIMARY KEY IDENTITY(1,1),
    nome_profissão NVARCHAR(100)
);

SELECT * FROM perfil_demografico;

ALTER TABLE perfil_demografico ADD distribuicao_geografica	VARCHAR(255) NOT NULL;

TRUNCATE TABLE cliente; --  excluir todos os dados de uma tabela

--Remover coluna nome da tabela cliente
ALTER TABLE CLIENTE DROP COLUMN NOME;


CREATE TABLE fonte_renda (
    idfonte_renda INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    fonte_renda VARCHAR(100) NOT NULL
);

CREATE TABLE faixa_renda (
    idfaixa_renda INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    faixa_renda VARCHAR(100) NOT NULL,
    fonte_renda_id INT NOT NULL,
    FOREIGN KEY (fonte_renda_id) REFERENCES fonte_renda(idfonte_renda)
);

SELECT TABLE_NAME  -- listar as tabelas disponíveis
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'; 
