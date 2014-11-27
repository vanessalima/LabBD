/*
 * Carlos Humberto dos Santos Baqueta	7987456
 * Marina Coimbra						7126841
 * Vanessa Apolinário de Lima			7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 04
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
	descricaoEd Varchar2(150), -- descreve brevemente a edição
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
 * idPe que é uma chave primária que contém um código identificador de cada pessoa na base de dados, acrescido de 1 em 1 por uma 
 sequência na ordem em que as pessoas são registradas
 * nomePe é o nome completo da pessoa
 * emailPe é o email da pessoa, que considerando que os provedores de email não possibilitam logins iguais,
 esta é uma chave única, assim a pessoa só pode se cadastrar com o mesmo email uma única vez
 * instituicaoPe é a instituição a qual este indivíduo pertence, seja trabalhando ou estudando
 * telefonePe representa o número de telefone da pessoa no formato +XXX(XXX)XXXX-XXXX
 * nacionalidadePe é a nacionalidade do indivíduo
 * enderecoPe é o endereço, podendo ser empresarial ou residencial
 * tipoOrganizador representa se esta pessoa organizou algum dos eventos em qualquer edição com 1, e 0 caso contrário
 * tipoParticipante representa se esta pessoa participou algum dos eventos em qualquer edição com 1, e 0 caso contrário
 * tipoAutor representa se esta pessoa escreveu algum artigo para algum dos eventos em qualquer edição com 1, e 0 caso contrário
 */
 CREATE TABLE pessoa(
        idPe Number(5) NOT NULL, -- Chave primária
        nomePe Varchar2(100) NOT NULL,
        emailPe Varchar2(200) NOT NULL, -- Chave secundária
        instituicaoPe Varchar2(100) NOT NULL,
        telefonePe Varchar2(18), -- +XXX(XXX)XXXX-XXXX
        nacionalidadePe Varchar2(50),
        enderecoPe Varchar2(100),
        tipoOrganizador Char(1) DEFAULT '0',
        tipoParticipante Char(1) DEFAULT '0',
        tipoAutor Char(1) DEFAULT '0',
        CONSTRAINT PK_PESSOA PRIMARY KEY (idPe),
        CONSTRAINT UN_EMAIL UNIQUE (emailPe),
        CONSTRAINT CHECK_TIPO_ORGANIZADOR CHECK (tipoOrganizador IN ('0', '1') ),
        CONSTRAINT CHECK_TIPO_PARTICIPANTE CHECK (tipoParticipante IN ('0', '1') ),
        CONSTRAINT CHECK_TIPO_AUTOR CHECK (tipoAutor IN ('0', '1') )
);
/  
-- Criação da tabela Inscrito
/*
 *	Esta tabela contém os dados das pessoas inscritas e o respectiva evento e edição tais como:
 * codEv que é o código do evento que a pessoa está inscrita, por isso é chave estrangeira e primária
 * numEd é o código da edicao à qual a pessoa está participando, sendo chave estrangeira de evento e 
 chave primária
 * idPart é uma chave primária e estrangeira referente ao código da tabela pessoa para localizar quem 
 é a pessoa inscrita
 * dataInsc é a data na qual a pessoa se inscreveu no evento
 * tipoApresentador se 1, o inscrito ira apresentar algum projeto e 0 caso contrário
 */      
CREATE TABLE inscrito ( 
        codEv Number(5) NOT NULL, -- Chave estrangeira de edicao e chave primária
        numEd Number(5) NOT NULL, -- Chave estrangeira de edicao e chave primária
        idPart Number(5) NOT NULL,
        dataInsc Date,
        tipoApresentador Char(1) DEFAULT '0',
        CONSTRAINT PK_INSCRITO PRIMARY KEY (codEv, numEd, idPart), -- Restrição de chave primária
        CONSTRAINT FK_INSCRITO_PESSOA FOREIGN KEY (idPart) REFERENCES pessoa(idPe), -- Define uma restrição de integridade referencial
        CONSTRAINT PK_INSCRITO_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE, -- Define uma restrição de integridade referencial
        CONSTRAINT CHECK_TIPO_APRESENTADOR CHECK (tipoApresentador IN ('0', '1') ) -- Limita os tipos de respostas para o campo tipoApresentador
);
/
-- Criação da tabela artigo
/*
 *	Esta tabela contém dados sobre todos os artigos aceitos nos eventos e suas edições, tais como:
 * idArt que é chave primária para o artigo, representando seu respectivo código para a comissão do evento
 * tituloArt que é o nome do artigo entregue
 * dataApresArt é a data na qual o artigo será apresentado durante o evento com formato DD/MM/YYYY
 * horaApresArt é o horário no qual o artigo será apresentado neste dia no formato DD/MM/YYY HH:MM:SS
 * codEv é o código do evento no qual o artigo será apresentado, o qual é chave estrangeira de inscrito
 * numEd é o código da edição no qual o artigo será apresentado, o qual é chave estrangeira de inscrito
 * idApr é o código da pessoa que irá apresentar o artigo, chave estrangeira de inscrito
 */
CREATE TABLE artigo (
        idArt Number(5) NOT NULL, -- Chave primária
        tituloArt Varchar2(200) NOT NULL,
        dataApresArt Date,
        horaApresArt Date,
        codEv Number(5) NOT NULL, -- Chave estrangeira de inscrito
        numEd Number(5) NOT NULL,-- Chave estrangeira de inscrito
        idApr Number(5) NOT NULL,-- Chave estrangeira de inscrito
        CONSTRAINT PK_ARTIGO PRIMARY KEY (idArt), -- Restrição de chave primária
        CONSTRAINT PK_ARTIGO_INSCRITO FOREIGN KEY (codEv, numEd, idApr) REFERENCES inscrito(codEv, numEd, idPart) ON DELETE SET NULL -- Restrição de integridade referencial
);
/
-- Criação da tabela escreve
/*
 *	Esta tabela contém dados da relação de autor e artigo, tais como:
 * idAut é o código da pessoa que escreveu o artigo, sendo chave primária e estrangeira de pessoa
 * idArt é o código do artigo o qual a pessoa escreveu, sendo chave primária e estrangeira de artigo
 */
CREATE TABLE escreve(
      idAut Number(5) NOT NULL, -- Chave primária e estrangeira
      idArt Number(5) NOT NULL, -- Chave primária e estrangeira
      CONSTRAINT PK_ESCREVE PRIMARY KEY (idAut, idArt), -- restrição de chave primária
      CONSTRAINT PK_ESCREVE_ARTIGO FOREIGN KEY (idArt) REFERENCES artigo(idArt) ON DELETE CASCADE, -- Restrição de integridade referencial
      CONSTRAINT PK_ESCREVE_PESSOA FOREIGN KEY (idAut) REFERENCES pessoa(idPe) ON DELETE CASCADE -- Restrição de integridade referencial
);
/
-- Criação da tabela Organiza
/*
 *	Esta tabela contém os dados relacionais entre as pessoas e a composição da comissão organizadores de cada edição dos eventos,
 tais como:
 * idOrg referencia o código da tabela pessoa que está na organização e é chave primária nesta tabela de relacionamento
 * codEv referencia o código do evento respectivo a edição e é chave primária nesta tabela de relacionamento
 * numEd referencia o código da edição do evento definido anteriormente e é chave primária nesta tabela de relacionamento
 * cargoOrg define o cargo que esta pessoa ocupa na organização desta edição do evento, visto que seu cargo pode mudar
 para diferentes edições
 */
CREATE TABLE organiza (
	idOrg Number(5), -- chave primária e estarngeira da tabela pessoa
	codEv Number(5), -- chave primária e estrangeira da tabela edicao
	numEd Number(5), -- chave primária e estrangeira da tabela edicao
	cargoOrg Varchar2(100),
	CONSTRAINT PK_ORGANIZA PRIMARY KEY (idOrg, codEv, numEd),
	CONSTRAINT FK_ORGANIZA_PESSOA FOREIGN KEY (idOrg) REFERENCES pessoa(idPe) ON DELETE CASCADE,
	CONSTRAINT FK_ORGANIZA_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE
	-- Seria possível colocar um check para cargos, mas isso iria restringir a criação de novos cargos,
		-- assim preferimos não inserir essa restrição
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
-- Criação da tabela Patrocio
/*Esta tabela contém informações acerca dos patrocinadore das edições dos eventos, tais como:
 *cnpjPat  CNPJ do patrocinador associado a uma edicao de um evento
 *codEv codigo do evento
 *numEd numero da edicao
 *valorPat valor do patrocinio
 *saldoPat saldo do patrocinio, apos debito de gastos
 *dataPat data na qual o patrocinio foi realizado
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
 *	Esta tabela contém informações de todos os gastos que foram realizados em cada edição dos eventos, tais como:
 * codEv é o código do evento no qual a despesa foi feita, o qual é chave estrangeira de edicao
 * numEd é o código da edição no qual a despesa foi feita, o qual é chave estrangeira de edicao
 * cnpjPat é o código do patrocinador do qual os gastos foram descontados
 * codEvPat é o código do evento que este patrocinio que será gasto foi dado, chave estrangeira de patrocinio
 * numEdPat é o código da edição em que o patrocinio que será gasto foi dado, chave estrangeira de patrocinio
 * dataDesp é a data que a despesa foi feita no formato DD/MM/YYYY
 * valorDesp é o valor da despesa em dolares na forma de ponto flutuante com duas casas decimais
 * descricaoDesp é uma breve definição sobre a despesa, explicando por qual razão foi feita
 */
CREATE TABLE despesa (
	codEv Number(5) NOT NULL,	-- Chave primária e estrangeira (identifica identidade fraca)
	numEd Number(5) NOT NULL, -- Chave primária e estrangeira (identifica identidade fraca)
	codDesp Number(10) NOT NULL, -- Chave primária para diferenciar de evento
	cnpjPat	Number(14), -- Chave Estrangeira de patrocinio
	codEvPat Number(5), -- Chave Estrangeira de patrocinio
	numEdPat Number(5), -- Chave Estrangeira de patrocinio
	dataDesp Date,
	valorDesp Number(10,2),
	descricaoDesp Varchar2(500),
	CONSTRAINT PK_DESPESA PRIMARY KEY (codEv, numEd, codDesp), -- PK_DESPESA restrição de chave primária
	CONSTRAINT FK_DESPESA_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE, -- restrição de integridade referencial
	CONSTRAINT FK_DESPESA_PATROCINIO FOREIGN KEY (cnpjPat, codEvPat, numEdPat) REFERENCES patrocinio(cnpjPat, codEv, numEd) ON DELETE SET NULL -- restrição de integridade referencial
);
/
-- Criação da tabela Auxilio
/*
 * Esta tabela contem informacoes acerca dos auxílios financeiros que foram recebidos pelos apresentadores, participantes que se inscrevem 
 * para apresentar trabalhos no evento, relativo às despesas decorrentes de sua participação.
 * codEvApr codigo do evento no qual o participante apresentou o trabalho
 * numEdApr codigo do edição no qual o participante apresentou o trabalho
 * idApr codigo do participante que apresentou o trabalho
 * tipoAux  pode ser relativo a hospedagem, deslocamento ou alimentação
 * valorAux quantia dispendida no auxílio
 * dataAux data na qual o auxílio foi realizado/liberado
 * cnpjPat	cnpj do patrocinador cujo patrocínio foi utilizado para realizar o auxílio
 * codEvPat codigo do evento patrocinado pelo patrocinador
 * numEdPat codigo da edição patrocinada pelo patrocinador
 */
CREATE TABLE auxilio (
	codEvApr Number(5) NOT NULL, -- Chave primária e estrangeira de inscrito (identidade fraca)
	numEdApr Number(5) NOT NULL, -- Chave primária e estrangeira de inscrito (identidade fraca)
	idApr Number(5) NOT NULL, -- Chave primária e estrangeira de inscrito (identidade fraca)
	tipoAux Varchar2(100) NOT NULL, -- Chave primária para diferenciar do inscrito
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
