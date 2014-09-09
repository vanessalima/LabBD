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
ALTER SESSION SET NLS_LANGUAGE= 'PORTUGUESE' NLS_TERRITORY= 'BRAZIL'
/
-- Evita problemas com a criação incorreta de sequências 
ALTER SESSION SET deferred_segment_creation = FALSE;
/
-- Remoção das Tabelas
DROP TABLE emissora CASCADE CONSTRAINT;
DROP TABLE nome CASCADE CONSTRAINT;
/
-- Remoção das Sequências
DROP SEQUENCE SEQ_IDDE_DEPTO;
/
-- Criação da tabela Evento
/*
 * Esta tabela contém os dados de um evento no qual:
 * 	codEv é o código do evento e a chave primária desta tabela
 *	nomeEv é o nome do evento e a também compõe a chave primária desta tabela
 *	descricaoEv contém um texto descrevendo brevemente o evento, tais como a 
 área de interesse
 *	websiteEv é o site do evento no formato *** ???
 *	totalArtigosApresentadosEv é um atributo derivado que armazena a 
 quantidade total de artigos apresentados no evento em todas as suas edição
 */
CREATE TABLE EVENTO (
	codEv Number(10) NOT NULL,	-- Chave primária
	nomeEv Varchar2(100) NOT NULL, -- Chave primária
	descricaoEv Varchar2(400),
	websiteEv Varchar2(200),
	totalArtigosApresentadosEv Number(100), -- Atributo derivado ***
	-- *** outros constraints ??? 
	CONSTRAINT PK_EVENTO PRIMARY KEY (codEv, nomeEv) -- PK_EVENTO define a restrição de chave primária
	-- 
);
/
-- Criação da tabela Edição
/*
 * Esta tabela comtém os dados de uma edição de um dado evento no qual:
 *	codEv é uma chave estrangeira da tabela EVENTO e que é utilizada 
 também como chave primária, devido a relação de entidade-fraca
 *	nomeEv é uma chave estrangeira da tabela EVENTO e que é utilizada 
 também como chave primária, devido a relação de entidade-fraca
 *	codEd é uma chave primária dessa tabela que contém o código da edição, 
 diferenciando cada edição do evento das demais
 *	dataInicioEd representa a data inicial da edição
 *	dataFimEd representa a data de término da edição
 *	localEd representa o local onde o evento irá ocorrer (cidade, estado, endereço???? ***)
 *	taxaEd representa o custo que os participantes devem pagar para
 participar da edição
 *	saldoFinanceiroEd é um atributo derivado que armazena a situação 
 financeira atual do evento, contando com o recebimento de patrocínios, 
 taxas e com os gastos da edição
 *	qtdArtigosApresentadosEd é um atributo derivado que armazena a quantidade
 total de artigos apresentados na edição
 */
CREATE TABLE EDICAO (
	codEv Number(10) NOT NULL,	-- Chave primária e estrangeira (identifica identidade fraca)
	nomeEv Varchar2(15) NOT NULL, -- Chave primária e estrangeira (identifica identidade fraca)
	codEd Number(10) NOT NULL, -- Chave primária para diferenciar de evento
	dataInicioEd Date,
	dataFimEd Date,
	localEd Varchar2(20), -- *** seria essa a melhor variável??? 
	taxaEd Number(20),
	saldoFinanceiroEd Number(50), -- atributo derivado ***
	qtdArtigosApresentadosEd Number(10) -- atributo derivado ***
	-- contraints *** ???
	CONSTRAINT PK_EDICAO PRIMARY KEY (codEv, nomeEv, codEd) -- PK_EDICAO define a restrição de chave primária
);
/
-- Criação da tabela de Patrocinador
/*
 * Esta tabela contém dados todas as empresas que já patrocinaram alguma edição
 de algum evento, armazendo os dados:
 *	cnpjPat que representa o cnpj da empresa patrocinadora com 14 números, 
 com o formato de XX.XXX.XXX/XXXX-XX
 *	razaoSocialPat que armazena o nome original e completo da empresa
 *	telefonePat que armazena o telefone do patrocinador para contato no formato +XX(XX)XXXX-XXXX *** ???
 *	enderecoPat que armazena o endereço da empresa em formato livre de texto 
 devidos aos diferentes países
 */
CREATE TABLE PATROCINADOR (
	cnpjPat	Number(14), -- Chave primária
	razaoSocialPat Varchar2(150), -- limite ??? ***
	telefonePat Varchar2(16), -- +XX(XX)XXXX-XXXX *** ???
	enderecoPat	Varchar(80),
	-- constrains *** ???
	CONSTRAINT PK_PATROCINADOR PRIMARY KEY (cnpjPat) -- PK_PATROCINADOR define a restrição de chave primária

);
/
-- Criação da tabela 







