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
/
/
-- Remoção das Tabelas
DROP TABLE evento CASCADE CONSTRAINT;
DROP TABLE edicao CASCADE CONSTRAINT;
DROP TABLE pessoa CASCADE CONSTRAINT;
DROP TABLE inscrito CASCADE CONSTRAINT;
DROP TABLE artigo CASCADE CONSTRAINT;
DROP TABLE escreve CASCADE CONSTRAINT;
DROP TABLE organiza CASCADE CONSTRAINT;
DROP TABLE patrocinador CASCADE CONSTRAINT;
DROP TABLE patrocinio CASCADE CONSTRAINT;
DROP TABLE despesa CASCADE CONSTRAINT;
DROP TABLE auxilio CASCADE CONSTRAINT;
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
	localEd Varchar2(150), -- Cidade, País
	taxaEd Number(10,2), -- Valor inteiro da taxa de inscrição
	saldoFinanceiroEd Number(30), -- atributo derivado que mostra o saldo da edição
	qtdArtigosApresentadosEd Number(10), -- atributo derivado que soma a quantidade de artigos apresentados na edição
	CONSTRAINT PK_EDICAO PRIMARY KEY (codEv, numEd), -- PK_EDICAO define a restrição de chave primária
	CONSTRAINT FK_EDICAO_EVENTO FOREIGN KEY (codEv) REFERENCES evento(codEv) ON DELETE CASCADE -- FK_EDICAO_EVENTO define uma restrição
																									-- de integridade referencial
);
/
-- Criação da tabela Pessoa
/*
 * Esta tabela contém dados relevantes de todas as pessoas relacionadas ao evento
 * tais como:
 * idPe
 * nomePe
 * emailPe
 * instituicaoPe
 * telefonePe
 * nacionalidadePe
 * enderecoPe
 * tipoOrganizador
 * tipoParticipante
 * tipoAutor
 */
 CREATE TABLE pessoa(
        idPe Number(5) NOT NULL,
        nomePe Varchar2(100) NOT NULL,
        emailPe Varchar2(200) NOT NULL,
        instituicaoPe Varchar2(100) NOT NULL,
        telefonePe Varchar2(18), -- +XXX(XXX)XXXX-XXXX
        nacionalidadePe Varchar2(50),
        enderecoPe Varchar2(100),
        tipoOrganizador Char(1),
        tipoParticipante Char(1),
        tipoAutor Char(1),
        CONSTRAINT PK_PESSOA PRIMARY KEY (idPe),
        CONSTRAINT UN_EMAIL UNIQUE (emailPe),
        CONSTRAINT CHECK_TIPO_ORGANIZADOR CHECK (tipoOrganizador IN ('0', '1') ),
        CONSTRAINT CHECK_TIPO_PARTICIPANTE CHECK (tipoParticipante IN ('0', '1') ),
        CONSTRAINT CHECK_TIPO_AUTOR CHECK (tipoAutor IN ('0', '1') )
);
/  
-- Criação da tabela Inscrito
/*
 *
 */      
CREATE TABLE inscrito ( 
        codEv Number(5) NOT NULL,	
        numEd Number(5) NOT NULL,
        idPart Number(5) NOT NULL,
        dataInsc Date,
        tipoApresentador Char(1),
        CONSTRAINT PK_INSCRITO PRIMARY KEY (codEv, numEd, idPart),
        CONSTRAINT FK_INSCRITO_PESSOA FOREIGN KEY (idPart) REFERENCES pessoa(idPe),
        CONSTRAINT PK_INSCRITO_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE
);
/
-- Criação da tabela artigo
/*
 *
 */
CREATE TABLE artigo (
        idArt Number(5) NOT NULL,
        tituloArt Varchar2(200) NOT NULL,
        dataApresArt Date,
        horaApresArt Date,
        codEv Number(5) NOT NULL,
        numEd Number(5) NOT NULL,
        idApr Number(5) NOT NULL,
        CONSTRAINT PK_ARTIGO PRIMARY KEY (idArt),
        CONSTRAINT PK_ARTIGO_INSCRITO FOREIGN KEY (codEv, numEd, idApr) REFERENCES inscrito(codEv, numEd, idPart) ON DELETE CASCADE       
);
/
-- Criação da tabela escreve
/*
 *
 */
CREATE TABLE escreve(
      idAutor Number(5) NOT NULL,
      idArt Number(5) NOT NULL,
      CONSTRAINT PK_ESCREVE PRIMARY KEY (idAutor, idArt),
      CONSTRAINT PK_ESCREVE_ARTIGO FOREIGN KEY (idArt) REFERENCES artigo(idArt) ON DELETE CASCADE       
);
/
-- Criação da tabela Organiza
/*
 *
 */
CREATE TABLE organiza (
	idOrg Number(5), -- chave primária e estarngeira da tabela pessoa
	codEv Number(5), -- chave primária e estrangeira da tabela edicao
	numEd Number(5), -- chave primária e estrangeira da tabela edicao
	cargoOrg Varchar2(100),
	CONSTRAINT PK_ORGANIZA PRIMARY KEY (idOrg, codEv, numEd),
	CONSTRAINT FK_ORGANIZA_PESSOA FOREIGN KEY (idOrg) REFERENCES pessoa(idPe) ON DELETE CASCADE,
	CONSTRAINT FK_ORGANIZA_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE
	-- CONSTRAINT PARA O CARGO ??? ***
);
/
-- Criação da tabela de Patrocinador
/*
 * Esta tabela contém dados todas as empresas que já patrocinaram alguma edição
 de algum evento, armazendo os dados:
 *	cnpjPat que representa o cnpj da empresa patrocinadora com 14 números, que podem 
 ser passados para o formato de XX.XXX.XXX/XXXX-XX
 *	razaoSocialPat que armazena o nome original e completo da empresa
 *	telefonePat que armazena o telefone do patrocinador para contato no formato +XXX(XXX)XXXX-XXXX
 *	enderecoPat que armazena o endereço da empresa em formato livre de texto 
 devidos aos diferentes países
 */
CREATE TABLE patrocinador (
	cnpjPat	Number(14) NOT NULL, -- Chave primária
	razaoSocialPat Varchar2(150),
	telefonePat Varchar2(18), -- +XXX(XXX)XXXX-XXXX
	enderecoPat	Varchar(150),
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
	valorPat Number(10,2),
	saldoPat Number(10,2), -- atributo derivado do valor do patrocinio e o que foi gasto em 
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
	CONSTRAINT FK_DESPESA_PATROCINIO FOREIGN KEY (cnpjPat, codEvPat, numEdPat) REFERENCES patrocinio(cnpjPat, codEv, numEd) ON DELETE SET NULL
);
/
-- Criação da tabela Auxilio
/*
 *
 */
CREATE TABLE auxilio (
	codEvApr Number(5) NOT NULL, -- Chave primária e estrangeira de inscrito (identidade fraca)
	numEdApr Number(5) NOT NULL, -- Chave primária e estrangeira de inscrito (identidade fraca)
	idApr Number(5) NOT NULL, -- Chave primária e estrangeira de inscrito (identidade fraca)
	tipoAux Char(1) NOT NULL, -- Chave primária para diferenciar do inscrito
	valorAux Number(5,2), 
	dataAux Date, -- Máscara da data DD/MM/YYYY
	cnpjPat	Number(14), -- Chave Estrangeira de patrocinio
	codEvPat Number(5), -- Chave Estrangeira de patrocinio
	numEdPat Number(5), -- Chave Estrangeira de patrocinio
	CONSTRAINT PK_AUXILIO PRIMARY KEY (codEvApr, numEdApr, idApr, tipoAux),
	CONSTRAINT FK_AUXILIO_PATROCINIO FOREIGN KEY (cnpjPat, codEvPat, numEdPat) REFERENCES patrocinio(cnpjPat, codEv, numEd) ON DELETE SET NULL,
	CONSTRAINT FK_AUXILIO_INSCRITO FOREIGN KEY (codEvApr, numEdApr, idApr) REFERENCES inscrito(codEv, numEd, idPart) ON DELETE CASCADE
	-- CONSTRAINT CHECK_TIPO_AUXILIO CHECK(tipoAux in () ) ??? ***
);
/
/
/