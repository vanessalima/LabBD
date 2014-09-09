/*
 * Carlos Humberto dos Santos Baqueta	7987456
 * Vanessa Apolinário de Lima			7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 01
 *
 * Script de Criação < scriptCria.sql >
 * 
 */
/
-- Configuração do uso de caracteres especiais
ALTER SESSION SET NLS_LANGUAGE= 'PORTUGUESE' NLS_TERRITORY= 'BRAZIL';
/
-- Evita problemas com a criação incorreta de sequências 
ALTER SESSION SET deferred_segment_creation = FALSE;
/
-- Remoção das Tabelas
DROP TABLE evento CASCADE CONSTRAINT;
DROP TABLE edicao CASCADE CONSTRAINT;
DROP TABLE patrocinador CASCADE CONSTRAINT;
DROP TABLE patrocinio CASCADE CONSTRAINT;
DROP TABLE despesa CASCADE CONSTRAINT;
/
-- Remoção das Sequências
DROP SEQUENCE SEQ_CODEV_EVENTO;
DROP SEQUENCE SEQ_NUMED_EDICAO;
/
-- Criação da tabela Evento
/*
 * Esta tabela contém os dados de um evento no qual:
 * 	codEv é o código do evento e a chave primária desta tabela
 *	nomeEv é o nome do evento e a também compõe a chave secundária desta tabela
 *	descricaoEv contém um texto descrevendo brevemente o evento, tais como a 
 área de interesse
 *	websiteEv é o site do evento que deve iniciar no formato http:// ou https://
 *	totalArtigosApresentadosEv é um atributo derivado que armazena a 
 quantidade total de artigos apresentados no evento em todas as suas edição
 */
CREATE TABLE evento (
	codEv Number(5) NOT NULL,	-- Chave primária
	nomeEv Varchar2(100) NOT NULL, -- Cláusula unica (chave secundária)
	descricaoEv Varchar2(1000),
	websiteEv Varchar2(200),
	totalArtigosApresentadosEv Number(20), -- Atributo derivado que representa o total de artigos apresentados
	CONSTRAINT PK_EVENTO PRIMARY KEY (codEv), -- PK_EVENTO define a restrição de chave primária
	CONSTRAINT UN_NOME_EV UNIQUE(nomeEv) -- UN_NOME_EV define a restrição UNIQUE (chave secundária)
);
/
-- Criação da tabela Edição
/*
 * Esta tabela comtém os dados de uma edição de um dado evento no qual:
 *	codEv é uma chave estrangeira da tabela evento e que é utilizada 
 também como chave primária, devido a relação de entidade-fraca
 *	numEd é uma chave primária dessa tabela que contém o código da edição, 
 diferenciando cada edição do evento das demais
 *	dataInicioEd representa a data inicial da edição
 *	dataFimEd representa a data de término da edição
 *	localEd representa o local onde o evento irá ocorrer no formato Cidade, País
 *	taxaEd representa o custo que os participantes devem pagar para
 participar da edição
 *	saldoFinanceiroEd é um atributo derivado que armazena a situação 
 financeira atual do evento, contando com o recebimento de patrocínios, 
 taxas e com os gastos da edição
 *	qtdArtigosApresentadosEd é um atributo derivado que armazena a quantidade
 total de artigos apresentados na edição
 */
CREATE TABLE edicao (
	codEv Number(5) NOT NULL,	-- Chave primária e estrangeira (identifica identidade fraca)
	numEd Number(5) NOT NULL, -- Chave primária para diferenciar de evento
	dataInicioEd Date, -- Máscara da data DD/MM/YYYY
	dataFimEd Date, -- Máscara da data DD/MM/YYYY
	localEd Varchar2(20), -- Cidade, País
	taxaEd Number(10), -- Valor inteiro da taxa de inscrição
	saldoFinanceiroEd Number(30), -- atributo derivado que mostra o saldo da edição
	qtdArtigosApresentadosEd Number(10), -- atributo derivado que soma a quantidade de artigos apresentados na edição
	CONSTRAINT PK_EDICAO PRIMARY KEY (codEv, numEd), -- PK_EDICAO define a restrição de chave primária
	CONSTRAINT FK_EDICAO_EVENTO FOREIGN KEY (codEv) REFERENCES evento(codEv) ON DELETE CASCADE -- FK_EDICAO_EVENTO define uma restrição
																									-- de integridade referencial
);
/
-- Criação da tabela de Patrocinador
/*
 * Esta tabela contém dados todas as empresas que já patrocinaram alguma edição
 de algum evento, armazendo os dados:
 *	cnpjPat que representa o cnpj da empresa patrocinadora com 14 números, que podem 
 ser passados para o formato de XX.XXX.XXX/XXXX-XX
 *	razaoSocialPat que armazena o nome original e completo da empresa
 *	telefonePat que armazena o telefone do patrocinador para contato no formato +XX(XX)XXXX-XXXX
 *	enderecoPat que armazena o endereço da empresa em formato livre de texto 
 devidos aos diferentes países
 */
CREATE TABLE patrocinador (
	cnpjPat	Number(14) NOT NULL, -- Chave primária
	razaoSocialPat Varchar2(150),
	telefonePat Varchar2(16), -- +XX(XX)XXXX-XXXX
	enderecoPat	Varchar(80),
	CONSTRAINT PK_PATROCINADOR PRIMARY KEY (cnpjPat) -- PK_PATROCINADOR define a restrição de chave primária
);
/
-- Criação da tabela Patrocina
/*
 *
 */
CREATE TABLE patrocinio (
	cnpjPat	Number(14) NOT NULL, -- Chave estrangeira e primária
	codEv Number(5) NOT NULL,	-- Chave primária e estrangeira (identifica identidade fraca)
	numEd Number(5) NOT NULL, -- Chave primária e estrangeira (identifica identidade fraca)
	dataPat Date,
	valorPat Number(10),
	saldoPat Number(10), -- atributo derivado do valor do patrocinio e o que foi gasto em 
							-- auxílios ou despesas
	CONSTRAINT PK_PATROCINIO PRIMARY KEY (cnpjPat, codEv, numEd), -- PK_PATROCINIO define a restrição de chave primária
	CONSTRAINT FK_PATROCINIO_PATROCINADOR FOREIGN KEY (cnpjPat) REFERENCES patrocinador(cnpjPat) ON DELETE CASCADE, -- FK_PATROCINIO_PATROCINADOR 
																								-- define uma restrição de integridade referencial
	CONSTRAINT FK_PATROCINIO_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE -- FK_PATROCINIO_EDICAO 
																								-- define uma restrição de integridade referencial
);
/
-- Criação da tabela Despesa
/*
 *
 */
CREATE TABLE despesa (
	codEv Number(5) NOT NULL,	-- Chave primária e estrangeira (identifica identidade fraca)
	numEd Number(5) NOT NULL, -- Chave primária e estrangeira (identifica identidade fraca)
	codDesp Number(10) NOT NULL, -- Chave primária para diferenciar de evento
	cnpjPat	Number(14), -- Chave Estrangeira de patrocinio
	codEvPat Number(5), -- Chave Estrangeira de patrocinio
	numEdPat Number(5), -- Chave Estrangeira de patrocinio
	dataDesp Date,
	valorDesp Number(10),
	descricaoDesp Varchar2(500),
	CONSTRAINT PK_DESPESA PRIMARY KEY (codEv, numEd, codDesp), -- PK_DESPESA 
	CONSTRAINT FK_DESPESA_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE, 
	CONSTRAINT FK_DESPESA_PATROCINIO FOREIGN KEY (cnpjPat, codEvPat, numEdPat) REFERENCES patrocinio(cnpjPat, codEvPat, numEdPat) ON DELETE SET NULL
);
/



-- Criação da sequência para codEv da tabela evento
CREATE SEQUENCE SEQ_CODEV_EVENTO
	MINVALUE 0
	START WITH 1
	INCREMENT BY 1;
/
-- Criação da sequência para numEd da tabela edicao
CREATE SEQUENCE SEQ_NUMED_EDICAO
	MINVALUE 0
	START WITH 1
	INCREMENT BY 1;
/






