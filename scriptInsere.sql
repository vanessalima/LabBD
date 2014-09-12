/*
 * Carlos Humberto dos Santos Baqueta	7987456
 * Vanessa Apolinário de Lima			7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 01
 *
 * Script de Inserção < scriptInsere.sql >
 * 
 */
/
/
/*
- evento: pelo menos 1 OK
- edição por evento: pelo menos 3 OK
- artigos por edição: pelo menos 15
- inscritos por edição: pelo menos 30
- patrocinadores: pelo menos 4 OK
- patrocínios: pelo menos 4 por edição - 5 por edição OK
- despesas por edição: pelo menos 8
- auxílios por edição: pelo menos 10
- organizadores por edição: pelo menos 4
- autores por artigo: variável (apenas 10% dos artigos podem possuir 1
autor, ou seja, a maioria dos artigos devem possuir 2 ou mais autores)
*/
/
/
/
-- Deleta as sequências para iniciar a inserção de dados
DROP SEQUENCE SEQ_CODEV_EVENTO;
--DROP SEQUENCE SEQ_NUMED_EDICAO;
DROP SEQUENCE SEQ_IDPE_PESSOA;
DROP SEQUENCE SEQ_IDART_ARTIGO;
DROP SEQUENCE SEQ_CODDESP_DESPESA;
/
/
/
-- Deleta todos os dados existentes na tabela
DELETE FROM evento;
DELETE FROM edicao;
DELETE FROM pessoa;
DELETE FROM inscrito;
DELETE FROM artigo;
DELETE FROM escreve;
DELETE FROM organiza;
DELETE FROM patrocinador;
DELETE FROM patrocinio;
DELETE FROM despesa;
DELETE FROM auxilio;
/
/
/
-- Criação da sequência para codEv da tabela evento
CREATE SEQUENCE SEQ_CODEV_EVENTO
	MINVALUE 0
	START WITH 1
	INCREMENT BY 1;
/
-- Criação da sequência para numEd da tabela edicao
/*
 *	Considerando que há apenas uma sequência para todas as edições
de todos os eventos.
 *	Modificamos para o número da edição que o evento realmente está
CREATE SEQUENCE SEQ_NUMED_EDICAO
	MINVALUE 0
	START WITH 1
	INCREMENT BY 1;
*/
/
-- Criação da sequência para idPe da tabela pessoa
CREATE SEQUENCE SEQ_IDPE_PESSOA
	MINVALUE 0
	START WITH 1
	INCREMENT BY 1;
/
-- Criação da sequência para idArt da tabela artigo
CREATE SEQUENCE SEQ_IDART_ARTIGO
	MINVALUE 0
	START WITH 1
	INCREMENT BY 1;
/
-- Criação da sequência para codDesp da tabela despesa
CREATE SEQUENCE SEQ_CODDESP_DESPESA
	MINVALUE 0
	START WITH 1
	INCREMENT BY 1;
/
/
/
-- Inserção do primeiro Evento
INSERT INTO evento(codEv, nomeEv, descricaoEv, websiteEv)
	VALUES(
	 	SEQ_CODEV_EVENTO.NEXTVAL, -- codigo do evento
	 	'ACM International Conference on Information and Knowlege Managment', -- nome do evento
	 	'CIKM is a top-tier conference sponsored by ACM in the areas of Information 
	 	Retrieval, Knowledge Management and Databases, bringing together leading 
	 	researchers and practitioners from the three communities to identify 
	 	challenging problems facing the development of future knowledge and information 
	 	systems, and to shape future research directions through the publication of high 
	 	quality, applied and theoretical research findings.', -- descrição do evento
	 	'http://cikm2014.fudan.edu.cn'-- website do evento
);
/
-- Inserção do segundo Evento
INSERT INTO evento(codEv, nomeEv, descricaoEv, websiteEv)
	VALUES(
	 	SEQ_CODEV_EVENTO.NEXTVAL, -- codigo do evento
	 	'International Conference on Very Large Data Bases', -- nome do evento
	 	'VLDB is a premier annual international forum for data management and database 
	 	researchers, vendors, practitioners, application developers, and users. The 
	 	conference will feature research talks, tutorials, demonstrations, and workshops. 
	 	It will cover current issues in data management, database and information systems 
	 	research. Data management and databases remain among the main technological 
	 	cornerstones of emerging applications of the twenty-first century.', -- descrição do evento
	 	'http://www.vldb.org/'-- website do evento
);
/
-- Inserção do terceiro Evento
INSERT INTO evento(codEv, nomeEv, descricaoEv, websiteEv)
	VALUES(
	 	SEQ_CODEV_EVENTO.NEXTVAL, -- codigo do evento
	 	'ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems', -- nome do evento
	 	'The ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems 
	 	2014 (ACM SIGSPATIAL 2014) is the twenty-second event in a series of symposia and workshops 
	 	that began in 1993 with the aim of bringing together researchers, developers, users, and 
	 	practitioners in relation to novel systems based on geo-spatial data and knowledge, and fostering 
	 	interdisciplinary discussions and research in all aspects of geographic information systems. The 
	 	conference provides a forum for original research contributions covering all conceptual, design, 
	 	and implementation aspects of geospatial data ranging from applications, user interfaces, and visualization 
	 	to data storage and query processing and indexing. The conference is the premier annual event of the ACM 
	 	Special Interest Group on Spatial Information (ACM SIGSPATIAL). Researchers, students, and practitioners 
	 	are invited to submit their contributions to ACM SIGSPATIAL 2014.', -- descrição do evento
	 	'http://sigspatial2014.sigspatial.org'-- website do evento
);
/
/
/
/
-- Inserção da edição de 2013 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		22,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('27/10/2013', 'DD/MM/YYYY'), -- data de início
		TO_DATE('01/11/2013', 'DD/MM/YYYY'), -- data de fim
		'San Francisco, United States',-- local onde a edição ocorreu na forma de Cidade, País
		1365.00 -- valor da inscrição (Considerando a mais cara)
);
/
-- Inserção da edição de 2012 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		21,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('29/10/2012', 'DD/MM/YYYY'), -- data de início
		TO_DATE('02/11/2012', 'DD/MM/YYYY'), -- data de fim
		'Sheraton, Maui Hawaii',-- local onde a edição ocorreu na forma de Cidade, País
		1355.00-- valor da inscrição
);
/
-- Inserção da edição de 2011 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		20,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('23/10/2011', 'DD/MM/YYYY'), -- data de início
		TO_DATE('28/10/2011', 'DD/MM/YYYY'), -- data de fim
		'Glasgow, United Kingdom',-- local onde a edição ocorreu na forma de Cidade, País
		1040.00-- valor da inscrição
);
/
-- Inserção da edição de 2010 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		19,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('26/10/2010', 'DD/MM/YYYY'), -- data de início
		TO_DATE('30/10/2010', 'DD/MM/YYYY'), -- data de fim
		'Toronto, Canada',-- local onde a edição ocorreu na forma de Cidade, País
		1580.00-- valor da inscrição
);
/
/
/
-- Inserção da edição de 2014 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		2, -- código do evento
		40,--SEQ_NUMED_EDICAO.NEXTVAL,
    	TO_DATE('01/09/2014', 'DD/MM/YYYY'),
    	TO_DATE('05/09/2014', 'DD/MM/YYYY'),
    	'Hangzhou, China',
    	1100.00
);
-- Inserção da edição de 2013 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		2, -- código do evento
		39,--SEQ_NUMED_EDICAO.NEXTVAL,
    	TO_DATE('26/08/2013', 'DD/MM/YYYY'),
    	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
    	'Trento, Italy',
    	1100.00
);
-- Inserção da edição de 2012 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		2, -- código do evento
		38,--SEQ_NUMED_EDICAO.NEXTVAL,
    	TO_DATE('27/08/2012', 'DD/MM/YYYY'),
    	TO_DATE('31/08/2012', 'DD/MM/YYYY'),
    	'Istanbul, Turkey',
    	1100.00
);
-- Inserção da edição de 2011 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		2, -- código do evento
		37,--SEQ_NUMED_EDICAO.NEXTVAL,
    	TO_DATE('29/08/2011', 'DD/MM/YYYY'),
    	TO_DATE('03/09/2011', 'DD/MM/YYYY'),
    	'Seattle, Washington',
    	1220.00
);
/
/
/
/
-- Inserção da edição de 2013 do segundo evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
		21,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('05/11/2013', 'DD/MM/YYYY'), -- data de início
		TO_DATE('08/11/2013', 'DD/MM/YYYY'), -- data de fim
		'Orlando, United States',-- local onde a edição ocorreu na forma de Cidade, País
		650.00-- valor da inscrição
);
/
-- Inserção da edição de 2012 do segundo evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
		20,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('06/11/2012', 'DD/MM/YYYY'), -- data de início
		TO_DATE('09/11/2012', 'DD/MM/YYYY'), -- data de fim
		'Redondo Beach, United States',-- local onde a edição ocorreu na forma de Cidade, País
		650.00-- valor da inscrição
);
/
-- Inserção da edição de 2011 do segundo evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
		19,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('01/11/2011', 'DD/MM/YYYY'), -- data de início
		TO_DATE('04/11/2011', 'DD/MM/YYYY'), -- data de fim
		'Chicago, United States',-- local onde a edição ocorreu na forma de Cidade, País
		650.00-- valor da inscrição
);
/
-- Inserção da edição de 2010 do segundo evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
		18,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('02/11/2010', 'DD/MM/YYYY'), -- data de início
		TO_DATE('05/11/2010', 'DD/MM/YYYY'), -- data de fim
		'San Jose, United States',-- local onde a edição ocorreu na forma de Cidade, País
		650.00-- valor da inscrição
);
/
/
/
/
/
-- Insersão dos Patrocinadores
INSERT INTO patrocinador VALUES(
	06990590000204,--CNPJ
	'GOOGLE BRASIL INTERNET LTDA.', -- razão social
	'+55(11)3797-1263', -- telefone +XXX(XXX)XXXX-XXXX
	'Av. Brigadeiro Faria Lima, 3900, 5 andar. São Paulo, SP - CEP 04538-132'
);
/
INSERT INTO patrocinador VALUES(
	60316817000103,--CNPJ
	'Microsoft Informatica Ltda.', -- razão social
	'+55(11)5504-2155', -- telefone +XXX(XXX)XXXX-XXXX
	'Av. Nações Unidas, 12.901 - São Paulo, SP - Brasil'
);
/
INSERT INTO patrocinador VALUES(
	59456277000176,--CNPJ
	'Oracle do Brasil Sistemas Ltda.', -- razão social
	'+55(11)5189-1000', -- telefone +XXX(XXX)XXXX-XXXX
	'Rua Dr. José Aureo Bustamante - São Paulo, SP - Brasil'
);
/
INSERT INTO patrocinador VALUES(
	33372251000156,--CNPJ
	'IBM Brasil Ltda.', -- razão social
	'+55(080)0707-1426', -- telefone +XXX(XXX)XXXX-XXXX
	'Av. Pasteur, 138/146 Botafogo - Rio de Janeiro - RJ CEP: 22296-903'
);
/
INSERT INTO patrocinador VALUES(
	10322194000103,--CNPJ
	'Facebook Serviços Online do Brasil Ltda.', -- razão social
	'+1(650)543-4800', -- telefone +XXX(XXX)XXXX-XXXX
	'Avenida da Liberdade, 130 - São Paulo, SP - Brasil'
);
/
INSERT INTO patrocinador VALUES(
	57286247000133,--CNPJ
	'Intel Semicondutores do Brasil Ltda.', -- razão social
	'+55(11)3365-5500', -- telefone +XXX(XXX)XXXX-XXXX
	'Av. Chucri Zaidan, 940 - 10º andarTorre II, CEP: 04583-110 - São Paulo, SP - Brasil'
);
/
INSERT INTO patrocinador VALUES(
	61797924000155,--CNPJ
	'Hewlett-Packard Brasil Ltda.', -- razão social
	'+55(11)4197-8000', -- telefone +XXX(XXX)XXXX-XXXX
	'Alameda Rio Negro - Barueri, SP - Brasil'
);
/
INSERT INTO patrocinador VALUES(
	19758880000198,--CNPJ
	'Vmware Software e Servicos Brasil LTDA.', -- razão social
	'+55(11)5509-7200', -- telefone +XXX(XXX)XXXX-XXXX
	'Edificio Brasil 21-SHS Quadra 6, Conjunto A, Bloco E-Salas 902/905 - Brasilia, Brazil 70322'
);
/
/
/
-- Patrocínios
/
--EDICAO 37 VLDB
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		06990590000204,
		1, 
		37,
		10000.00,
		NULL,
		TO_DATE('29/06/2011', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		60316817000103,
		1, 
		37,
		20000.00,
		NULL,
		TO_DATE('27/06/2011', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		59456277000176,
		1, 
		37,
		9000.00,
		NULL,
		TO_DATE('21/06/2011', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		10322194000103,
		1, 
		37,
		5000.00,
		NULL,
		TO_DATE('19/06/2011', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		61797924000155,
		1, 
		37,
		2000.00,
		NULL,
		TO_DATE('19/06/2011', 'DD/MM/YYYY')
);
/
--EDICAO 38 VLDB
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		06990590000204,
		1, 
		38,
		5000.00,
		NULL,
		TO_DATE('29/05/2012', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		60316817000103,
		1, 
		38,
		7000.00,
		NULL,
		TO_DATE('27/05/2012', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		59456277000176,
		1, 
		38,
		2000.00,
		NULL,
		TO_DATE('21/05/2012', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		57286247000133,
		1, 
		38,
		3000.00,
		NULL,
		TO_DATE('19/06/2012', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		19758880000198,
		1, 
		38,
		9000.00,
		NULL,
		TO_DATE('19/06/2012', 'DD/MM/YYYY')
);
/
--EDICAO 39 VLDB
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		06990590000204,
		1, 
		39,
		5500.00,
		NULL,
		TO_DATE('29/04/2013', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		33372251000156,
		1, 
		39,
		7500.00,
		NULL,
		TO_DATE('27/05/2013', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		61797924000155,
		1, 
		39,
		2500.00,
		NULL,
		TO_DATE('21/05/2013', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		57286247000133,
		1, 
		39,
		3500.00,
		NULL,
		TO_DATE('19/06/2013', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		19758880000198,
		1, 
		39,
		9500.00,
		NULL,
		TO_DATE('19/06/2013', 'DD/MM/YYYY')
);
/
--EDICAO 40 VLDB
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		06990590000204,
		1, 
		40,
		5000.00,
		NULL,
		TO_DATE('29/04/2014', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		33372251000156,
		1, 
		40,
		7000.00,
		NULL,
		TO_DATE('27/05/2014', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		61797924000155,
		1, 
		40,
		2000.00,
		NULL,
		TO_DATE('21/05/2014', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		57286247000133,
		1, 
		40,
		3000.00,
		NULL,
		TO_DATE('01/06/2014', 'DD/MM/YYYY')
);
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		19758880000198,
		1, 
		40,
		9000.00,
		NULL,
		TO_DATE('19/06/2014', 'DD/MM/YYYY')
);
/
--EDICAO 18 ACM SIGSPATIAL
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		06990590000204,
		2, 
		18,
		10000.00,
		NULL,
		TO_DATE('29/06/2010', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		60316817000103,
		2, 
		18,
		20000.00,
		NULL,
		TO_DATE('27/06/2010', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		59456277000176,
		2, 
		18,
		9000.00,
		NULL,
		TO_DATE('21/06/2010', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		10322194000103,
		2, 
		18,
		5000.00,
		NULL,
		TO_DATE('19/06/2010', 'DD/MM/YYYY')
);
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		57286247000133,
		2, 
		18,
		2000.00,
		NULL,
		TO_DATE('19/06/2010', 'DD/MM/YYYY')
);
/
--EDICAO 19 ACM SIGSPATIAL
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		06990590000204,
		2, 
		19,
		13000.00,
		NULL,
		TO_DATE('29/06/2011', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		19758880000198,
		2, 
		19,
		23000.00,
		NULL,
		TO_DATE('27/06/2011', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		33372251000156,
		2, 
		19,
		9300.00,
		NULL,
		TO_DATE('21/06/2011', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		10322194000103,
		2, 
		19,
		5300.00,
		NULL,
		TO_DATE('19/06/2011', 'DD/MM/YYYY')
);
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		61797924000155,
		2, 
		19,
		2300.00,
		NULL,
		TO_DATE('19/06/2011', 'DD/MM/YYYY')
);
/
--EDICAO 20 ACM SIGSPATIAL
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		60316817000103,
		2, 
		20,
		13000.00,
		NULL,
		TO_DATE('29/06/2012', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		19758880000198,
		2, 
		20,
		23000.00,
		NULL,
		TO_DATE('27/06/2012', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		33372251000156,
		2, 
		20,
		9300.00,
		NULL,
		TO_DATE('21/06/2012', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		10322194000103,
		2, 
		20,
		5300.00,
		NULL,
		TO_DATE('20/06/2012', 'DD/MM/YYYY')
);
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		57286247000133,
		2, 
		20,
		2300.00,
		NULL,
		TO_DATE('19/06/2012', 'DD/MM/YYYY')
);
/
--EDICAO 21 ACM SIGSPATIAL
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		06990590000204,
		2, 
		21,
		73000.00,
		NULL,
		TO_DATE('29/06/2013', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		59456277000176,
		2, 
		21,
		83000.00,
		NULL,
		TO_DATE('27/06/2013', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		33372251000156,
		2, 
		21,
		9000.00,
		NULL,
		TO_DATE('21/06/2013', 'DD/MM/YYYY')
);
/
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		10322194000103,
		2, 
		21,
		5000.00,
		NULL,
		TO_DATE('20/06/2013', 'DD/MM/YYYY')
);
INSERT INTO patrocinio(cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
	values(
		57286247000133,
		2, 
		21,
		2200.00,
		NULL,
		TO_DATE('19/06/2013', 'DD/MM/YYYY')
);
/
/
/
/
-- Inserção de Pessoas
/
/
/
/
-- Evento 2 edição 19
-- Contém:
	-- 7 organizadores
	-- 33 inscritos
	-- 43 autores
	-- TOTAL: 47 pessoas
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'John Krumm', -- nome da pessoa
        'jckrumm@microsoft.com', --email
        'Microsoft Corporation', -- instituição
        '+1(425)703-8283', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'One Microsof Way Redmond, WA 98052', -- endereço
        '1', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Markus Schneider', -- nome da pessoa
        'mschneid@cise.ufl.edu', --email
        'University of Florida', -- instituição
        '+1(352)505-1584', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'E450 CSE Building, PO Box 116120, Gainesville, FL 32611-6120, USA', -- endereço
        '1', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Andrew Danner', -- nome da pessoa
        'adanner@cs.swarthmore.edu', --email
        'Swarthmore College', -- instituição
        '+1(610)328-8665', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        '500 College Ave, Swarthmore, PA 19081, United States', -- endereço
        '1', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Mohamed Ali', -- nome da pessoa
        'mohamed.ali@microsoft.com', --email
        'Microsoft Corporation', -- instituição
        '+1(425)703-8073', -- +XXX(XXX)XXXX-XXXX
        'Arabic', -- nacionalidade
        'One Microsof Way Redmond, WA 98052', -- endereço
        '1', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '0' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Simonas Altenis', -- nome da pessoa
        'simas@cs.aau.dk', --email
        'Aalborg University', -- instituição
        '+45(99)40-9940', -- +XXX(XXX)XXXX-XXXX
        'Danish', -- nacionalidade
        'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark', -- endereço
        '1', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '0' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Wei Ding', -- nome da pessoa
        'ding@cs.umb.edu', --email
        'University of Massachusetts Boston', -- instituição
        '+1(617)287-6428', -- +XXX(XXX)XXXX-XXXX
        'Chinese', -- nacionalidade
        '100 Morrissey Blvd., Boston, MA 02125-3393', -- endereço
        '1', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '0' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Peer Kroger', -- nome da pessoa
        'kroeger@dbs.ifi.lmu.de', --email
        'University of Munich', -- instituição
        '+49(89)2180-9327', -- +XXX(XXX)XXXX-XXXX
        'German', -- nacionalidade
        'Oettingenstrabe 67, 80538 München, Germany', -- endereço
        '1', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '0' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Gabriel Ghinita', -- nome da pessoa
        'gabriel.ghinita@umb.edu', --email
        'Purdue University', -- instituição
        '+1(617)287-6479', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'West Lafayette, IN 47907, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Ning Shang', -- nome da pessoa
        'ning.shang@umb.edu', --email
        'Purdue University', -- instituição
        '+1(617)287-6480', -- +XXX(XXX)XXXX-XXXX
        'Japonese', -- nacionalidade
        'West Lafayette, IN 47907, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Elisa Bertino', -- nome da pessoa
        'elisa.bertino@umb.edu', --email
        'Purdue University', -- instituição
        '+1(617)287-6485', -- +XXX(XXX)XXXX-XXXX
        'Brazilian', -- nacionalidade
        'West Lafayette, IN 47907, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Ryan Carlson', -- nome da pessoa
        'ryan.carlson@cs.swarthmore.edu', --email
        'Swarthmore College', -- instituição
        '+1(610)322-8670', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        '500 College Ave, Swarthmore, PA 19081, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Carmen Ruiz Vicente', -- nome da pessoa
        'cvicente@cs.aau.dk', --email
        'Aalborg University', -- instituição
        '+45(99)41-9942', -- +XXX(XXX)XXXX-XXXX
        'Danish', -- nacionalidade
        'Fredrik Bajers Vej 5, 9100 Aalborg, Denmark', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
-- **** autor
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Michael Kroepfl', -- nome da pessoa
        'mick.kroepfl@microsoft.com', --email
        'Microsoft Corporation', -- instituição
        '+1(425)703-8083', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'One Microsof Way Redmond, WA 98052', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Yonatan Wexler', -- nome da pessoa
        'ywexler@microsoft.com', --email
        'Microsoft Corporation', -- instituição
        '+1(425)703-8283', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'One Microsof Way Redmond, WA 98052', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Eyal Ofek', -- nome da pessoa
        'eyal_ofek@microsoft.com', --email
        'Microsoft Corporation', -- instituição
        '+1(425)703-8283', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'One Microsof Way Redmond, WA 98052', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Arif Khan', -- nome da pessoa
        'arifd@cise.ufl.edu', --email
        'University of Florida', -- instituição
        '+1(352)505-1674', -- +XXX(XXX)XXXX-XXXX
        'Indian', -- nacionalidade
        'E450 CSE Building, PO Box 116120, Gainesville, FL 32611-6120, USA', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Sarana Nutanong', -- nome da pessoa
        'sarana.natanong@unimelb.edu.au', --email
        'University of Melbourne', -- instituição
        '+61(3)9035-5511', -- +XXX(XXX)XXXX-XXXX
        'Australian', -- nacionalidade
        'Parkville VIC 3010, Australia', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Egemen Tanin', -- nome da pessoa
        'egemen@unimelb.edu.au', --email
        'University of Melbourne', -- instituição
        '+61(3)9035-5511', -- +XXX(XXX)XXXX-XXXX
        'Australian', -- nacionalidade
        'Parkville VIC 3010, Australia', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Mohammed Eunus Ali', -- nome da pessoa
        'm.enus.ali@unimelb.edu.au', --email
        'University of Melbourne', -- instituição
        '+61(3)9035-5511', -- +XXX(XXX)XXXX-XXXX
        'Arabic', -- nacionalidade
        'Parkville VIC 3010, Australia', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Lars Kulik', -- nome da pessoa
        'lars_k@unimelb.edu.au', --email
        'University of Melbourne', -- instituição
        '+61(3)9035-5511', -- +XXX(XXX)XXXX-XXXX
        'Australian', -- nacionalidade
        'Parkville VIC 3010, Australia', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'David Eppstein', -- nome da pessoa
        'eppstein@ics.uci.edu', --email
        'University of California', -- instituição
        '+1(949)824-6384', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        '1111 Franklin Street, Oakland, CA 94607', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Michael T. Goodrich', -- nome da pessoa
        'mtgoodrich@ics.uci.edu', --email
        'University of California', -- instituição
        '+1(949)824-6384', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        '1111 Franklin Street, Oakland, CA 94607', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Sattam Alsubaiee', -- nome da pessoa
        'sattam@ics.uci.edu', --email
        'University of California', -- instituição
        '+1(949)824-6384', -- +XXX(XXX)XXXX-XXXX
        'Indian', -- nacionalidade
        '1111 Franklin Street, Oakland, CA 94607', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Alexander Behm', -- nome da pessoa
        'ale_behm@ics.uci.edu', --email
        'University of California', -- instituição
        '+1(949)824-6384', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        '1111 Franklin Street, Oakland, CA 94607', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Chen Li', -- nome da pessoa
        'chen_li@ics.uci.edu', --email
        'University of California', -- instituição
        '+1(949)824-6384', -- +XXX(XXX)XXXX-XXXX
        'Chinese', -- nacionalidade
        '1111 Franklin Street, Oakland, CA 94607', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Shawn Newsam', -- nome da pessoa
        'newsam@ics.uci.edu', --email
        'University of California', -- instituição
        '+1(949)824-6384', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        '1111 Franklin Street, Oakland, CA 94607', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Yi Yang', -- nome da pessoa
        'yang@ics.uci.edu', --email
        'University of California', -- instituição
        '+1(949)824-6384', -- +XXX(XXX)XXXX-XXXX
        'Chinese', -- nacionalidade
        '1111 Franklin Street, Oakland, CA 94607', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Wanying Luo', -- nome da pessoa
        'w8luo@cs.uwaterloo.ca', --email
        'University of Waterloo', -- instituição
        '+1(519)888-4567', -- +XXX(XXX)XXXX-XXXX
        'Canadian', -- nacionalidade
        '200 University Ave W, Waterloo, ON N2L 3G1, Canada', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Urs Hengartner', -- nome da pessoa
        'urs@cs.uwaterloo.ca', --email
        'University of Waterloo', -- instituição
        '+1(519)888-4567', -- +XXX(XXX)XXXX-XXXX
        'Russian', -- nacionalidade
        '200 University Ave W, Waterloo, ON N2L 3G1, Canada', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Andreas Brodt', -- nome da pessoa
        'as@ipvs.uni-stuttgart.de', --email
        'Universität Stuttgart', -- instituição
        '+49(711)685-8448', -- +XXX(XXX)XXXX-XXXX
        'German', -- nacionalidade
        'Keplerstrabe 7, 70174 Stuttgart, Germany', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Bernhard Mitschang', -- nome da pessoa
        'bernhard@ipvs.uni-stuttgart.de', --email
        'Universität Stuttgart', -- instituição
        '+49(711)685-8844', -- +XXX(XXX)XXXX-XXXX
        'German', -- nacionalidade
        'Keplerstrabe 7, 70174 Stuttgart, Germany', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Songhua Xing', -- nome da pessoa
        'sxing@us.ibm.com', --email
        'University of Southern California', -- instituição
        '+1(213)740-2311', -- +XXX(XXX)XXXX-XXXX
        'Chinese', -- nacionalidade
        'Los Angeles, CA 90089', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Cyrus Shahabi', -- nome da pessoa
        'cshahabi@css.edu', --email
        'University of Southern California', -- instituição
        '+1(213)740-2311', -- +XXX(XXX)XXXX-XXXX
        'Chinese', -- nacionalidade
        'Los Angeles, CA 90089', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Ritesh J. Agrawal', -- nome da pessoa
        'ritesh.j.agrawal@att.com', --email
        'ATT Interactive', -- instituição
        '+1(916)843-4685', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'PO Box 537104 - Atlanta, GA 30353', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'James G. Shanahan', -- nome da pessoa
        'james.g@att.com', --email
        'ATT Interactive', -- instituição
        '+1(916)843-4685', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'PO Box 537104 - Atlanta, GA 30353', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Gwen Wilke', -- nome da pessoa
        'gwilke@vienna.edu', --email
        'Vienna University of Techology', -- instituição
        '+43(1)588-010', -- +XXX(XXX)XXXX-XXXX
        'Austrian', -- nacionalidade
        'Karlsplatz 13, 1040 Wien, Austria', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Andrew U. Frank', -- nome da pessoa
        'aufrank@vienna.edu', --email
        'Vienna University of Techology', -- instituição
        '+43(1)588-010', -- +XXX(XXX)XXXX-XXXX
        'Austrian', -- nacionalidade
        'Karlsplatz 13, 1040 Wien, Austria', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Jan-Henrik Haunert', -- nome da pessoa
        'jan-henrik@uni-osnabrueck.de', --email
        'Universität Würzburg', -- instituição
        '+49(0)931-310', -- +XXX(XXX)XXXX-XXXX
        'German', -- nacionalidade
        'Sanderring 2, 97070 Würzburg, Germany', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Alexander Wolff', -- nome da pessoa
        'aWolff@uni-osnabrueck.de', --email
        'Universität Würzburg', -- instituição
        '+49(0)931-310', -- +XXX(XXX)XXXX-XXXX
        'German', -- nacionalidade
        'Sanderring 2, 97070 Würzburg, Germany', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Anand Panangadan', -- nome da pessoa
        'anandp@jet.com', --email
        'Jet Propulsion Laboratory', -- instituição
        '+1(818)354-4321', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        '4800 Oak Grove Dr, Pasadena, CA 91109, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Ashit Talukder', -- nome da pessoa
        'ashit_talukder@jet.com', --email
        'Jet Propulsion Laboratory', -- instituição
        '+1(818)354-4321', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        '4800 Oak Grove Dr, Pasadena, CA 91109, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Jan Oliver Wallgrün', -- nome da pessoa
        'jan@bremen.org', --email
        'University of Bremen', -- instituição
        '+49(818)421-2181', -- +XXX(XXX)XXXX-XXXX
        'German', -- nacionalidade
        'Bibliothekstrabe 1, 28359 Bremen, Germany', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Diedrich Wolter', -- nome da pessoa
        'diedrich_wolter@bremen.org', --email
        'University of Bremen', -- instituição
        '+49(818)421-2181', -- +XXX(XXX)XXXX-XXXX
        'German', -- nacionalidade
        'Bibliothekstrabe 1, 28359 Bremen, Germany', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Kai-Florian Richter', -- nome da pessoa
        'kay-florian@bremen.org', --email
        'University of Bremen', -- instituição
        '+49(818)421-2181', -- +XXX(XXX)XXXX-XXXX
        'Korean', -- nacionalidade
        'Bibliothekstrabe 1, 28359 Bremen, Germany', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Xutong Liu', -- nome da pessoa
        'xutong@tech.virginia.com', --email
        'Virginia Tech', -- instituição
        '+1(54)-231-6000', -- +XXX(XXX)XXXX-XXXX
        'American', -- nacionalidade
        'Blacksburg, VA 24061, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Feng Chen', -- nome da pessoa
        'fchen@tech.virginia.com', --email
        'Virginia Tech', -- instituição
        '+1(54)-231-6000', -- +XXX(XXX)XXXX-XXXX
        'Chineses', -- nacionalidade
        'Blacksburg, VA 24061, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '0', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Chang-Tien Lu', -- nome da pessoa
        'tien-lu@tech.virginia.com', --email
        'Virginia Tech', -- instituição
        '+1(54)-231-6000', -- +XXX(XXX)XXXX-XXXX
        'Chineses', -- nacionalidade
        'Blacksburg, VA 24061, United States', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '1' -- se é autor (0 ou 1)
);
/
INSERT INTO pessoa VALUES(
        SEQ_IDPE_PESSOA.NEXTVAL, -- código da pessoa
        'Abdullah Ahmed', -- nome da pessoa
        'a.ahmed@gmail.com', --email
        'University of Waterloo', -- instituição
        '+1(519)888-4567', -- +XXX(XXX)XXXX-XXXX
        'Arabic', -- nacionalidade
        '200 University Ave W, Waterloo, ON N2L 3G1, Canada', -- endereço
        '0', -- se é organizador (0 ou 1)
        '1', -- se é participante (0 ou 1)
        '0' -- se é autor (0 ou 1)
);
/
/
/
/
/
/
/
/
-- Inscritos 
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = ''),
    TO_DATE('/10/2010', 'DD/MM/YYYY'),
    ''
);
/
/
/
/
/
-- NAO AUTOR MAS APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kroeger@dbs.ifi.lmu.de'),
    TO_DATE('01/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'gabriel.ghinita@umb.edu'),
    TO_DATE('03/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'elisa.bertino@umb.edu'),
    TO_DATE('02/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ryan.carlson@cs.swarthmore.edu'),
    TO_DATE('05/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cvicente@cs.aau.dk'),
    TO_DATE('18/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mick.kroepfl@microsoft.com'),
    TO_DATE('11/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'eyal_ofek@microsoft.com'),
    TO_DATE('07/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'arifd@cise.ufl.edu'),
    TO_DATE('17/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sarana.natanong@unimelb.edu.au'),
    TO_DATE('14/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'egemen@unimelb.edu.au'),
    TO_DATE('21/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'm.enus.ali@unimelb.edu.au'),
    TO_DATE('12/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'eppstein@ics.uci.edu'),
    TO_DATE('09/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sattam@ics.uci.edu'),
    TO_DATE('19/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chen_li@ics.uci.edu'),
    TO_DATE('21/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'newsam@ics.uci.edu'),
    TO_DATE('12/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'w8luo@cs.uwaterloo.ca'),
    TO_DATE('10/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- NÃO AUTOR MAS APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'a.ahmed@gmail.com'),
    TO_DATE('21/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'urs@cs.uwaterloo.ca'),
    TO_DATE('24/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'as@ipvs.uni-stuttgart.de'),
    TO_DATE('22/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sxing@us.ibm.com'),
    TO_DATE('21/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cshahabi@css.edu'),
    TO_DATE('13/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ritesh.j.agrawal@att.com'),
    TO_DATE('14/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'james.g@att.com'),
    TO_DATE('17/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'gwilke@vienna.edu'),
    TO_DATE('23/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'aufrank@vienna.edu'),
    TO_DATE('07/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jan-henrik@uni-osnabrueck.de'),
    TO_DATE('09/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'aWolff@uni-osnabrueck.de'),
    TO_DATE('10/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'anandp@jet.com'),
    TO_DATE('08/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ashit_talukder@jet.com'),
    TO_DATE('21/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jan@bremen.org'),
    TO_DATE('16/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kay-florian@bremen.org'),
    TO_DATE('18/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR E APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xutong@tech.virginia.com'),
    TO_DATE('09/10/2010', 'DD/MM/YYYY'),
    '1'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tien-lu@tech.virginia.com'),
    TO_DATE('21/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
-- AUTOR MAS NÃO APRESENTADOR
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
    2,
    19,
    (SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jckrumm@microsoft.com'),
    TO_DATE('21/10/2010', 'DD/MM/YYYY'),
    '0'
);
/
/
/
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
  SELECT SEQ_IDART_ARTIGO.NEXTVAL,
    'Distributed Threshold Querying of General Functions by a Difference of Monotonic Representation',
    TO_DATE('30/08/2011', 'DD/MM/YYYY'),
    TO_TIMESTAMP('10:30:00','HH24:MI:SS'), 
    I.codEv, 
    I.numEd, 
    I.idPart FROM inscrito I, pessoa P WHERE P.emailPe = 'guy@techion.email' and I.idPart = P.idPe;

/*

-- Inserção dos artigos, sem os 

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

-- Escreve
CREATE TABLE escreve(
      idAutor Number(5) NOT NULL,
      idArt Number(5) NOT NULL,
      CONSTRAINT PK_ESCREVE PRIMARY KEY (idAutor, idArt),
      CONSTRAINT PK_ESCREVE_ARTIGO FOREIGN KEY (idArt) REFERENCES artigo(idArt) ON DELETE CASCADE       
);


ADD 8 patrocinadores

 1- coffee break
 2- aluguel do espaço
 3- palestrantes
 4- materiais de divulgação (marketing)
 5- empréstimo de equipamentos e utencilios
 6- pagamento do servidor ou e-commerce
 7- limpeza do local
 8- serviços de transporte
 9- construção de stands
 10- kit do evento (brindes)



-- Atualiza valor do atributo derivado nroFuncionariosDe na tabela departamento
UPDATE departamento
SET nroFuncionariosDe = (
SELECT DISTINCT count(trabalho.idDe) FROM trabalho
WHERE trabalho.idDe = departamento.idDe);





*/