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
- patrocínios: pelo menos 4 por edição - 5 por edição OK
- despesas por edição: pelo menos 8 OK
- auxílios por edição: pelo menos 10
- organizadores por edição: pelo menos 4 OK
- autores por artigo: variável (apenas 10% dos artigos podem possuir 1
autor, ou seja, a maioria dos artigos devem possuir 2 ou mais autores) OK
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
-- Inserção do segundo Evento
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
-- Inserção do terceiro Evento
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
/
/
/
/
-- Inserção da edição de 2014 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		40,--SEQ_NUMED_EDICAO.NEXTVAL,
    	TO_DATE('01/09/2014', 'DD/MM/YYYY'),
    	TO_DATE('05/09/2014', 'DD/MM/YYYY'),
    	'Hangzhou, China',
    	1100.00
);
-- Inserção da edição de 2013 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		39,--SEQ_NUMED_EDICAO.NEXTVAL,
    	TO_DATE('26/08/2013', 'DD/MM/YYYY'),
    	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
    	'Trento, Italy',
    	1100.00
);
-- Inserção da edição de 2012 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		38,--SEQ_NUMED_EDICAO.NEXTVAL,
    	TO_DATE('27/08/2012', 'DD/MM/YYYY'),
    	TO_DATE('31/08/2012', 'DD/MM/YYYY'),
    	'Istanbul, Turkey',
    	1100.00
);
-- Inserção da edição de 2011 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
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
		2, -- código do evento
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
		2, -- código do evento
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
		2, -- código do evento
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
		2, -- código do evento
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
-- Inserção da edição de 2013 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
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
		3, -- código do evento
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
		3, -- código do evento
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
		3, -- código do evento
		19,--SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('26/10/2010', 'DD/MM/YYYY'), -- data de início
		TO_DATE('30/10/2010', 'DD/MM/YYYY'), -- data de fim
		'Toronto, Canada',-- local onde a edição ocorreu na forma de Cidade, País
		1580.00-- valor da inscrição
);
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
/
/
-- Inserção de despesas
/
/
-- Evento 01 edição 37
-- sobra 1000 - 06990590000204
/
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('17/07/2011', 'DD/MM/YYYY'),
		9000.00, -- valor despesa
		'Coffee Break'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 59456277000176
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/07/2011', 'DD/MM/YYYY'),
		20000.00, -- valor despesa
		'Aluguel da sala de conferências'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('01/07/2011', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Material de divulgação e divulgação online'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('10/08/2011', 'DD/MM/YYYY'),
		1000.00, -- valor despesa
		'Empréstimo de equipamentos eletrônicos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 61797924000155
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('15/07/2011', 'DD/MM/YYYY'),
		1000.00, -- valor despesa
		'Mestre de Cerimônias'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 61797924000155
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/07/2011', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Palestrantes'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/08/2011', 'DD/MM/YYYY'),
		1000.00, -- valor despesa
		'Limpeza do local'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/07/2011', 'DD/MM/YYYY'),
		5000.00, -- valor despesa
		'Construção de stands'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 10322194000103
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		37, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('13/07/2011', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Jantar de encerramento'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 37;
/
/
/
-- Evento 01 ediçao 38
/
-- Sobra 400
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('30/06/2012', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Kit do evento'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('21/06/2012', 'DD/MM/YYYY'),
		9000.00, -- valor despesa
		'Aluguel do espaço'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 19758880000198
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('27/06/2012', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Coffee Break'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 57286247000133
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('02/07/2012', 'DD/MM/YYYY'),
		1500.00, -- valor despesa
		'Hospedagem palestrante'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 59456277000176
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('01/07/2012', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Serviço de Transporte'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('29/06/2012', 'DD/MM/YYYY'),
		1700.00, -- valor despesa
		'Construção de stands'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/06/2012', 'DD/MM/YYYY'),
		400.00, -- valor despesa
		'Serviço de e-commerce'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 59456277000176
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/06/2012', 'DD/MM/YYYY'),
		1000.00, -- valor despesa
		'Limpeza do local'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		38, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2012', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Empréstimo de equipamentos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 1 
			AND pat.numEd = 38;
/
/
/
/
-- Evento 01 ediçao 39
/
-- Sobra 6200
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('30/06/2013', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Kit do evento'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('21/06/2013', 'DD/MM/YYYY'),
		1500.00, -- valor despesa
		'Marketing digital'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('27/06/2013', 'DD/MM/YYYY'),
		7000.00, -- valor despesa
		'Aluguel do hotel para Conferência'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('02/07/2013', 'DD/MM/YYYY'),
		1500.00, -- valor despesa
		'Visita turística para inscritos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 61797924000155
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('01/07/2013', 'DD/MM/YYYY'),
		1000.00, -- valor despesa
		'Limpeza do espaço'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 57286247000133
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('29/06/2013', 'DD/MM/YYYY'),
		1900.00, -- valor despesa
		'Construção de stands'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 57286247000133
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/06/2013', 'DD/MM/YYYY'),
		400.00, -- valor despesa
		'Serviço de e-commerce'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/06/2013', 'DD/MM/YYYY'),
		1000.00, -- valor despesa
		'Limpeza do local'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 19758880000198
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2013', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Empréstimo de equipamentos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 19758880000198
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		39, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2013', 'DD/MM/YYYY'),
		4000.00, -- valor despesa
		'Serviços de Transporte'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 19758880000198
			AND pat.codEv = 1 
			AND pat.numEd = 39;
/
/
/
/
/
/
/
-- Evento 01 ediçao 40
/
-- Sobra 2900
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('30/06/2014', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Kit do evento'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2014', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Empréstimo de equipamentos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('01/07/2014', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Serviço de Transporte'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 61797924000155
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('27/06/2014', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Coffee Break'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 57286247000133
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('21/06/2014', 'DD/MM/YYYY'),
		8500.00, -- valor despesa
		'Aluguel do espaço'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 19758880000198
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('02/07/2014', 'DD/MM/YYYY'),
		1500.00, -- valor despesa
		'Hospedagem palestrante'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/

INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('29/06/2014', 'DD/MM/YYYY'),
		1700.00, -- valor despesa
		'Construção de stands'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/06/2014', 'DD/MM/YYYY'),
		400.00, -- valor despesa
		'Serviço de e-commerce'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/
INSERT INTO despesa
	SELECT 
		1,-- codigo evento
		40, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/06/2014', 'DD/MM/YYYY'),
		1000.00, -- valor despesa
		'Limpeza do local'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 1 
			AND pat.numEd = 40;
/
/
/
/
/
/
-- Evento 02 ediçao 18
/
-- Sobra 3500
-- 1100 segundo
-- 2400 terceiro
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('30/06/2010', 'DD/MM/YYYY'),
		4200.00, -- valor despesa
		'Kit do evento'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('21/06/2010', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Marketing digital'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('27/06/2010', 'DD/MM/YYYY'),
		17000.00, -- valor despesa
		'Aluguel do hotel para Conferência'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('02/07/2010', 'DD/MM/YYYY'),
		1800.00, -- valor despesa
		'Visita turística para inscritos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('01/07/2010', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Limpeza do espaço'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('29/06/2010', 'DD/MM/YYYY'),
		1900.00, -- valor despesa
		'Construção de stands'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/06/2010', 'DD/MM/YYYY'),
		2600.00, -- valor despesa
		'Serviço de e-commerce'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 59456277000176
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/06/2010', 'DD/MM/YYYY'),
		4000.00, -- valor despesa
		'Limpeza do local'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 59456277000176
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2010', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Empréstimo de equipamentos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 57286247000133
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		18, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2010', 'DD/MM/YYYY'),
		5000.00, -- valor despesa
		'Serviços de Transporte'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 10322194000103
			AND pat.codEv = 2
			AND pat.numEd = 18;
/
/
/
/
/
/
-- Evento 02 ediçao 19
/
-- 500 primeiro
-- 1000 segundo
-- 1500 terceiro
-- nada
-- 300 ultimo
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('30/06/2011', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Kit do evento'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('21/06/2011', 'DD/MM/YYYY'),
		18000.00, -- valor despesa
		'Aluguel do espaço'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 19758880000198
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('27/06/2011', 'DD/MM/YYYY'),
		9500.00, -- valor despesa
		'Coffee Break'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('02/07/2011', 'DD/MM/YYYY'),
		4000.00, -- valor despesa
		'Hospedagem palestrante'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 19758880000198
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('01/07/2011', 'DD/MM/YYYY'),
		4300.00, -- valor despesa
		'Serviço de Transporte'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('29/06/2011', 'DD/MM/YYYY'),
		3500.00, -- valor despesa
		'Construção de stands'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/06/2011', 'DD/MM/YYYY'),
		1700.00, -- valor despesa
		'Serviço de e-commerce'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 10322194000103
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/06/2011', 'DD/MM/YYYY'),
		3600.00, -- valor despesa
		'Limpeza do local'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 10322194000103
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		19, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2011', 'DD/MM/YYYY'),
		2000.00, -- valor despesa
		'Empréstimo de equipamentos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 61797924000155
			AND pat.codEv = 2
			AND pat.numEd = 19;
/
/
/
/
/
-- Evento 02 edicao 20
/
-- 1500 primeiro
-- 
-- 1100 quarto
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('30/06/2012', 'DD/MM/YYYY'),
		7000.00, -- valor despesa
		'Kit do evento'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('21/06/2012', 'DD/MM/YYYY'),
		1500.00, -- valor despesa
		'Marketing digital'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('27/06/2012', 'DD/MM/YYYY'),
		23000.00, -- valor despesa
		'Aluguel do hotel para Conferência'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 19758880000198
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('02/07/2012', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Visita turística para inscritos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('01/07/2012', 'DD/MM/YYYY'),
		3300.00, -- valor despesa
		'Limpeza do espaço'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 10322194000103
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('29/06/2012', 'DD/MM/YYYY'),
		2300.00, -- valor despesa
		'Construção de stands'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 57286247000133
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/06/2012', 'DD/MM/YYYY'),
		1200.00, -- valor despesa
		'Serviço de e-commerce'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 10322194000103
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/06/2012', 'DD/MM/YYYY'),
		1000.00, -- valor despesa
		'Limpeza do local'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 60316817000103
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2012', 'DD/MM/YYYY'),
		3000.00, -- valor despesa
		'Empréstimo de equipamentos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		20, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2012', 'DD/MM/YYYY'),
		5300.00, -- valor despesa
		'Serviços de Transporte'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 2
			AND pat.numEd = 20;
/
/
/
/
/
/
-- Evento 02 edicao 21
/
-- 1800 terceiro
-- 500 quarto
-- 
/
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('30/06/2013', 'DD/MM/YYYY'),
		23000.00, -- valor despesa
		'Kit do evento'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('21/06/2013', 'DD/MM/YYYY'),
		50000.00, -- valor despesa
		'Aluguel do espaço'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 06990590000204
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('27/06/2013', 'DD/MM/YYYY'),
		35000.00, -- valor despesa
		'Coffee Break'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 59456277000176
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('02/07/2013', 'DD/MM/YYYY'),
		27000.00, -- valor despesa
		'Hospedagem, viagem e pagamento palestrantes'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 59456277000176
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('01/07/2013', 'DD/MM/YYYY'),
		21000.00, -- valor despesa
		'Serviço de Transporte'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 59456277000176
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('29/06/2013', 'DD/MM/YYYY'),
		5000.00, -- valor despesa
		'Construção de stands'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('25/06/2013', 'DD/MM/YYYY'),
		3200.00, -- valor despesa
		'Serviço de e-commerce'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 33372251000156
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('20/06/2013', 'DD/MM/YYYY'),
		4500.00, -- valor despesa
		'Limpeza do local'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 10322194000103
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
INSERT INTO despesa
	SELECT 
		2,-- codigo evento
		21, -- ev01 - 37 - 40
		SEQ_CODDESP_DESPESA.NEXTVAL,
		pat.cnpjPat,-- cnpj patrocinador
		pat.codEv,
		pat.numEd,
		TO_DATE('19/06/2013', 'DD/MM/YYYY'),
		2200.00, -- valor despesa
		'Empréstimo de equipamentos'
		FROM patrocinio pat
		WHERE pat.cnpjPat = 57286247000133
			AND pat.codEv = 2
			AND pat.numEd = 21;
/
/
/
/
-- Inserção de Pessoas
/
/
/
/
/
/
/
/
-- sigspatial ev 02 ed 18
--Artigo Energy-Efficient Processing of Spatio-Temporal Queries in Wireless Sensor Networks
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Markus Bestehorn',
	'bestehorn@kit.edu',
	'Karlsruhe Institute of Technology, IPD',
	'+49(721)608-44316',
	'German',
	'76131 Karlsruhe, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'bestehorn@kit.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Energy-Efficient Processing of Spatio-Temporal Queries in Wireless Sensor Networks',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'bestehorn@kit.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bestehorn@kit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Klemens Böhm',
	'böhm@kit.edu',
	'Karlsruhe Institute of Technology, IPD',
	'+49(721)608-44316',
	'German',
	'76131 Karlsruhe, Germany',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='böhm@kit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Erik Buchmann',
	'buchmann@kit.edu',
	'Karlsruhe Institute of Technology, IPD',
	'+49(721)608-44316',
	'German',
	'76131 Karlsruhe, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'buchmann@kit.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='buchmann@kit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Stephan Kessler',
	'kessler@kit.edu',
	'Karlsruhe Institute of Technology, IPD',
	'+49(721)608-44316',
	'German',
	'76131 Karlsruhe, Germany',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kessler@kit.edu';
/
--Artigo On Map Matching of Wireless Positioning Data: A Selective Look-ahead Approach
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Matthew Weber',
	'weber@rutgers.edu',
	'Georgia Institute of Technology',
	'+8(48)932-8718',
	'American',
	'New Brunswick, NJ 08901',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'weber@rutgers.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'On Map Matching of Wireless Positioning Data: A Selective Look-ahead Approach',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'weber@rutgers.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='weber@rutgers.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ling Liu',
	'liu@rutgers.edu',
	'Georgia Institute of Technology',
	'+8(48)932-8718',
	'American',
	'New Brunswick, NJ 08901',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'liu@rutgers.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='liu@rutgers.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Michael Covington',
	'covington@rutgers.edu',
	'Georgia Institute of Technology',
	'+8(48)932-8718',
	'American',
	'New Brunswick, NJ 08901',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='covington@rutgers.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Peter Pesti',
	'pesti@rutgers.edu',
	'Georgia Institute of Technology',
	'+8(48)932-8718',
	'American',
	'New Brunswick, NJ 08901',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'pesti@rutgers.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='pesti@rutgers.edu';
/
--Artigo Privacy-Preserving Data-Oblivious Geometric Algorithms for Geographic Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'David Eppstein',
	'eppstein@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'eppstein@uc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Privacy-Preserving Data-Oblivious Geometric Algorithms for Geographic Data',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'eppstein@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='eppstein@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Michael Goodrich',
	'goodrich@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='goodrich@uc.edu';
/
--Artigo Best Point Detour Query in Road Networks
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Shuo Shang',
	'shang@itee.uq.edu.au',
	'University of Queensland',
	'+61(7)3365-1649',
	'Australian',
	'Brisbane QLD 4072 Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shang@itee.uq.edu.au'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Best Point Detour Query in Road Networks',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	2,
	18,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'shang@itee.uq.edu.au' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shang@itee.uq.edu.au';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ke Deng',
	'deng@itee.uq.edu.au',
	'University of Queensland',
	'+61(7)3365-1649',
	'Australian',
	'Brisbane QLD 4072 Australia',
	'0',
	'1',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='deng@itee.uq.edu.au';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'kexin Xie',
	'xie@itee.uq.edu.au',
	'University of Queensland',
	'+61(7)3365-1649',
	'Australian',
	'Brisbane QLD 4072 Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xie@itee.uq.edu.au'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='xie@itee.uq.edu.au';
/
--Artigo Verifying Spatial Queries using Voronoi Neighbors
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ling Hu',
	'hu@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'hu@usc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Verifying Spatial Queries using Voronoi Neighbors',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'hu@usc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='hu@usc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Cyrus Shahabi',
	'shahabi@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shahabi@usc.edu';
/
--Artigo Local Network Voronoi Diagram
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sarana Nutanong',
	'nutanong@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'nutanong@unimelb.edu.au'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Local Network Voronoi Diagram',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'nutanong@unimelb.edu.au' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='nutanong@unimelb.edu.au';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Egemen Tanin',
	'tanin@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tanin@unimelb.edu.au'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tanin@unimelb.edu.au';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mohammed Eunus Ali',
	'ali@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ali@unimelb.edu.au'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ali@unimelb.edu.au';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Lars Kulik',
	'kulik@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kulik@unimelb.edu.au'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kulik@unimelb.edu.au';
/
--Artigo Scalable Shortest Paths Browsing on Land Surface
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Songhua Xing',
	'xing@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xing@usc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Scalable Shortest Paths Browsing on Land Surface',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'xing@usc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='xing@usc.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shahabi@usc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shahabi@usc.edu';
/
--Artigo An Algorithmic Framework for Segmenting Trajectories based on Spatio-Temporal Criteria
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Maike Buchin',
	'buchin@uu.nl',
	'Utrecht University',
	'Dutch',
	'+31(30)253-3550',
	'3508 TC Utrecht, The Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'buchin@uu.nl'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'An Algorithmic Framework for Segmenting Trajectories based on Spatio-Temporal Criteria',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'buchin@uu.nl' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='buchin@uu.nl';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Anne Driemel',
	'driemel@uu.nl',
	'Utrecht University',
	'Dutch',
	'+31(30)253-3550',
	'3508 TC Utrecht, The Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'driemel@uu.nl'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='driemel@uu.nl';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Marc van Kreveld',
	'kreveld@uu.nl',
	'Utrecht University',
	'Dutch',
	'+31(30)253-3550',
	'3508 TC Utrecht, The Netherlands',
	'0',
	'1',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kreveld@uu.nl';
/
--Artigo Privacy-Preserving Matching of Spatial Datasets with Protection against Background Knowledge
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Gabriel Ghinita',
	'ghinita@umb.edu',
	'Purdue University',
	'+1(617)287-6479',
	'American',
	'West Lafayette, IN 47907, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ghinita@umb.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Privacy-Preserving Matching of Spatial Datasets with Protection against Background Knowledge',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'ghinita@umb.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ghinita@umb.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Carmen Ruiz Vicente',
	'vicente@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'vicente@cs.aau.dk'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='vicente@cs.aau.dk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ning Shang',
	'shang@umb.edu',
	'Purdue University',
	'+1(617)287-6479',
	'American',
	'West Lafayette, IN 47907, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shang@umb.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shang@umb.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Elisa Bertino',
	'bertino@umb.edu',
	'Purdue University',
	'+1(617)287-6479',
	'American',
	'West Lafayette, IN 47907, United States',
	'0',
	'1',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bertino@umb.edu';
/
--Artigo Optimal Network Location Queries
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Parisa Ghaemi',
	'ghaemi@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ghaemi@usc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Optimal Network Location Queries',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'ghaemi@usc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ghaemi@usc.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shahabi@usc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'John Wilson',
	'wilson@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wilson@usc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wilson@usc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Farnoush Banaei-Kashani',
	'banaei-kashani@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'banaei-kashani@usc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='banaei-kashani@usc.edu';
/
--Artigo Easiest-to-Reach Neighbor Search
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jie Shao',
	'shao@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shao@unimelb.edu.au'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Easiest-to-Reach Neighbor Search',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'shao@unimelb.edu.au' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shao@unimelb.edu.au';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kulik@unimelb.edu.au';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tanin@unimelb.edu.au';
/
--Artigo An Efficient Location Extraction Algorithm by Leveraging Web Contextual Information
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Rong Xiao',
	'xiao@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xiao@microsoft.com'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'An Efficient Location Extraction Algorithm by Leveraging Web Contextual Information',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'xiao@microsoft.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='xiao@microsoft.com';
/
--Artigo Annotating and Navigating Tourist Videos
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Bo Zhang',
	'zhang@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zhang@microsoft.com'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Annotating and Navigating Tourist Videos',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'zhang@microsoft.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zhang@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ying-Qing Xu',
	'xu@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='xu@microsoft.com';
/
--Artigo Qualitative Matching of Spatial Information
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jan Oliver Wallgrün',
	'wallgrün@bremen.org',
	'University of Bremen',
	'+49(818)421-2181',
	'German',
	'Bibliothekstrabe 1, 28359 Bremen, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wallgrün@bremen.org'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Qualitative Matching of Spatial Information',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'wallgrün@bremen.org' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wallgrün@bremen.org';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Diedrich Wolter',
	'wolter@bremen.org',
	'University of Bremen',
	'+49(818)421-2181',
	'German',
	'Bibliothekstrabe 1, 28359 Bremen, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wolter@bremen.org'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wolter@bremen.org';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kai-Florian Richter',
	'richter@bremen.org',
	'University of Bremen',
	'+49(818)421-2181',
	'German',
	'Bibliothekstrabe 1, 28359 Bremen, Germany',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='richter@bremen.org';
/
--Artigo Tolerance Geometry - Euclids First Postulate for Points and Lines with Extension
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Gwen Wilke',
	'wilke@vienna.edu',
	'Vienna University of Techology',
	'+43(1)588-010',
	'Austrian',
	'Karlsplatz 13, 1040 Wien, Austria',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wilke@vienna.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Tolerance Geometry - Euclids First Postulate for Points and Lines with Extension',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'wilke@vienna.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wilke@vienna.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Andrew Frank',
	'frank@vienna.edu',
	'Vienna University of Techology',
	'+43(1)588-010',
	'Austrian',
	'Karlsplatz 13, 1040 Wien, Austria',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='frank@vienna.edu';
/
--Artigo Spatial Outlier Detection: Random Walk Based Approaches
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xutong Liu',
	'liu@tech.virginia.com',
	'Virginia Tech',
	'+1(54)-231-6000',
	'Chinese',
	'Blacksburg, VA 24061, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'liu@tech.virginia.com'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Spatial Outlier Detection: Random Walk Based Approaches',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'liu@tech.virginia.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='liu@tech.virginia.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Chang-Tien Lu',
	'lu@tech.virginia.com',
	'Virginia Tech',
	'+1(54)-231-6000',
	'Chinese',
	'Blacksburg, VA 24061, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lu@tech.virginia.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Feng Chen',
	'chen@tech.virginia.com',
	'Virginia Tech',
	'+1(54)-231-6000',
	'Chinese',
	'Blacksburg, VA 24061, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chen@tech.virginia.com'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chen@tech.virginia.com';
/
--Artigo A Lagrangian Approach for Storage of Spatio-Temporal Network Datasets: A Summary of Results
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Michael Evans',
	'evans@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'evans@uminnesota.com'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A Lagrangian Approach for Storage of Spatio-Temporal Network Datasets: A Summary of Results',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'evans@uminnesota.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='evans@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'KwangSoo Yang',
	'yang@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yang@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'James Kang',
	'kang@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kang@uminnesota.com'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kang@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Shashi Shekhar',
	'shekhar@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shekhar@uminnesota.com';
/
--Artigo Bridge detection in grid terrains and improved drainage enforcement
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ryan Carlson',
	'carlson@swarthmore.com',
	'Swarthmore College',
	'+1(610)328-8000',
	'American',
	'500 College Ave, Swarthmore, PA 19081, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'carlson@swarthmore.com'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Bridge detection in grid terrains and improved drainage enforcement',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'carlson@swarthmore.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='carlson@swarthmore.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Andrew Danner',
	'danner@swarthmore.com',
	'Swarthmore College',
	'+1(610)328-8000',
	'American',
	'500 College Ave, Swarthmore, PA 19081, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'danner@swarthmore.com'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='danner@swarthmore.com';
/
--Artigo Supporting Location-Based Approximate-Keyword Queries
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sattam Alsubaiee',
	'alsubaiee@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'alsubaiee@uc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Supporting Location-Based Approximate-Keyword Queries',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'alsubaiee@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='alsubaiee@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Alexander Behm',
	'behm@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'behm@uc.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='behm@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Chen Li',
	'li@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='li@uc.edu';
/
--Artigo Determining the Spatial Reader-scope of News Sources with Local Lexicons
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Gianluca Quercini',
	'quercini@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'quercini@umaryland.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Determining the Spatial Reader-scope of News Sources with Local Lexicons',
	TO_DATE('3/11/2010', 'DD/MM/YYYY'),
	TO_TIMESTAMP('3/11/2010, 9:45:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'quercini@umaryland.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='quercini@umaryland.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hanan Samet',
	'samet@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'samet@umaryland.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='samet@umaryland.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jagan Sankaranarayanan',
	'sankaranarayanan@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	18,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sankaranarayanan@umaryland.edu'),
	TO_DATE('1/9/2010', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sankaranarayanan@umaryland.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Michael Lieberman',
	'lieberman@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lieberman@umaryland.edu';
/
/
/
/
/
/
/
/
-- SIGSPATIAL EV 02 ED 19
--Artigo Finding the Most Accessible Locations - Reverse Path Nearest Neighbor Query in Road Networks
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shang@itee.uq.edu.au'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Finding the Most Accessible Locations - Reverse Path Nearest Neighbor Query in Road Networks',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	2,
	19,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'shang@itee.uq.edu.au' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 2
		AND I.numEd = 19;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shang@itee.uq.edu.au';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'deng@itee.uq.edu.au'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='deng@itee.uq.edu.au';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xie@itee.uq.edu.au'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='xie@itee.uq.edu.au';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xiaofang Zhou',
	'zhou@itee.uq.edu.au',
	'University of Queensland',
	'+61(7)3365-1649',
	'Australian',
	'Brisbane QLD 4072 Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zhou@itee.uq.edu.au'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zhou@itee.uq.edu.au';
/
--Artigo Discovering Interesting Sub-paths in Spatiotemporal Datasets: A Summary of Results
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xun Zhou',
	'zhou@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zhou@uminnesota.com'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Discovering Interesting Sub-paths in Spatiotemporal Datasets: A Summary of Results',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'zhou@uminnesota.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zhou@uminnesota.com';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shekhar@uminnesota.com'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shekhar@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Pradeep Mohan',
	'mohan@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mohan@uminnesota.com'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mohan@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Stefan Liess',
	'liess@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'liess@uminnesota.com'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='liess@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Peter Snyder',
	'snyder@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='snyder@uminnesota.com';
/
--Artigo A spatial neighborhood graph approach to regional co-location pattern discovery: A summary of results
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A spatial neighborhood graph approach to regional co-location pattern discovery: A summary of results',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'mohan@uminnesota.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mohan@uminnesota.com';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shekhar@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'James Shine',
	'shine@army.gov',
	'Engineer Research and Development Center',
	'+1(601)636-3111',
	'American',
	'3909 Halls Ferry Road - Vicksburg, MS 39180-6199',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shine@army.gov'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shine@army.gov';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'James Rogers',
	'rogers@army.gov',
	'Engineer Research and Development Center',
	'+1(601)636-3111',
	'American',
	'3909 Halls Ferry Road - Vicksburg, MS 39180-6199',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'rogers@army.gov'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='rogers@army.gov';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Zhe Jiang',
	'jiang@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jiang@uminnesota.com'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jiang@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Nicole Wayant',
	'wayant@army.gov',
	'Engineer Research and Development Center',
	'+1(601)636-3111',
	'American',
	'3909 Halls Ferry Road - Vicksburg, MS 39180-6199',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wayant@army.gov';
/
--Artigo Similarity Search on a Large Collection of Point Sets
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Marco Adelfio',
	'adelfio@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'adelfio@umaryland.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Similarity Search on a Large Collection of Point Sets',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'adelfio@umaryland.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='adelfio@umaryland.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sarana Nutanong',
	'nutanong@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'nutanong@umaryland.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='nutanong@umaryland.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'samet@umaryland.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='samet@umaryland.edu';
/
--Artigo On Efficient Obstructed Reverse Nearest Neighbor Query Processing
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yunjun Gao',
	'gao@zhejiang.edu',
	'Zhejiang University',
	'+86(571)8517-2244',
	'Chinese',
	'38 Zheda Rd, Xihu, Hangzhou, Zhejiang, China, 310027',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'gao@zhejiang.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'On Efficient Obstructed Reverse Nearest Neighbor Query Processing',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'gao@zhejiang.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='gao@zhejiang.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jiacheng Yang',
	'yang@zhejiang.edu',
	'Zhejiang University',
	'+86(571)8517-2244',
	'Chinese',
	'38 Zheda Rd, Xihu, Hangzhou, Zhejiang, China, 310027',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yang@zhejiang.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yang@zhejiang.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Gang Chen',
	'chen@zhejiang.edu',
	'Zhejiang University',
	'+86(571)8517-2244',
	'Chinese',
	'38 Zheda Rd, Xihu, Hangzhou, Zhejiang, China, 310027',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chen@zhejiang.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chen@zhejiang.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Baihua Zheng',
	'zheng@zhejiang.edu',
	'Zhejiang University',
	'+86(571)8517-2244',
	'Chinese',
	'38 Zheda Rd, Xihu, Hangzhou, Zhejiang, China, 310027',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zheng@zhejiang.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Lidan Shou',
	'shou@zhejiang.edu',
	'Zhejiang University',
	'+86(571)8517-2244',
	'Chinese',
	'38 Zheda Rd, Xihu, Hangzhou, Zhejiang, China, 310027',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shou@zhejiang.edu';
/
--Artigo The PR-star octree: A spatio-topological data structure for tetrahedral meshes
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kenneth Weiss',
	'weiss@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'weiss@umaryland.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'The PR-star octree: A spatio-topological data structure for tetrahedral meshes',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'weiss@umaryland.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='weiss@umaryland.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Marcello Velloso',
	'velloso@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'velloso@umaryland.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='velloso@umaryland.edu';
/
--Artigo A New Method for Subdivision Simplification with Applications to Urban-Area Generalization
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kevin Buchin',
	'buchin@eindhoven.edu',
	'TU Eindhoven',
	'+31(40)247-9111',
	'Dutch',
	'5612 AZ Eindhoven, Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'buchin@eindhoven.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A New Method for Subdivision Simplification with Applications to Urban-Area Generalization',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'buchin@eindhoven.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='buchin@eindhoven.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Wouter Meulemans',
	'meulemans@eindhoven.edu',
	'TU Eindhoven',
	'+31(40)247-9111',
	'Dutch',
	'5612 AZ Eindhoven, Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'meulemans@eindhoven.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='meulemans@eindhoven.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Bettina Speckmann',
	'speckmann@eindhoven.edu',
	'TU Eindhoven',
	'+31(40)247-9111',
	'Dutch',
	'5612 AZ Eindhoven, Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'speckmann@eindhoven.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='speckmann@eindhoven.edu';
/
--Artigo Delineating Imprecise Regions via Shortest-Path Graphs
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mark de Berg',
	'berg@eindhoven.edu',
	'TU Eindhoven',
	'+31(40)247-9111',
	'Dutch',
	'5612 AZ Eindhoven, Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'berg@eindhoven.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Delineating Imprecise Regions via Shortest-Path Graphs',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'berg@eindhoven.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='berg@eindhoven.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='meulemans@eindhoven.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='speckmann@eindhoven.edu';
/
--Artigo Exact and Approximate Computations of Watersheds on Triangulated Terrains
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Constantinos Tsirogiannis',
	'tsirogiannis@eindhoven.edu',
	'TU Eindhoven',
	'+31(40)247-9111',
	'Dutch',
	'5612 AZ Eindhoven, Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tsirogiannis@eindhoven.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Exact and Approximate Computations of Watersheds on Triangulated Terrains',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'tsirogiannis@eindhoven.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tsirogiannis@eindhoven.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='berg@eindhoven.edu';
/
--Artigo Flow on Noisy Terrains: An Experimental Evaluation
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Flow on Noisy Terrains: An Experimental Evaluation',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'tsirogiannis@eindhoven.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tsirogiannis@eindhoven.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Herman Haverkort',
	'haverkort@eindhoven.edu',
	'TU Eindhoven',
	'+31(40)247-9111',
	'Dutch',
	'5612 AZ Eindhoven, Netherlands',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='haverkort@eindhoven.edu';
/
--Artigo Privacy-Preserving Assessment of Location Data Trustworthiness
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Chenyun Dai',
	'dai@umb.edu',
	'Purdue University',
	'+1(617)287-6479',
	'American',
	'West Lafayette, IN 47907, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dai@umb.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Privacy-Preserving Assessment of Location Data Trustworthiness',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'dai@umb.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dai@umb.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Fang-Yu Rao',
	'rao@umb.edu',
	'Purdue University',
	'+1(617)287-6479',
	'American',
	'West Lafayette, IN 47907, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='rao@umb.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ghinita@umb.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ghinita@umb.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'bertino@umb.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bertino@umb.edu';
/
--Artigo Data-Driven Trajectory Smoothing
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Daniel Chen',
	'chen@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chen@stanford.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Data-Driven Trajectory Smoothing',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'chen@stanford.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chen@stanford.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Leo Guibas',
	'guibas@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='guibas@stanford.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xiaoye Jiang',
	'jiang@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jiang@stanford.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jiang@stanford.edu';
/
--Artigo Constructing Geo-Ontologies by Reification of Observation Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Benjamin Adams',
	'adams@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'adams@uc.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Constructing Geo-Ontologies by Reification of Observation Data',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'adams@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='adams@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Krzysztof Janowicz',
	'janowicz@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'janowicz@uc.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='janowicz@uc.edu';
/
--Artigo EnAcq: Energy-efficient Trajectory Data Acquisition Based on Improved Map Matching
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Shunkai Fang',
	'fang@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'fang@nus.edu.sg'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'EnAcq: Energy-efficient Trajectory Data Acquisition Based on Improved Map Matching',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'fang@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='fang@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Roger Zimmermann',
	'zimmermann@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zimmermann@nus.edu.sg';
/
--Artigo A splitting line model for directional relations
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A splitting line model for directional relations',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'buchin@eindhoven.edu' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 2
		AND I.numEd = 19;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='buchin@eindhoven.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Vincent Kusters',
	'kusters@eindhoven.edu',
	'TU Eindhoven',
	'+31(40)247-9111',
	'Dutch',
	'5612 AZ Eindhoven, Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kusters@eindhoven.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kusters@eindhoven.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='speckmann@eindhoven.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Frank Staals',
	'staals@eindhoven.edu',
	'TU Eindhoven',
	'+31(40)247-9111',
	'Dutch',
	'5612 AZ Eindhoven, Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'staals@eindhoven.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='staals@eindhoven.edu';
/
--Artigo Natural Neighbor Interpolation on a 3D Grid using a GPU
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Arnold Boedihardjo',
	'boedihardjo@army.gov',
	'Engineer Research and Development Center',
	'+1(601)636-3111',
	'American',
	'3909 Halls Ferry Road - Vicksburg, MS 39180-6199',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'boedihardjo@army.gov'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Natural Neighbor Interpolation on a 3D Grid using a GPU',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'boedihardjo@army.gov' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='boedihardjo@army.gov';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shine@army.gov';
/
--Artigo Semantic Trajectory Mining for Next Location Prediction
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jia-Ching Ying',
	'ying@cku.edu',
	'National Cheng Kung University',
	'+886(6)275-7575',
	'Taiwan',
	'701, Taiwan, Tainan City, East District',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ying@cku.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Semantic Trajectory Mining for Next Location Prediction',
	TO_DATE('4/11/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('4/11/2011, 10:0:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'ying@cku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ying@cku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Tz-Chiao Weng',
	'weng@cku.edu',
	'National Cheng Kung University',
	'+886(6)275-7575',
	'Taiwan',
	'701, Taiwan, Tainan City, East District',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'weng@cku.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='weng@cku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Vincent Tseng',
	'tseng@cku.edu',
	'National Cheng Kung University',
	'+886(6)275-7575',
	'Taiwan',
	'701, Taiwan, Tainan City, East District',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	19,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tseng@cku.edu'),
	TO_DATE('21/9/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tseng@cku.edu';
/
/
/
/
/
/
-- sigspatial evento 02 edicao 20
/
--Artigo Robust Traffic Merging Strategies for Sensor-Enabled Cars Using Time Geography
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ziyuan Wang',
	'wang@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wang@unimelb.edu.au'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Robust Traffic Merging Strategies for Sensor-Enabled Cars Using Time Geography',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'wang@unimelb.edu.au' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wang@unimelb.edu.au';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kulik@unimelb.edu.au';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kotagiri Ramamohanarao',
	'ramamohanarao@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ramamohanarao@unimelb.edu.au'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ramamohanarao@unimelb.edu.au';
/
--Artigo On-Line Discovery of Flock Patterns in Spatio-Temporal Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Marcos Vieira',
	'vieira@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'vieira@uc.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'On-Line Discovery of Flock Patterns in Spatio-Temporal Data',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'vieira@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='vieira@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Vassilis Tsotras',
	'tsotras@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tsotras@uc.edu';
/
--Artigo Hidden Markov Map Matching Through Noise and Gaps
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Paul Newson',
	'newson@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'newson@microsoft.com'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Hidden Markov Map Matching Through Noise and Gaps',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'newson@microsoft.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='newson@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'John Krumm',
	'krumm@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'krumm@microsoft.com'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='krumm@microsoft.com';
/
--Artigo From GPS Traces to a Routable Road Map
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Lili Cao',
	'cao@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cao@uc.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'From GPS Traces to a Routable Road Map',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'cao@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='cao@uc.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='krumm@microsoft.com';
/
--Artigo Going Off-road: Transversal Complexity in Road Networks
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'eppstein@uc.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Going Off-road: Transversal Complexity in Road Networks',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'eppstein@uc.edu' 
    AND I.idPart = P.idPe
    AND P.tipoParticipante = '1'
    AND I.codEv = 2
    AND I.numEd = 20;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='eppstein@uc.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'goodrich@uc.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='goodrich@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Lowell Trott',
	'trott@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'trott@uc.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='trott@uc.edu';
/
--Artigo Finding Long and Similar Parts of Trajectories
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'buchin@eindhoven.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Finding Long and Similar Parts of Trajectories',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'buchin@eindhoven.edu' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 2
		AND I.numEd = 20;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='buchin@eindhoven.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'buchin@uu.nl'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='buchin@uu.nl';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kreveld@uu.nl'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kreveld@uu.nl';
/
--Artigo Efficient Viewpoint Assignment for Urban Texture Documentation
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Houtan Shirani-Mehr',
	'shirani-mehr@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shirani-mehr@usc.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Efficient Viewpoint Assignment for Urban Texture Documentation',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'shirani-mehr@usc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shirani-mehr@usc.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='banaei-kashani@usc.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shahabi@usc.edu';
/
--Artigo Contextual Encoding of Geospatial Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Pragyana Mishra',
	'mishra@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mishra@microsoft.com'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Contextual Encoding of Geospatial Data',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'mishra@microsoft.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mishra@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Nagendra Kolluru',
	'kolluru@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kolluru@microsoft.com';
/
--Artigo Classification of Raster Maps for Automatic Feature Extraction
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yao-Yi Chiang',
	'chiang@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chiang@usc.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Classification of Raster Maps for Automatic Feature Extraction',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'chiang@usc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chiang@usc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Craig Knoblock',
	'knoblock@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'knoblock@usc.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='knoblock@usc.edu';
/
--Artigo Assessing The Trustworthiness of Location Data Based on Provenance
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dai@umb.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Assessing The Trustworthiness of Location Data Based on Provenance',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'dai@umb.edu' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 2
		AND I.numEd = 20;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dai@umb.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hyo-Sang Lim',
	'lim@umb.edu',
	'Purdue University',
	'+1(617)287-6479',
	'American',
	'West Lafayette, IN 47907, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lim@umb.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'bertino@umb.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bertino@umb.edu';
/
--Artigo Annotating Geospatial Data Based on its Semantics
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Carla Macário',
	'macário@unicamp.com.br',
	'UNICAMP',
	'+55(11)3322-0606',
	'Brazilian',
	'Barão Geraldo, Campinas - SP, 13083-970',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'macário@unicamp.com.br'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Annotating Geospatial Data Based on its Semantics',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'macário@unicamp.com.br' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='macário@unicamp.com.br';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sidney Sousa',
	'sousa@unicamp.com.br',
	'UNICAMP',
	'+55(11)3322-0606',
	'Brazilian',
	'Barão Geraldo, Campinas - SP, 13083-970',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sousa@unicamp.com.br'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sousa@unicamp.com.br';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Claudia Bauzer Medeiros',
	'medeiros@unicamp.com.br',
	'UNICAMP',
	'+55(11)3322-0606',
	'Brazilian',
	'Barão Geraldo, Campinas - SP, 13083-970',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'medeiros@unicamp.com.br'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='medeiros@unicamp.com.br';
/
--Artigo TwitterStand: News in Twitter
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sankaranarayanan@umaryland.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'TwitterStand: News in Twitter',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'sankaranarayanan@umaryland.edu' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 2
		AND I.numEd = 20;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sankaranarayanan@umaryland.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'samet@umaryland.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='samet@umaryland.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Benjamin Teitler',
	'teitler@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'teitler@umaryland.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='teitler@umaryland.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lieberman@umaryland.edu';
/
--Artigo Assessing the Predictability of Scheduled-Vehicle Travel Times
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Dalia Tiesyte',
	'tiesyte@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tiesyte@cs.aau.dk'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Assessing the Predictability of Scheduled-Vehicle Travel Times',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'tiesyte@cs.aau.dk' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tiesyte@cs.aau.dk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Christian Jensen',
	'jensen@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jensen@cs.aau.dk'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jensen@cs.aau.dk';
/
--Artigo Efficient and Secure Distribution of Massive Geo-Spatial Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hao Yuan',
	'yuan@umb.edu',
	'Purdue University',
	'+1(617)287-6479',
	'American',
	'West Lafayette, IN 47907, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yuan@umb.edu'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Efficient and Secure Distribution of Massive Geo-Spatial Data',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'yuan@umb.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yuan@umb.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mikhail Atallah',
	'atallah@umb.edu',
	'Purdue University',
	'+1(617)287-6479',
	'American',
	'West Lafayette, IN 47907, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='atallah@umb.edu';
/
--Artigo Mining Correlation between Locations Using Human Location History
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yu Zheng',
	'zheng@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zheng@microsoft.com'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Mining Correlation between Locations Using Human Location History',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'zheng@microsoft.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zheng@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xing Xie',
	'xie@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xie@microsoft.com'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='xie@microsoft.com';
/
--Artigo Trees or Grids? Indexing Moving Objects in Main Memory
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Darius Sidlauskas',
	'sidlauskas@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sidlauskas@cs.aau.dk'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Trees or Grids? Indexing Moving Objects in Main Memory',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'sidlauskas@cs.aau.dk' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sidlauskas@cs.aau.dk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Simonas Saltenis',
	'saltenis@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'saltenis@cs.aau.dk'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='saltenis@cs.aau.dk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Christian Winther Christiansen',
	'christiansen@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'christiansen@cs.aau.dk'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='christiansen@cs.aau.dk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jan Maffert Johansen',
	'johansen@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'johansen@cs.aau.dk'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='johansen@cs.aau.dk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Donatas Saulys',
	'saulys@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'saulys@cs.aau.dk'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='saulys@cs.aau.dk';
/
--Artigo Opportunistic Sampling in Wireless Sensor Networks
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Muhammad Umer',
	'umer@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'umer@unimelb.edu.au'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Opportunistic Sampling in Wireless Sensor Networks',
	TO_DATE('7/11/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2012, 13:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'umer@unimelb.edu.au' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='umer@unimelb.edu.au';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tanin@unimelb.edu.au';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	20,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kulik@unimelb.edu.au'),
	TO_DATE('14/9/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kulik@unimelb.edu.au';
/
/
/
/
/
/
/
-- sigspatial evento 02 edicao 21
/
/
--Artigo Improving Passage Ranking with User Behavior Information
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Weize Kong',
	'kong@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kong@umassp.edu'),
	TO_DATE('10/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Improving Passage Ranking with User Behavior Information',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'kong@umassp.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kong@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Elif Aktolga',
	'aktolga@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'aktolga@umassp.edu'),
	TO_DATE('10/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='aktolga@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'James Allan',
	'allan@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'allan@umassp.edu'),
	TO_DATE('10/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='allan@umassp.edu';
/
--Artigo Discovering and Managing Quantitative Association Rules
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Chunyao Song',
	'song@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'song@umassp.edu'),
	TO_DATE('10/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Discovering and Managing Quantitative Association Rules',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'song@umassp.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='song@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Tingjian Ge',
	'ge@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ge@umassp.edu'),
	TO_DATE('10/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ge@umassp.edu';
/
--Artigo Query Execution Timing: Taming Real-time Anytime Queries on Multicore Processors
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Query Execution Timing: Taming Real-time Anytime Queries on Multicore Processors',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'song@umassp.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='song@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Zheng Li',
	'li@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'li@umassp.edu'),
	TO_DATE('10/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='li@umassp.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ge@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jie Wang',
	'wang@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wang@umassp.edu'),
	TO_DATE('10/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wang@umassp.edu';
/
--Artigo Evaluating Eco-Driving Advice Using GPS/CANBus Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Karsten Jakobsen',
	'jakobsen@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jakobsen@cs.aau.dk'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Evaluating Eco-Driving Advice Using GPS/CANBus Data',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'jakobsen@cs.aau.dk' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jakobsen@cs.aau.dk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sabrine C. H. Mouritsen',
	'mouritsen@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mouritsen@cs.aau.dk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kristian Torp',
	'torp@cs.aau.dk',
	'Aalborg University',
	'+45(99)40-9940',
	'Danish',
	'Selma Lagerlöfs Vej 300, DK-9220 Aalborg, Denmark',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'torp@cs.aau.dk'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='torp@cs.aau.dk';
/
--Artigo Energy-Optimal Routes for Electric Vehicles
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Moritz Baum',
	'baum@kit.edu',
	'Karlsruhe Institute of Technology, IPD',
	'+49(721)608-44316',
	'German',
	'76131 Karlsruhe, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'baum@kit.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Energy-Optimal Routes for Electric Vehicles',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'baum@kit.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='baum@kit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Julian Dibbelt',
	'dibbelt@kit.edu',
	'Karlsruhe Institute of Technology, IPD',
	'+49(721)608-44316',
	'German',
	'76131 Karlsruhe, Germany',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dibbelt@kit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Thomas Pajor',
	'pajor@kit.edu',
	'Karlsruhe Institute of Technology, IPD',
	'+49(721)608-44316',
	'German',
	'76131 Karlsruhe, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'pajor@kit.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='pajor@kit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Dorothea Wagner',
	'wagner@kit.edu',
	'Karlsruhe Institute of Technology, IPD',
	'+49(721)608-44316',
	'German',
	'76131 Karlsruhe, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wagner@kit.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wagner@kit.edu';
/
--Artigo Efficient Batch Processing of Proximity Queries by Optimized Probing
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Seyed Jalal Kazemitabar',
	'kazemitabar@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kazemitabar@usc.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Efficient Batch Processing of Proximity Queries by Optimized Probing',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'kazemitabar@usc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kazemitabar@usc.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='banaei-kashani@usc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Dennis McLeod',
	'mcleod@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mcleod@usc.edu';
/
--Artigo Spatiotemporal Braitenberg Vehicles
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Alan Both',
	'both@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'both@unimelb.edu.au'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Spatiotemporal Braitenberg Vehicles',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'both@unimelb.edu.au' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='both@unimelb.edu.au';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Matt Duckham',
	'duckham@unimelb.edu.au',
	'University of Melbourne',
	'+61(3)9035-5511',
	'Australian',
	'Parkville VIC 3010, Australia',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'duckham@unimelb.edu.au'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='duckham@unimelb.edu.au';
/
--Artigo Algorithms for Hotspot Computation on Trajectory Data
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kreveld@uu.nl'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Algorithms for Hotspot Computation on Trajectory Data',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'kreveld@uu.nl' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 2
		AND I.numEd = 21;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kreveld@uu.nl';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Frank Staals',
	'staals@uu.nl',
	'Utrecht University',
	'Dutch',
	'+31(30)253-3550',
	'3508 TC Utrecht, The Netherlands',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'staals@uu.nl'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='staals@uu.nl';
/
--Artigo SAC: Semantic Adaptive Caching for Spatial Mobile Applications
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Chang Liu',
	'liu@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'liu@umaryland.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'SAC: Semantic Adaptive Caching for Spatial Mobile Applications',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'liu@umaryland.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='liu@umaryland.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Brendan Fruin',
	'fruin@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='fruin@umaryland.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'samet@umaryland.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='samet@umaryland.edu';
/
--Artigo GeoRank: An Efficient LocationAware News Feed Ranking System
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jie Bao',
	'bao@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'bao@uminnesota.com'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'GeoRank: An Efficient LocationAware News Feed Ranking System',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'bao@uminnesota.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bao@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mohamed Mokbel',
	'mokbel@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mokbel@uminnesota.com'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mokbel@uminnesota.com';
/
--Artigo A GeoSpatial Scientometrics Framework for Measuring the Citation Impact of Publications and Scientists
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Song Gao',
	'gao@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'gao@uc.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A GeoSpatial Scientometrics Framework for Measuring the Citation Impact of Publications and Scientists',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'gao@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='gao@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yingjie Hu',
	'hu@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='hu@uc.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='janowicz@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Grant Mckenzie',
	'mckenzie@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mckenzie@uc.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mckenzie@uc.edu';
/
--Artigo CG_Hadoop: Computational Geometry in MapReduce
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ahmed Eldawy',
	'eldawy@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'eldawy@uminnesota.com'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'CG_Hadoop: Computational Geometry in MapReduce',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'eldawy@uminnesota.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='eldawy@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yuan Li',
	'li@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='li@uminnesota.com';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mokbel@uminnesota.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ravi Janardan',
	'janardan@uminnesota.com',
	'University of Minnesota',
	'+1(612)625-5000',
	'American',
	'Minneapolis, MN 55455, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'janardan@uminnesota.com'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='janardan@uminnesota.com';
/
--Artigo Maximizing the Number of Workers Self-Selected Tasks in Spatial Crowdsourcing
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Dingxiong Deng',
	'deng@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'deng@usc.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Maximizing the Number of Workers Self-Selected Tasks in Spatial Crowdsourcing',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'deng@usc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='deng@usc.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shahabi@usc.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shahabi@usc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ugur Demiryurek',
	'demiryurek@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='demiryurek@usc.edu';
/
--Artigo Crowd Sensing of Traffic Anomalies based on Human Mobility and Social Media
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Bei Pan',
	'pan@usc.edu',
	'USC',
	'+1(213)740-2311',
	'American',
	'Los Angeles, CA 90089',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'pan@usc.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Crowd Sensing of Traffic Anomalies based on Human Mobility and Social Media',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'pan@usc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='pan@usc.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zheng@microsoft.com'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zheng@microsoft.com';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shahabi@usc.edu';
/
--Artigo Output-Sensitive Well-Separated Pair Decompositions for Dynamic Point Sets
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Eunhui Park',
	'park@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'park@umaryland.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Output-Sensitive Well-Separated Pair Decompositions for Dynamic Point Sets',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'park@umaryland.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='park@umaryland.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'David Mount',
	'mount@umaryland.edu',
	'University of Maryland',
	'+1(301)405-1000',
	'American',
	'College Park, MD 20742, United States',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mount@umaryland.edu';
/
--Artigo A Probablistic Model for Spatio-Temporal Signal Extraction from Social Media
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Christian Sengstock',
	'sengstock@hu.edu',
	'Heidelberg University',
	'+49(6)221-540',
	'German',
	'Grabengasse 1, 69117 Heidelberg, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sengstock@hu.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A Probablistic Model for Spatio-Temporal Signal Extraction from Social Media',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'sengstock@hu.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sengstock@hu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Michael Gertz',
	'gertz@hu.edu',
	'Heidelberg University',
	'+49(6)221-540',
	'German',
	'Grabengasse 1, 69117 Heidelberg, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'gertz@hu.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='gertz@hu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Florian Flatow',
	'flatow@hu.edu',
	'Heidelberg University',
	'+49(6)221-540',
	'German',
	'Grabengasse 1, 69117 Heidelberg, Germany',
	'0',
	'0',
	'1'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='flatow@hu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hamed Abdelhaq',
	'abdelhaq@hu.edu',
	'Heidelberg University',
	'+49(6)221-540',
	'German',
	'Grabengasse 1, 69117 Heidelberg, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'abdelhaq@hu.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='abdelhaq@hu.edu';
/
--Artigo Spatio-Temporal Characteristics of Bursty Words in Twitter Streams
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Spatio-Temporal Characteristics of Bursty Words in Twitter Streams',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'abdelhaq@hu.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='abdelhaq@hu.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='gertz@hu.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sengstock@hu.edu';
/
--Artigo Parameterized Algorithms for Generalized Traveling Salesman Problems in Road Networks
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Michael Rice',
	'rice@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	2,
	21,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'rice@uc.edu'),
	TO_DATE('4/10/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Parameterized Algorithms for Generalized Traveling Salesman Problems in Road Networks',
	TO_DATE('7/11/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('7/11/2013, 9:15:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'rice@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='rice@uc.edu';
/
/
/
/
/
/
/
/
/

--VLDB 2011
--Artigo Distributed Threshold Querying of General Functions by a Difference of Monotonic Representation
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Guy Sagy',
	'sagy@technion.ac.il',
	'Technion',
	'+972(482)92111',
	'Israeli',
	'Haifa, Israel',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sagy@technion.ac.il'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Distributed Threshold Querying of General Functions by a Difference of Monotonic Representation',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'sagy@technion.ac.il' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sagy@technion.ac.il';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Izchak Sharfman',
	'sharfman@technion.ac.il',
	'Technion',
	'+972(482)92111',
	'Israeli',
	'Haifa, Israel',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sharfman@technion.ac.il'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sharfman@technion.ac.il';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Assaf Schuster',
	'schuster@technion.ac.il',
	'Technion',
	'+972(482)92111',
	'Israeli',
	'Haifa, Israel',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'schuster@technion.ac.il'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='schuster@technion.ac.il';
/
--Artigo Distributed Inference and Query Processing for RFID Tracking and Monitoring
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Zhao Cao',
	'cao@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cao@umassp.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Distributed Inference and Query Processing for RFID Tracking and Monitoring',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'cao@umassp.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='cao@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yanlei Diao',
	'diao@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'diao@umassp.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='diao@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Prashant Shenoy',
	'shenoy@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shenoy@umassp.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shenoy@umassp.edu';
/
--Artigo Where in the World is My Data?
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sudarshan Kadambi',
	'kadambi@bloomberg.com',
	'Bloomberg',
	'+413(545)0111-0001',
	'American',
	'Stanford, California 94305',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kadambi@bloomberg.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Where in the World is My Data?',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'kadambi@bloomberg.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kadambi@bloomberg.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Brian Cooper',
	'cooper@gmail.com',
	'Google',
	'+1(650)253-0000',
	'American',
	'Menlo Park, CA, United States of America',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cooper@gmail.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='cooper@gmail.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hector Garcia-Molina',
	'garcia-molina@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'garcia-molina@stanford.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='garcia-molina@stanford.edu';
/
--Artigo Output URL Bidding
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Panagiotis Papadimitriou',
	'papadimitriou@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'papadimitriou@stanford.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Output URL Bidding',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'papadimitriou@stanford.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='papadimitriou@stanford.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='garcia-molina@stanford.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ali Dasdan',
	'dasdan@ebay.com',
	'Ebay',
	'+111(111)1111-1111',
	'United States',
	'Campbell, California, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dasdan@ebay.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dasdan@ebay.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Santanu Kolay',
	'kolay@ebay.com',
	'Ebay',
	'+111(111)1111-1111',
	'United States',
	'Campbell, California, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kolay@ebay.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kolay@ebay.com';
/
--Artigo Automatic Wrappers for Large Scale Web Extraction
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Nilesh Dalvi',
	'dalvi@yahoo.com',
	'Yahoo!',
	'+413(545)0111-0458',
	'American',
	'Sunnyvale, CA, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dalvi@yahoo.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Automatic Wrappers for Large Scale Web Extraction',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'dalvi@yahoo.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dalvi@yahoo.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ravi Kumar',
	'kumar@yahoo.com',
	'Yahoo!',
	'+413(545)0111-0458',
	'American',
	'Sunnyvale, CA, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kumar@yahoo.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kumar@yahoo.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mohamed Soliman',
	'soliman@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'soliman@uwaterloo.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='soliman@uwaterloo.edu';
/
--Artigo Recovering Semantics of Tables on the Web
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Petros Venetis',
	'venetis@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'venetis@stanford.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Recovering Semantics of Tables on the Web',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'venetis@stanford.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='venetis@stanford.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Alon Halevy',
	'halevy@gmail.com',
	'Google',
	'+1(650)253-0000',
	'American',
	'Menlo Park, CA, United States of America',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'halevy@gmail.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='halevy@gmail.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jayant Madhavan',
	'madhavan@gmail.com',
	'Google',
	'+1(650)253-0000',
	'American',
	'Menlo Park, CA, United States of America',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'madhavan@gmail.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='madhavan@gmail.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Marius Pasca',
	'pasca@gmail.com',
	'Google',
	'+1(650)253-0000',
	'American',
	'Menlo Park, CA, United States of America',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'pasca@gmail.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='pasca@gmail.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Gengxin Miao',
	'miao@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'miao@uc.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='miao@uc.edu';
/
--Artigo Graph Indexing of Road Networks for Shortest Path Queries with Label Restrictions
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'rice@uc.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Graph Indexing of Road Networks for Shortest Path Queries with Label Restrictions',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'rice@uc.edu' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 1
		AND I.numEd = 37;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='rice@uc.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tsotras@uc.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tsotras@uc.edu';
/
--Artigo Efficient Processing of Top-k Spatial Preference Queries
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'João Rocha-Junior',
	'rocha-junior@ntnu.edu',
	'NTNU',
	'+407(805)0893-1452',
	'Norwegian',
	'Høgskoleringen 1, 7491 Trondheim, Norway',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'rocha-junior@ntnu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Efficient Processing of Top-k Spatial Preference Queries',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'rocha-junior@ntnu.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='rocha-junior@ntnu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Akrivi Vlachou',
	'vlachou@ntnu.edu',
	'NTNU',
	'+407(805)0893-1452',
	'Norwegian',
	'Høgskoleringen 1, 7491 Trondheim, Norway',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'vlachou@ntnu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='vlachou@ntnu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Christos Doulkeridis',
	'doulkeridis@ntnu.edu',
	'NTNU',
	'+407(805)0893-1452',
	'Norwegian',
	'Høgskoleringen 1, 7491 Trondheim, Norway',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'doulkeridis@ntnu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='doulkeridis@ntnu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kjetil Norvag',
	'norvag@ntnu.edu',
	'NTNU',
	'+407(805)0893-1452',
	'Norwegian',
	'Høgskoleringen 1, 7491 Trondheim, Norway',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'norvag@ntnu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='norvag@ntnu.edu';
/
--Artigo SXPath - Extending XPath towards Spatial Querying on Web Documents
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ermelinda Oro',
	'oro@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'oro@umassp.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'SXPath - Extending XPath towards Spatial Querying on Web Documents',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'oro@umassp.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='oro@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Massimo Ruffolo',
	'ruffolo@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ruffolo@umassp.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ruffolo@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Steffen Staab',
	'staab@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'staab@umassp.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='staab@umassp.edu';
/
--Artigo Efficient Algorithms for Finding Optimal Meeting Point on Road Networks
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Da Yan',
	'yan@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yan@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Efficient Algorithms for Finding Optimal Meeting Point on Road Networks',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'yan@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yan@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Zhou Zhao',
	'zhao@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zhao@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zhao@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Wilfred Ng',
	'ng@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ng@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ng@hku.edu';
/
--Artigo A Generic Framework for Handling Uncertain Data with Local Correlations
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xiang Lian',
	'lian@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lian@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A Generic Framework for Handling Uncertain Data with Local Correlations',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'lian@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lian@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Lei Chen',
	'chen@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chen@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chen@hku.edu';
/
--Artigo Efficient Probabilistic Reverse Nearest Neighbor Query Processing on Uncertain Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Thomas Bernecker',
	'bernecker@lmu.edu',
	'Ludwig-Maximilians-University',
	'+490(898)2180-2326',
	'German',
	'Professor-Huber-Platz 2, 80539 München, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'bernecker@lmu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Efficient Probabilistic Reverse Nearest Neighbor Query Processing on Uncertain Data',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'bernecker@lmu.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bernecker@lmu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Tobias Emrich',
	'emrich@lmu.edu',
	'Ludwig-Maximilians-University',
	'+490(898)2180-2326',
	'German',
	'Professor-Huber-Platz 2, 80539 München, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'emrich@lmu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='emrich@lmu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hans-Peter Kriegel',
	'kriegel@lmu.edu',
	'Ludwig-Maximilians-University',
	'+490(898)2180-2326',
	'German',
	'Professor-Huber-Platz 2, 80539 München, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kriegel@lmu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kriegel@lmu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Matthias Renz',
	'renz@lmu.edu',
	'Ludwig-Maximilians-University',
	'+490(898)2180-2326',
	'German',
	'Professor-Huber-Platz 2, 80539 München, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'renz@lmu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='renz@lmu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Stefan Zankl',
	'zankl@lmu.edu',
	'Ludwig-Maximilians-University',
	'+490(898)2180-2326',
	'German',
	'Professor-Huber-Platz 2, 80539 München, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zankl@lmu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zankl@lmu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Andreas Züfle',
	'züfle@lmu.edu',
	'Ludwig-Maximilians-University',
	'+490(898)2180-2326',
	'German',
	'Professor-Huber-Platz 2, 80539 München, Germany',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'züfle@lmu.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='züfle@lmu.edu';
/
--Artigo Queries with Difference on Probabilistic Databases
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sanjeev Khanna',
	'khanna@upenn.edu',
	'University of Pennsylvania',
	'+234(898)1232-4532',
	'American',
	'Philadelphia, PA 19104, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'khanna@upenn.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Queries with Difference on Probabilistic Databases',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'khanna@upenn.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='khanna@upenn.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sudeepa Roy',
	'roy@upenn.edu',
	'University of Pennsylvania',
	'+234(898)1232-4532',
	'American',
	'Philadelphia, PA 19104, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'roy@upenn.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='roy@upenn.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Val Tannen',
	'tannen@upenn.edu',
	'University of Pennsylvania',
	'+234(898)1232-4532',
	'American',
	'Philadelphia, PA 19104, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tannen@upenn.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tannen@upenn.edu';
/
--Artigo Optimizing Probabilistic Query Processing on Continuous Uncertain Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Liping Peng',
	'peng@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'peng@umassp.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Optimizing Probabilistic Query Processing on Continuous Uncertain Data',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'peng@umassp.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='peng@umassp.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='diao@umassp.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Anna Liu',
	'liu@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'liu@umassp.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='liu@umassp.edu';
/
--Artigo On Triangulation-based Dense Neighborhood Graph Discovery
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Nan Wang',
	'wang@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wang@nus.edu.sg'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'On Triangulation-based Dense Neighborhood Graph Discovery',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 16:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'wang@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wang@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jingbo Zhang',
	'zhang@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zhang@nus.edu.sg'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zhang@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kian-Lee Tan',
	'tan@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tan@nus.edu.sg'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tan@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Anthony Tung',
	'tung@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tung@nus.edu.sg'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tung@nus.edu.sg';
/
--Artigo Human-Assisted Graph Search: It is Okay to Ask Questions
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Aditya Parameswaran',
	'parameswaran@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'parameswaran@stanford.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Human-Assisted Graph Search: It is Okay to Ask Questions',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 16:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'parameswaran@stanford.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='parameswaran@stanford.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Anish Das Sarma',
	'sarma@yahoo.com',
	'Yahoo!',
	'+413(545)0111-0458',
	'American',
	'Sunnyvale, CA, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sarma@yahoo.com'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sarma@yahoo.com';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='garcia-molina@stanford.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Neoklis Polyzotis',
	'polyzotis@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'polyzotis@uc.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='polyzotis@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jennifer Widom',
	'widom@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'widom@stanford.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='widom@stanford.edu';
/
--Artigo On Querying Historical Evolving Graph Sequences
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Chenghui Ren',
	'ren@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ren@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'On Querying Historical Evolving Graph Sequences',
	TO_DATE('30/08/2011', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2011, 16:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'ren@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ren@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Eric Lo',
	'lo@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lo@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lo@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ben Kao',
	'kao@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kao@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kao@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xinjie Zhu',
	'zhu@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zhu@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zhu@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Reynold Cheng',
	'cheng@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	37,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cheng@hku.edu'),
	TO_DATE('27/07/2011', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='cheng@hku.edu';
/
/
/
/
/
--VLDB 2012
--Artigo Aggregation in Probabilistic Databases via Knowledge Compilation
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Robert Fink',
	'fink@ox.ac.uk',
	'University of Oxford',
	'+440(186)5270-0000',
	'American',
	'University Offices, Wellington Square, Oxford OX1 2JD, United Kingdom',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'fink@ox.ac.uk'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Aggregation in Probabilistic Databases via Knowledge Compilation',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'fink@ox.ac.uk' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='fink@ox.ac.uk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Larisa Han',
	'han@ox.ac.uk',
	'University of Oxford',
	'+440(186)5270-0000',
	'American',
	'University Offices, Wellington Square, Oxford OX1 2JD, United Kingdom',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'han@ox.ac.uk'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='han@ox.ac.uk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Dan Olteanu',
	'olteanu@ox.ac.uk',
	'University of Oxford',
	'+440(186)5270-0000',
	'American',
	'University Offices, Wellington Square, Oxford OX1 2JD, United Kingdom',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'olteanu@ox.ac.uk'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='olteanu@ox.ac.uk';
/
--Artigo FDB: A Query Engine for Factorised Relational Databases
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Nurzhan Bakibayev',
	'bakibayev@ox.ac.uk',
	'University of Oxford',
	'+440(186)5270-0000',
	'American',
	'University Offices, Wellington Square, Oxford OX1 2JD, United Kingdom',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'bakibayev@ox.ac.uk'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'FDB: A Query Engine for Factorised Relational Databases',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'bakibayev@ox.ac.uk' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bakibayev@ox.ac.uk';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='olteanu@ox.ac.uk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jakub Závodný',
	'závodný@ox.ac.uk',
	'University of Oxford',
	'+440(186)5270-0000',
	'American',
	'University Offices, Wellington Square, Oxford OX1 2JD, United Kingdom',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'závodný@ox.ac.uk'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='závodný@ox.ac.uk';
/
--Artigo Automatic Partitioning of Database Applications
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Alvin Cheung',
	'cheung@mit.edu',
	'MIT',
	'+100(617)0253-1000',
	'American',
	'77 Massachusetts Ave, Cambridge, MA 02139, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cheung@mit.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Automatic Partitioning of Database Applications',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'cheung@mit.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='cheung@mit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Owen Arden',
	'arden@cornell.edu',
	'Cornell University',
	'+1(607)254-4636',
	'American',
	'Ithaca, NY 14850, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'arden@cornell.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='arden@cornell.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Samuel Madden',
	'madden@mit.edu',
	'MIT',
	'+100(617)0253-1000',
	'American',
	'77 Massachusetts Ave, Cambridge, MA 02139, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'madden@mit.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='madden@mit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Andrew C. Myers',
	'myers@cornell.edu',
	'Cornell University',
	'+1(607)254-4636',
	'American',
	'Ithaca, NY 14850, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'myers@cornell.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='myers@cornell.edu';
/
--Artigo Scalable K-Means++
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Bahman Bahmani',
	'bahmani@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'bahmani@stanford.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Scalable K-Means++',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'bahmani@stanford.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bahmani@stanford.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Andrea Vattani',
	'vattani@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'vattani@uc.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='vattani@uc.edu';
/
--Inscrito obs.:Ravi Kumar se inscreveu na ed 2011, logo ja esta em pessoa
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kumar@yahoo.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kumar@yahoo.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sergei Vassilvitskii',
	'vassilvitskii@yahoo.com',
	'Yahoo!',
	'+413(545)0111-0458',
	'American',
	'Sunnyvale, CA, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'vassilvitskii@yahoo.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='vassilvitskii@yahoo.com';
/
--Artigo Answering Top-k Queries Over a Mixture of Attractive and Repulsive Dimensions
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sayan Ranu',
	'ranu@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ranu@uc.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Answering Top-k Queries Over a Mixture of Attractive and Repulsive Dimensions',
	TO_DATE('29/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('29/08/2012, 16:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'ranu@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ranu@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ambuj K. Singh',
	'singh@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'singh@uc.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='singh@uc.edu';
/
--Artigo Bayesian Locality Sensitive Hashing for Fast Similarity Search
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Venu Satuluri',
	'satuluri@osu.edu',
	'The Ohio State University',
	'+413(545)0111-4725',
	'American',
	'Columbus, OH 43210, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'satuluri@osu.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Bayesian Locality Sensitive Hashing for Fast Similarity Search',
	TO_DATE('29/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('29/08/2012, 16:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'satuluri@osu.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='satuluri@osu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Srinivasan Parthasarathy',
	'parthasarathy@osu.edu',
	'The Ohio State University',
	'+413(545)0111-4725',
	'American',
	'Columbus, OH 43210, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'parthasarathy@osu.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='parthasarathy@osu.edu';
/
--Artigo Ranking Large Temporal Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jeffrey Jestes',
	'jestes@utah.edu',
	'University of Utah',
	'+1(801)581-7200',
	'American',
	'201 Presidents Cir, Salt Lake City, UT 84112, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jestes@utah.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Ranking Large Temporal Data',
	TO_DATE('29/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('29/08/2012, 16:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'jestes@utah.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jestes@utah.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jeff M. Phillips',
	'phillips@utah.edu',
	'University of Utah',
	'+1(801)581-7200',
	'American',
	'201 Presidents Cir, Salt Lake City, UT 84112, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'phillips@utah.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='phillips@utah.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Feifei Li',
	'li@utah.edu',
	'University of Utah',
	'+1(801)581-7200',
	'American',
	'201 Presidents Cir, Salt Lake City, UT 84112, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'li@utah.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='li@utah.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mingwang Tang',
	'tang@utah.edu',
	'University of Utah',
	'+1(801)581-7200',
	'American',
	'201 Presidents Cir, Salt Lake City, UT 84112, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tang@utah.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tang@utah.edu';
/
--Artigo Learning Semantic String Transformations from Examples
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Rishabh Singh',
	'singh@mit.edu',
	'MIT',
	'+100(617)0253-1000',
	'American',
	'77 Massachusetts Ave, Cambridge, MA 02139, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'singh@mit.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Learning Semantic String Transformations from Examples',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 11:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'singh@mit.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='singh@mit.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sumit Gulwani',
	'gulwani@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'gulwani@microsoft.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='gulwani@microsoft.com';
/
--Artigo Efficient Processing of k Nearest Neighbor Joins using MapReduce
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Wei Lu',
	'lu@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lu@nus.edu.sg'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Efficient Processing of k Nearest Neighbor Joins using MapReduce',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 11:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'lu@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lu@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yanyan Shen',
	'shen@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shen@nus.edu.sg'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shen@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Su Chen',
	'chen@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chen@nus.edu.sg'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chen@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Beng Chin Ooi',
	'ooi@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ooi@nus.edu.sg'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ooi@nus.edu.sg';
/
--Artigo Multilingual Schema Matching for Wikipedia Infoboxes
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Thanh Nguyen',
	'nguyen@utah.edu',
	'University of Utah',
	'+1(801)581-7200',
	'American',
	'201 Presidents Cir, Salt Lake City, UT 84112, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'nguyen@utah.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Multilingual Schema Matching for Wikipedia Infoboxes',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 11:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'nguyen@utah.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='nguyen@utah.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Viviane Moreira',
	'moreira@ufrgs.br',
	'Universidade Federal do Rio Grande do Sul',
	'+55(513)308-6000',
	'Brasilian',
	'Avenida Paulo Gama, 110 - Farropilhas, Porto Alegre - RS, 90040-060',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'moreira@ufrgs.br'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='moreira@ufrgs.br';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Huong Nguyen',
	'guyen@utah.edu',
	'University of Utah',
	'+1(801)581-7200',
	'American',
	'201 Presidents Cir, Salt Lake City, UT 84112, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'guyen@utah.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='guyen@utah.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hoa Nguyen',
	'hoa@utah.edu',
	'University of Utah',
	'+1(801)581-7200',
	'American',
	'201 Presidents Cir, Salt Lake City, UT 84112, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'hoa@utah.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='hoa@utah.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Juliana Freire',
	'freire@poly.edu',
	'Polytechnic Institute of New York University',
	'+1(718)260-3600',
	'American',
	'6 Metrotech Center, Brooklyn, NY 11201, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'freire@poly.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='freire@poly.edu';
/
--Artigo Optimal Algorithms for Crawling a Hidden Database in the Web
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Cheng Sheng',
	'sheng@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sheng@hku.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Optimal Algorithms for Crawling a Hidden Database in the Web',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 11:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'sheng@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sheng@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Nan Zhang',
	'zhang@gwu.edu',
	'George Washington University',
	'+1(202)994-1000',
	'American',
	'2121 Eye Street, NW Washington, DC 20052',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zhang@gwu.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zhang@gwu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yufei Tao',
	'tao@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tao@hku.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tao@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xin Jin',
	'jin@gwu.edu',
	'George Washington University',
	'+1(202)994-1000',
	'American',
	'2121 Eye Street, NW Washington, DC 20052',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jin@gwu.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jin@gwu.edu';
/
--Artigo REX: Recursive, Delta-Based Data-Centric Computation
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Svilen R. Mihaylov',
	'mihaylov@upenn.edu',
	'University of Pennsylvania',
	'+234(898)1232-4532',
	'American',
	'Philadelphia, PA 19104, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mihaylov@upenn.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'REX: Recursive, Delta-Based Data-Centric Computation',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 11:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'mihaylov@upenn.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mihaylov@upenn.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Zachary G. Ives',
	'ives@upenn.edu',
	'University of Pennsylvania',
	'+234(898)1232-4532',
	'American',
	'Philadelphia, PA 19104, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ives@upenn.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ives@upenn.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sudipto Guha',
	'guha@upenn.edu',
	'University of Pennsylvania',
	'+234(898)1232-4532',
	'American',
	'Philadelphia, PA 19104, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'guha@upenn.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='guha@upenn.edu';
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dalvi@yahoo.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'An Analysis of Structured Data on the Web',
	TO_DATE('28/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('28/08/2012, 13:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'dalvi@yahoo.com' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 1
		AND I.numEd = 38;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dalvi@yahoo.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ashwin Machanavajjhala',
	'machanavajjhala@yahoo.com',
	'Yahoo!',
	'+413(545)0111-0458',
	'American',
	'Sunnyvale, CA, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'machanavajjhala@yahoo.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='machanavajjhala@yahoo.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Bo Pang',
	'pang@yahoo.com',
	'Yahoo!',
	'+413(545)0111-0458',
	'American',
	'Sunnyvale, CA, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'pang@yahoo.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='pang@yahoo.com';
/
--Artigo Controlling False Positives in Association Rule Mining
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Guimei Liu',
	'liu@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'liu@nus.edu.sg'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Controlling False Positives in Association Rule Mining',
	TO_DATE('30/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2012, 11:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'liu@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='liu@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Haojun Zhang',
	'haozhang@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'haozhang@nus.edu.sg'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='haozhang@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Limsoon Wong',
	'wong@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wong@nus.edu.sg'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wong@nus.edu.sg';
/
--Artigo Serializable Snapshot Isolation in PostgreSQL
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Dan R. K. Ports',
	'ports@mit.edu',
	'MIT',
	'+100(617)0253-1000',
	'American',
	'77 Massachusetts Ave, Cambridge, MA 02139, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ports@mit.edu'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Serializable Snapshot Isolation in PostgreSQL',
	TO_DATE('28/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('28/08/2012, 16:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'ports@mit.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ports@mit.edu';
/
--Artigo Transaction Log Based Application Error Recovery and Point In-Time Query
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Tomas Talius',
	'talius@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'talius@microsoft.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Transaction Log Based Application Error Recovery and Point In-Time Query',
	TO_DATE('28/08/2012', 'DD/MM/YYYY'),
	TO_TIMESTAMP('28/08/2012, 16:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'talius@microsoft.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='talius@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Robin Dhamankar',
	'dhamankar@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dhamankar@microsoft.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dhamankar@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Andrei Dumitrache',
	'dumitrache@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dumitrache@microsoft.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dumitrache@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hanuma Kodavalla',
	'kodavalla@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	38,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kodavalla@microsoft.com'),
	TO_DATE('27/07/2012', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kodavalla@microsoft.com';
/
--VLDB 2013
--Artigo Revisiting Co-Processing for Hash Joins on the Coupled CPU-GPU Architecture
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jiong HE',
	'he@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'he@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Revisiting Co-Processing for Hash Joins on the Coupled CPU-GPU Architecture',
	TO_DATE('27/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('27/08/2013, 11:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'he@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='he@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mian Lu ASTAR',
	'astar@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'astar@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='astar@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Bingsheng He',
	'bhe@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'bhe@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='bhe@nus.edu.sg';
/
--Artigo Hardware-Oblivious Parallelism for In-Memory Column-Stores
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Max Heimel',
	'heimel@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'heimel@uwaterloo.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Hardware-Oblivious Parallelism for In-Memory Column-Stores',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'heimel@uwaterloo.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='heimel@uwaterloo.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Michael Saecker',
	'saecker@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'saecker@uwaterloo.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='saecker@uwaterloo.edu';
/
--Artigo Improving Flash Write Performance by Using Update Frequency
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Radu Stoica',
	'stoica@bloomberg.com',
	'Bloomberg',
	'+413(545)0111-0001',
	'American',
	'Stanford, California 94305',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'stoica@bloomberg.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Improving Flash Write Performance by Using Update Frequency',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'stoica@bloomberg.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='stoica@bloomberg.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Anastasia Ailamaki',
	'ailamaki@bloomberg.com',
	'Bloomberg',
	'+413(545)0111-0001',
	'American',
	'Stanford, California 94305',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'ailamaki@bloomberg.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='ailamaki@bloomberg.com';
/
--Artigo Hybrid Storage Management for Database Systems
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xin Liu',
	'liu@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'liu@uwaterloo.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Hybrid Storage Management for Database Systems',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'liu@uwaterloo.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='liu@uwaterloo.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kenneth Salem',
	'salem@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'salem@uwaterloo.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='salem@uwaterloo.edu';
/
--Artigo The Yin and Yang of Processing Data Warehousing Queries on GPU Devices
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yuan Yuan',
	'yuan@osu.edu',
	'The Ohio State University',
	'+413(545)0111-4725',
	'American',
	'Columbus, OH 43210, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yuan@osu.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'The Yin and Yang of Processing Data Warehousing Queries on GPU Devices',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'yuan@osu.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yuan@osu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Rubao Lee',
	'lee@osu.edu',
	'The Ohio State University',
	'+413(545)0111-4725',
	'American',
	'Columbus, OH 43210, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lee@osu.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lee@osu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xiaodong Zhang',
	'zhang@osu.edu',
	'The Ohio State University',
	'+413(545)0111-4725',
	'American',
	'Columbus, OH 43210, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zhang@osu.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='zhang@osu.edu';
/
--Artigo A Performance Study of Three Disk-based Structures for Indexing and Querying Frequent Itemsets
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'liu@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A Performance Study of Three Disk-based Structures for Indexing and Querying Frequent Itemsets',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'liu@nus.edu.sg' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 1
		AND I.numEd = 39;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='liu@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Andre Suchitra',
	'suchitra@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'suchitra@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='suchitra@nus.edu.sg';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wong@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wong@nus.edu.sg';
/
--Artigo Computing Immutable Regions for Subspace Top-k Queries
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kyriakos Mouratidis',
	'mouratidis@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mouratidis@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Computing Immutable Regions for Subspace Top-k Queries',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'mouratidis@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mouratidis@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'HweeHwa Pang',
	'pang@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'pang@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='pang@nus.edu.sg';
/
--Artigo A Data-adaptive and Dynamic Segmentation Index for Whole Matching on Time Series
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jian Pei',
	'pei@osu.edu',
	'The Ohio State University',
	'+413(545)0111-4725',
	'American',
	'Columbus, OH 43210, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'pei@osu.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A Data-adaptive and Dynamic Segmentation Index for Whole Matching on Time Series',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'pei@osu.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='pei@osu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Wei Wang',
	'wang@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'German',
	'Rueschlikon, Switzerland',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wang@ibmresearch.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wang@ibmresearch.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Lu Li',
	'li@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'li@nus.edu.sg'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='li@nus.edu.sg';
/
--Artigo LLAMA: A Cache/Storage Subsystem for Modern Hardware
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Justin Levandoski',
	'levandoski@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'levandoski@microsoft.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'LLAMA: A Cache/Storage Subsystem for Modern Hardware',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'levandoski@microsoft.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='levandoski@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'David Lomet',
	'lomet@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lomet@microsoft.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lomet@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Sudipta Sengupta',
	'sengupta@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sengupta@microsoft.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sengupta@microsoft.com';
/
--Artigo DAX: A Widely Distributed Multi-tenant Storage Service for DBMS Hosting
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Rui Liu',
	'rliu@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'rliu@uwaterloo.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'DAX: A Widely Distributed Multi-tenant Storage Service for DBMS Hosting',
	TO_DATE('30/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('30/08/2013, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'rliu@uwaterloo.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='rliu@uwaterloo.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ashraf Aboulnaga',
	'aboulnaga@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'aboulnaga@uwaterloo.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='aboulnaga@uwaterloo.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='salem@uwaterloo.edu';
/
--Artigo Low-latency multi-datacenter databases using replicated commit
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hatem Mahmoud',
	'mahmoud@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mahmoud@uc.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Low-latency multi-datacenter databases using replicated commit',
	TO_DATE('27/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('27/08/2013, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'mahmoud@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mahmoud@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Faisal Nawab',
	'nawab@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'nawab@uc.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='nawab@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Alexander Pucher',
	'pucher@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'pucher@uc.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='pucher@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Divyakant Agrawal',
	'agrawal@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'agrawal@uc.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='agrawal@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Amr El Abbadi',
	'abbadi@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'abbadi@uc.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='abbadi@uc.edu';
/
--Artigo RACE: A Scalable and Elastic Parallel System for Discovering Repeats in Very Long Sequences
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ahmed El-Roby',
	'el-roby@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'el-roby@uwaterloo.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'RACE: A Scalable and Elastic Parallel System for Discovering Repeats in Very Long Sequences',
	TO_DATE('27/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('27/08/2013, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'el-roby@uwaterloo.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='el-roby@uwaterloo.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Panos Kalnis',
	'kalnis@uwaterloo.edu',
	'University of Waterloo',
	'+001(519)8888-4567',
	'Canadian',
	'200 University Ave W, Waterloo, ON N2L 3G1, Canada',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kalnis@uwaterloo.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kalnis@uwaterloo.edu';
/
--Artigo XORing Elephants: Novel Erasure Codes for Big Data
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Maheswaran Sathiamoorthy',
	'sathiamoorthy@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sathiamoorthy@uc.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'XORing Elephants: Novel Erasure Codes for Big Data',
	TO_DATE('27/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('27/08/2013, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'sathiamoorthy@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sathiamoorthy@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Megasthenis Asteris',
	'asteris@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'asteris@uc.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='asteris@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Scott Chen',
	'chen@facebook.com',
	'Facebook',
	'+0(000)0000-0000',
	'American',
	'Menlo Park, CA, United States of America',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chen@facebook.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chen@facebook.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Dhruba Borthakur',
	'borthakur@facebook.com',
	'Facebook',
	'+0(000)0000-0000',
	'American',
	'Menlo Park, CA, United States of America',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'borthakur@facebook.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='borthakur@facebook.com';
/
--Artigo Distribution-Based Query Scheduling
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yun Chi',
	'chi@nec-labs.com',
	'NEC Laboratories America',
	'+1(609)520-1555',
	'American',
	'4 Independence Way #200, Princeton, NJ 08540, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chi@nec-labs.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Distribution-Based Query Scheduling',
	TO_DATE('27/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('27/08/2013, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'chi@nec-labs.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chi@nec-labs.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hakan Hacigumus',
	'hacigumus@nec-labs.com',
	'NEC Laboratories America',
	'+1(609)520-1555',
	'American',
	'4 Independence Way #200, Princeton, NJ 08540, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'hacigumus@nec-labs.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='hacigumus@nec-labs.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Wang-Pin Hsiung',
	'hsiung@nec-labs.com',
	'NEC Laboratories America',
	'+1(609)520-1555',
	'American',
	'4 Independence Way #200, Princeton, NJ 08540, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'hsiung@nec-labs.com'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='hsiung@nec-labs.com';
/
--Artigo IS-LABEL: an Independent-Set based Labeling Scheme for Point-to-Point Distance Querying
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ada Wai-Chee Fu',
	'fu@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'fu@hku.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'IS-LABEL: an Independent-Set based Labeling Scheme for Point-to-Point Distance Querying',
	TO_DATE('27/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('27/08/2013, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'fu@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='fu@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Huanhuan Wu',
	'wu@cuhk.edu.hk',
	'CUHK',
	'+852(394)0003-7000',
	'Chinese',
	'Shatin, Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wu@cuhk.edu.hk'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wu@cuhk.edu.hk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'James Cheng',
	'cheng@cuhk.edu.hk',
	'CUHK',
	'+852(394)0003-7000',
	'Chinese',
	'Shatin, Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cheng@cuhk.edu.hk'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='cheng@cuhk.edu.hk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Raymond Chi-Wing Wong',
	'wong@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wong@hku.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wong@hku.edu';
/
--Artigo Mining and Indexing Graphs For Supergraph Search
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Dayu Yuan',
	'yuan@psu.edu',
	'Penn State University',
	'+1(814)865-4700',
	'American',
	'University Park, State College, PA 16801, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yuan@psu.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Mining and Indexing Graphs For Supergraph Search',
	TO_DATE('27/08/2013', 'DD/MM/YYYY'),
	TO_TIMESTAMP('27/08/2013, 14:00:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'yuan@psu.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yuan@psu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Prasenjit Mitra',
	'mitra@psu.edu',
	'Penn State University',
	'+1(814)865-4700',
	'American',
	'University Park, State College, PA 16801, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mitra@psu.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='mitra@psu.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'C. Lee Giles',
	'giles@psu.edu',
	'Penn State University',
	'+1(814)865-4700',
	'American',
	'University Park, State College, PA 16801, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	39,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'giles@psu.edu'),
	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='giles@psu.edu';
/
--VLDB 2014
--Artigo Simple, Fast, and Scalable Reachability Oracle
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ruoming Jin',
	'jin@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jin@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Simple, Fast, and Scalable Reachability Oracle',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'jin@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jin@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Guan Wang',
	'wang@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wang@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wang@hku.edu';
/
--Artigo Reachability Querying: An Independent Permutation Labeling Approach
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hao WEI',
	'wei@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wei@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Reachability Querying: An Independent Permutation Labeling Approach',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'wei@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wei@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jeffrey Xu Yu',
	'yu@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yu@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yu@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Can Lu',
	'lu@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lu@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='lu@hku.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jin@hku.edu';
/
--Artigo Toward a Distance Oracle for Billion-Node Graphs
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Zichao Qi',
	'qi@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'qi@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Toward a Distance Oracle for Billion-Node Graphs',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'qi@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='qi@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Bin Shao',
	'shao@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shao@microsoft.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shao@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Haixun Wang',
	'wang@gmail.com',
	'Google',
	'+1(650)253-0000',
	'American',
	'Menlo Park, CA, United States of America',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wang@gmail.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wang@gmail.com';
/
--Artigo Hop Doubling Label Indexing for Point-to-Point Distance Querying on Scale-Free Networks
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Minhao Jiang',
	'jiang@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jiang@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Hop Doubling Label Indexing for Point-to-Point Distance Querying on Scale-Free Networks',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'jiang@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='jiang@hku.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'fu@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='fu@hku.edu';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wong@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wong@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yanyan Xu',
	'xu@cuhk.edu.hk',
	'CUHK',
	'+852(394)0003-7000',
	'Chinese',
	'Shatin, Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xu@cuhk.edu.hk'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='xu@cuhk.edu.hk';
/
--Artigo Path Problems in Temporal Graphs
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wu@cuhk.edu.hk'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Path Problems in Temporal Graphs',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'wu@cuhk.edu.hk' 
		AND I.idPart = P.idPe 
		AND P.tipoParticipante = '1'
		AND I.codEv = 1
		AND I.numEd = 40;
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wu@cuhk.edu.hk';
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'cheng@cuhk.edu.hk'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='cheng@cuhk.edu.hk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Silu Huang',
	'huang@cuhk.edu.hk',
	'CUHK',
	'+852(394)0003-7000',
	'Chinese',
	'Shatin, Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'huang@cuhk.edu.hk'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='huang@cuhk.edu.hk';
/
--Artigo Finding the Cost-Optimal Path with Time Constraint over Time-Dependent Graphs
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yajun Yang',
	'yang@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yang@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Finding the Cost-Optimal Path with Time Constraint over Time-Dependent Graphs',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'yang@hku.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yang@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hong Gao',
	'gao@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'gao@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='gao@hku.edu';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='yu@hku.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jianzhong Li',
	'li@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'li@hku.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='li@hku.edu';
/
--Artigo Counting and Sampling Triangles from a Graph Stream
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kanat Tangwongsan',
	'tangwongsan@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'German',
	'Rueschlikon, Switzerland',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tangwongsan@ibmresearch.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Counting and Sampling Triangles from a Graph Stream',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'tangwongsan@ibmresearch.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tangwongsan@ibmresearch.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kun-Lung Wu',
	'wu@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'German',
	'Rueschlikon, Switzerland',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wu@ibmresearch.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='wu@ibmresearch.com';
/
--Artigo A Sampling Algebra for Aggregate Estimation
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Supriya Nirkhiwale',
	'nirkhiwale@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'nirkhiwale@uc.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'A Sampling Algebra for Aggregate Estimation',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'nirkhiwale@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='nirkhiwale@uc.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Alin Dobra',
	'dobra@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dobra@uc.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='dobra@uc.edu';
/
--Artigo WideTable: An Accelerator for Analytical Data Processing
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yinan Li',
	'li@gla.ac.uk',
	'University of Glasgow',
	'+440(141)3300-2000',
	'British',
	'Glasgow G12 8QQ, United Kingdom',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'li@gla.ac.uk'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'WideTable: An Accelerator for Analytical Data Processing',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'li@gla.ac.uk' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='li@gla.ac.uk';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jignesh Patel',
	'patel@gla.ac.uk',
	'University of Glasgow',
	'+440(141)3300-2000',
	'British',
	'Glasgow G12 8QQ, United Kingdom',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'patel@gla.ac.uk'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='patel@gla.ac.uk';
/
--Artigo Instant Loading for Main Memory Databases
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Wolf Roediger',
	'roediger@mit.edu',
	'MIT',
	'+100(617)0253-1000',
	'American',
	'77 Massachusetts Ave, Cambridge, MA 02139, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'roediger@mit.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Instant Loading for Main Memory Databases',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'roediger@mit.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='roediger@mit.edu';
/
--Artigo The Case for Personal Data-Driven Decision Making
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jennie Duggan',
	'duggan@mit.edu',
	'MIT',
	'+100(617)0253-1000',
	'American',
	'77 Massachusetts Ave, Cambridge, MA 02139, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'duggan@mit.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'The Case for Personal Data-Driven Decision Making',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'duggan@mit.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='duggan@mit.edu';
/
--Artigo Multi-Query Optimization in MapReduce Framework
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Guoping Wang',
	'guowang@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'guowang@nus.edu.sg'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Multi-Query Optimization in MapReduce Framework',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'guowang@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='guowang@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Chee-Yong Chan',
	'chan@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chan@nus.edu.sg'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chan@nus.edu.sg';
/
--Artigo Optimization for iterative queries on MapReduce
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Makoto Onizuka',
	'onizuka@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'onizuka@nus.edu.sg'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Optimization for iterative queries on MapReduce',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'onizuka@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='onizuka@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hiroyuki Kato',
	'kato@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kato@nus.edu.sg'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='kato@nus.edu.sg';
/
--Artigo Parallel Computation of Skyline and Reverse Skyline Queries Using MapReduce
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yoonjae Park',
	'park@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'park@nus.edu.sg'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Parallel Computation of Skyline and Reverse Skyline Queries Using MapReduce',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'park@nus.edu.sg' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='park@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jun-Ki Min',
	'min@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'min@nus.edu.sg'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='min@nus.edu.sg';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kyuseok Shim',
	'shim@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shim@nus.edu.sg'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='shim@nus.edu.sg';
/
--Artigo ClusterJoin: A Similarity Joins Framework using Map-Reduce
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Akash Das Sarma',
	'sarma@stanford.edu',
	'Stanford University',
	'+190(285)9211-2101',
	'American',
	'450 Serra Mall, Stanford, CA 94305, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sarma@stanford.edu'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'ClusterJoin: A Similarity Joins Framework using Map-Reduce',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'sarma@stanford.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sarma@stanford.edu';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yeye He',
	'he@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'he@microsoft.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='he@microsoft.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Surajit Chaudhuri',
	'chaudhuri@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'chaudhuri@microsoft.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='chaudhuri@microsoft.com';
/
--Artigo Hybrid Parallelization Strategies for Large-Scale Machine Learning in SystemML
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Matthias Boehm',
	'boehm@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'German',
	'Rueschlikon, Switzerland',
	'0',
	'1',
	'1'
	);
/
--Inscrito - apresentador:
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'boehm@ibmresearch.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'1'
	);
/
--Artigo
INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)
	SELECT SEQ_IDART_ARTIGO.NEXTVAL,
	'Hybrid Parallelization Strategies for Large-Scale Machine Learning in SystemML',
	TO_DATE('02/09/2014', 'DD/MM/YYYY'),
	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),
	I.codEv,
	I.numEd,
	I.idPart FROM inscrito I, pessoa P
	WHERE P.emailPe = 'boehm@ibmresearch.com' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='boehm@ibmresearch.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Shirish Tatikonda',
	'tatikonda@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'German',
	'Rueschlikon, Switzerland',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tatikonda@ibmresearch.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='tatikonda@ibmresearch.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Berthold Reinwald',
	'reinwald@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'German',
	'Rueschlikon, Switzerland',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'reinwald@ibmresearch.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='reinwald@ibmresearch.com';
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Prithviraj Sen',
	'sen@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'German',
	'Rueschlikon, Switzerland',
	'0',
	'1',
	'1'
	);
/
--Inscrito
INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)
  values(
	1,
	40,
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'sen@ibmresearch.com'),
	TO_DATE('27/07/2014', 'DD/MM/YYYY'),
	'0'
	);
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='sen@ibmresearch.com';
/
--Organizadores do VLDB
--2011 ed
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
    SEQ_IDPE_PESSOA.NEXTVAL,
    'Daniel Kokoto', --nome 
    'kokoto@haifa.com', --email
    'Haifa University', --Nome da instituição associada a pessoa
    '+972(482)9211-2222', --Telefone +XXX(XXX)XXXX-XXXX
    'Israeli', --Nacionalidade
    'Derech Yaakov Dori', --endereco
    '1', --organizador
    '0', --participante
    '0' --autor
    );
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kokoto@haifa.com'),
	1,
	37,
	'membro do comitê diretivo'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Tonokano Tadashi',
	'tadashi@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tadashi@hku.edu'),
	1,
	37,
	'membro da organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jinbo Zing',
	'zing@nus.edu.sg',
	'National University of Singapore',
	'+467(898)1232-8098',
	'Singaporean',
	'21 Lower Kent Ridge Rd, Singapore 119077',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zing@nus.edu.sg'),
	1,
	37,
	'membro da organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yancy Dijango',
	'dijango@umassp.edu',
	'University of Massachusetts',
	'+413(545)0111-0000',
	'American',
	'Amherst, MA 01003, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dijango@umassp.edu'),
	1,
	37,
	'membro da organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mark Zuckerberg',
	'zuck@facebook.com',
	'Facebook',
	'+413(545)0000-0000',
	'American',
	'Amherst, MA 01003, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'zuck@facebook.com'),
	1,
	37,
	'coordenador de organização local'
	);
/
-- 2012 ed
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Alice Lion',
	'lion@utah.edu',
	'University of Utah',
	'+1(801)581-7200',
	'American',
	'201 Presidents Cir, Salt Lake City, UT 84112, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lion@utah.edu'),
	1,
	38,
	'membro do comitê diretivo'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Ryan Snape',
	'snape@mit.edu',
	'MIT',
	'+100(617)0253-1000',
	'American',
	'77 Massachusetts Ave, Cambridge, MA 02139, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'snape@mit.edu'),
	1,
	38,
	'coordenador de organização local'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'dijango@umassp.edu'),
	1,
	38,
	'membro da organização local'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tadashi@hku.edu'),
	1,
	38,
	'membro da organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hakuna Kodak',
	'kodak@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kodak@microsoft.com'),
	1,
	38,
	'membro da organização local'
	);
/
-- 2013 ed
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kodak@microsoft.com'),
	1,
	39,
	'coordenador de organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Chum Lee',
	'lee@psu.edu',
	'Penn State University',
	'+1(814)865-4700',
	'American',
	'University Park, State College, PA 16801, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lee@psu.edu'),
	1,
	39,
	'membro da organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Lee Xon Wing',
	'wing@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'wing@hku.edu'),
	1,
	39,
	'membro da organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Megasthenis Austerus',
	'austerus@uc.edu',
	'University of California',
	'+413(805)0893-8000',
	'American',
	'Santa Barbara, CA 93106, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'austerus@uc.edu'),
	1,
	39,
	'membro da organização local'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lion@utah.edu'),
	1,
	39,
	'membro do comitê diretivo'
	);
/
-- 2014 ed
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'lee@psu.edu'),
	1,
	40,
	'coordenador de organização local'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'austerus@uc.edu'),
	1,
	40,
	'membro do comitê diretivo'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Bill Shell',
	'shell@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'shell@microsoft.com'),
	1,
	40,
	'membro da organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Hong Xu',
	'xu@hku.edu',
	'The University of Hong Kong',
	'+123(285)9211-0901',
	'Chinese',
	'Hong Kong, China',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xu@hku.edu'),
	1,
	40,
	'membro da organização local'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kanana Tang',
	'tang@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'German',
	'Rueschlikon, Switzerland',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tang@ibmresearch.com'),
	1,
	40,
	'membro da organização local'
	);
/

-- Organização sigspatial ev 02 edicao 21
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Qi He',
	'qi_he@linkedin.com',
	'LinkedIn Inc.',
	'+1(445)1475-4570',
	'Korean',
	'Mountain View, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'qi_he@linkedin.com'),
	2,
	21,
	'General Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Jianfeng Gao',
	'jin.gao@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'jin.gao@microsoft.com'),
	2,
	21,
	'Tutorial Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Xuedong Huang',
	'xue.huang@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'xue.huang@microsoft.com'),
	2,
	21,
	'Tutorial Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Amol Ghoting',
	'amol.gh@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'American',
	'Yorktown Heights, NY 10598, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'amol.gh@ibmresearch.com'),
	2,
	21,
	'Sponsorship Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yuanyuan Tian',
	'yua_tian@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'American',
	'Yorktown Heights, NY 10598, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yua_tian@ibmresearch.com'),
	2,
	21,
	'Sponsorship Chair'
	);
/
/
/
-- Organização sigspatial ev 02 ed 20
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'qi_he@linkedin.com'),
	2,
	20,
	'Publicity Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Prem Melville',
	'melville.prem@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'American',
	'Yorktown Heights, NY 10598, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'melville.prem@ibmresearch.com'),
	2,
	20,
	'Publicity Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Yi Chang',
	'yi.chang@yahoo.com',
	'Yahoo!',
	'+413(545)0111-0458',
	'American',
	'Sunnyvale, CA, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'yi.chang@yahoo.com'),
	2,
	20,
	'Sponsorship Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Paul N. Bennett',
	'paul.n.bennett@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'paul.n.bennett@microsoft.com'),
	2,
	20,
	'Demonstration Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Evgeniy Gabrilovich',
	'evgeniy@gmail.com',
	'Google',
	'+1(285)211-9999',
	'American',
	'Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'evgeniy@gmail.com'),
	2,
	20,
	'Demonstration Chair'
	);
/
/
/
/
-- Organização sigspatial ev 02 ed 19
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'David Carmel',
	'david.carmel@ibmresearch.com',
	'IBM Research',
	'+142(175)1475-4569',
	'Israeli',
	'Haifa, Israel',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'david.carmel@ibmresearch.com'),
	2,
	19,
	'Award Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Craig Macdonald',
	'craig.macdonald@gla.ac.uk',
	'University of Glasgow',
	'+440(141)3300-2000',
	'British',
	'Glasgow G12 8QQ, United Kingdom',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'craig.macdonald@gla.ac.uk'),
	2,
	19,
	'Chair-At-Large and Workshop Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Richard McCreadie',
	'richard.mcc@gla.ac.uk',
	'University of Glasgow',
	'+440(141)3300-2000',
	'British',
	'Glasgow G12 8QQ, United Kingdom',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'richard.mcc@gla.ac.uk'),
	2,
	19,
	'Registration Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Omar Alonso',
	'omar_alonso@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'omar_alonso@microsoft.com'),
	2,
	19,
	'Demonstration Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Leif Azzopardi',
	'leif_azz@gla.ac.uk',
	'University of Glasgow',
	'+440(141)3300-2000',
	'British',
	'Glasgow G12 8QQ, United Kingdom',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'leif_azz@gla.ac.uk'),
	2,
	19,
	'Travel Grants Chair'
	);
/
/
/
-- Organização sigspatial ev 02 ed 18
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Kevyn Collins-Thompson',
	'kcollins-thompson@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'kcollins-thompson@microsoft.com'),
	2,
	18,
	'Industry Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Nick Koudas',
	'nick.koudas@utoronto.ca',
	'University of Toronto',
	'+1(416)978-2011',
	'Canadian',
	'27 Kings College Circle Toronto, ON, Canada',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'nick.koudas@utoronto.ca'),
	2,
	18,
	'DB Track PC Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Iadh Ounis',
	'iadh-o@gla.ac.uk',
	'University of Glasgow',
	'+440(141)3300-2000',
	'British',
	'Glasgow G12 8QQ, United Kingdom',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'iadh-o@gla.ac.uk'),
	2,
	18,
	'CIKM 2011 Liaison'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Tapas Kanungo',
	'tapas.kanungo@microsoft.com',
	'Microsoft Research',
	'+190(285)9211-9999',
	'American',
	'1065 La Avenida, Mountain View, CA 94043, United States',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'tapas.kanungo@microsoft.com'),
	2,
	18,
	'Sponsorship Chair'
	);
/
INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
  values(
	SEQ_IDPE_PESSOA.NEXTVAL,
	'Mounia Lalmas',
	'mounia_lalmas@gla.ac.uk',
	'University of Glasgow',
	'+440(141)3300-2000',
	'British',
	'Glasgow G12 8QQ, United Kingdom',
	'1',
	'0',
	'0'
	);
/
INSERT INTO organiza (idOrg, codEv, numEd, cargoOrg)
  values(
	(SELECT P.idPe FROM pessoa P WHERE P.emailPe = 'mounia_lalmas@gla.ac.uk'),
	2,
	18,
	'Workshops Chair'
	);
/
/
/
/*
-- Lista a quantidade de artigos apresentados por pessoa em cada evento
-- Para auxiliar saber os inscritos que necessitam de auxílio
SELECT a1.idApr, a1.codEv, a1.numEd, count(a1.idArt) AS total
  FROM artigo a1, artigo a2
  WHERE a1.codEv = a2.codEv
    AND a1.numEd = a2.numEd
    AND a1.idApr = a2.idApr
  GROUP BY a1.idApr, a1.codEv, a1.numEd
  ORDER BY total;

  SELECT pessoa.idPe, pessoa.nomePe, pessoa.emailPe
  FROM pessoa, inscrito
  WHERE pessoa.tipoParticipante = '1'
    AND pessoa.idPe = inscrito.idPart
    AND inscrito.tipoApresentador = '1';
*/
/
/
/
/
-- Insere os auxilios para apresentadores e inscritos nos eventos
/
/
/
/
/
-- sigspatial ev 02 ed 18
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'weber@rutgers.edu'),
  	150.00,
  	TO_DATE('30/10/2010', 'DD/MM/YYYY'),
  	'Food aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'eppstein@uc.edu'),
  	200.00,
  	TO_DATE('01/10/2010', 'DD/MM/YYYY'),
  	'Hosting aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	59456277000176,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'shang@itee.uq.edu.au'),
  	650.00,
  	TO_DATE('30/07/2010', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	59456277000176,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'nutanong@unimelb.edu.au'),
  	650.00,
  	TO_DATE('25/07/2010', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'xing@usc.edu'),
  	150.00,
  	TO_DATE('15/10/2010', 'DD/MM/YYYY'),
  	'Food aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'buchin@uu.nl'),
  	150.00,
  	TO_DATE('12/10/2010', 'DD/MM/YYYY'),
  	'Transportation aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'ghinita@umb.edu'),
  	150.00,
  	TO_DATE('25/10/2010', 'DD/MM/YYYY'),
  	'Food aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	59456277000176,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'wallgrün@bremen.org'),
  	650.00,
  	TO_DATE('25/07/2010', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	59456277000176,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'wilke@vienna.edu'),
  	650.00,
  	TO_DATE('03/08/2010', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'liu@tech.virginia.com'),
  	200.00,
  	TO_DATE('14/10/2010', 'DD/MM/YYYY'),
  	'Hosting aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'evans@uminnesota.com'),
  	200.00,
  	TO_DATE('16/10/2010', 'DD/MM/YYYY'),
  	'Hosting aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'carlson@swarthmore.com'),
  	200.00,
  	TO_DATE('17/10/2010', 'DD/MM/YYYY'),
  	'Hosting aid'
);

INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	18,
  	2,
  	18,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 18
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'quercini@umaryland.edu'),
  	200.00,
  	TO_DATE('21/10/2010', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
/
/
/
/
-- Sigspatial ev 02 ed 19
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	19758880000198,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'shang@itee.uq.edu.au'),
  	150.00,
  	TO_DATE('12/08/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	61797924000155,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'zhou@uminnesota.com'),
  	150.00,
  	TO_DATE('25/07/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'gao@zhejiang.edu'),
  	150.00,
  	TO_DATE('30/07/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'buchin@eindhoven.edu'),
  	150.00,
  	TO_DATE('27/08/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'dai@umb.edu'),
  	150.00,
  	TO_DATE('25/08/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'chen@stanford.edu'),
  	150.00,
  	TO_DATE('13/08/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	19758880000198,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'adelfio@umaryland.edu'),
  	200.00,
  	TO_DATE('12/10/2011', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'fang@nus.edu.sg'),
  	200.00,
  	TO_DATE('25/10/2011', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	61797924000155,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'adams@uc.edu'),
  	200.00,
  	TO_DATE('19/10/2011', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	19758880000198,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'gao@zhejiang.edu'),
  	650.00,
  	TO_DATE('17/07/2011', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'buchin@eindhoven.edu'),
  	650.00,
  	TO_DATE('25/07/2011', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	19,
  	2,
  	19,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 19
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'ying@cku.edu'),
  	650.00,
  	TO_DATE('23/07/2011', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
/
/
/
/
-- EV 02 ED 20
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'wang@unimelb.edu.au'),
  	100.00,
  	TO_DATE('25/10/2012', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'sankaranarayanan@umaryland.edu'),
  	100.00,
  	TO_DATE('15/10/2012', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'yuan@umb.edu'),
  	100.00,
  	TO_DATE('30/09/2012', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'dai@umb.edu'),
  	100.00,
  	TO_DATE('25/09/2012', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'vieira@uc.edu'),
  	200.00,
  	TO_DATE('25/08/2012', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'sidlauskas@cs.aau.dk'),
  	200.00,
  	TO_DATE('15/08/2012', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'macário@unicamp.com.br'),
  	200.00,
  	TO_DATE('13/09/2012', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'shirani-mehr@usc.edu'),
  	200.00,
  	TO_DATE('27/10/2012', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'tiesyte@cs.aau.dk'),
  	200.00,
  	TO_DATE('16/10/2012', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	60316817000103,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'zheng@microsoft.com'),
  	200.00,
  	TO_DATE('12/10/2012', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'macário@unicamp.com.br'),
  	600.00,
  	TO_DATE('15/07/2012', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	20,
  	2,
  	20,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 20
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'buchin@eindhoven.edu'),
  	600.00,
  	TO_DATE('25/07/2012', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
/
/
/
/
-- EV 02 ED 21
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'song@umassp.edu'),
  	450.00,
  	TO_DATE('30/07/2013', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'kong@umassp.edu'),
  	100.00,
  	TO_DATE('13/09/2013', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'jakobsen@cs.aau.dk'),
  	100.00,
  	TO_DATE('27/09/2013', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'baum@kit.edu'),
  	100.00,
  	TO_DATE('25/07/2013', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'kazemitabar@usc.edu'),
  	100.00,
  	TO_DATE('25/08/2013', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'both@unimelb.edu.au'),
  	450.00,
  	TO_DATE('13/07/2013', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'kreveld@uu.nl'),
  	450.00,
  	TO_DATE('14/07/2013', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'liu@umaryland.edu'),
  	100.00,
  	TO_DATE('18/10/2013', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'bao@uminnesota.com'),
  	100.00,
  	TO_DATE('29/09/2013', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'gao@uc.edu'),
  	150.00,
  	TO_DATE('25/08/2013', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	33372251000156,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'sengstock@hu.edu'),
  	450.00,
  	TO_DATE('27/07/2013', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'song@umassp.edu'),
  	100.00,
  	TO_DATE('19/10/2013', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'kadambi@bloomberg.com'),
  	100.00,
  	TO_DATE('17/10/2013', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	10322194000103,
  	2,
  	21,
  	2,
  	21,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 2
  		and I.numEd = 21
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'pan@usc.edu'),
  	100.00,
  	TO_DATE('15/10/2013', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
/
/
/
/
-- EV 01 ED 37
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'cao@umassp.edu'),
  	75.00,
  	TO_DATE('18/06/2011', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'rice@uc.edu'),
  	75.00,
  	TO_DATE('23/06/2011', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'khanna@upenn.edu'),
  	75.00,
  	TO_DATE('25/06/2011', 'DD/MM/YYYY'),
  	'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'sagy@technion.ac.il'),
  	50.00,
  	TO_DATE('25/07/2011', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'kadambi@bloomberg.com'),
  	50.00,
  	TO_DATE('17/07/2011', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'papadimitriou@stanford.edu'),
  	50.00,
  	TO_DATE('02/07/2011', 'DD/MM/YYYY'),
  	'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'rocha-junior@ntnu.edu'),
  	100.00,
  	TO_DATE('30/05/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'yan@hku.edu'),
  	100.00,
  	TO_DATE('25/05/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'bernecker@lmu.edu'),
  	100.00,
  	TO_DATE('07/05/2011', 'DD/MM/YYYY'),
  	'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'bernecker@lmu.edu'),
  	400.00,
  	TO_DATE('25/03/2011', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'wang@nus.edu.sg'),
  	400.00,
  	TO_DATE('30/03/2011', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'yan@hku.edu'),
  	400.00,
  	TO_DATE('01/04/2011', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
  	06990590000204,
  	1,
  	37,
  	1,
  	37,
  	(SELECT I.idPart FROM inscrito I, pessoa P 
  		WHERE I.codEv = 1
  		and I.numEd = 37
  		and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
  		and P.emailPe = 'chen@hku.edu'),
  	400.00,
  	TO_DATE('06/04/2011', 'DD/MM/YYYY'),
  	'Flight ticket aid'
);
/
-- EV 01 ED 38 VLDB
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    6990590000204,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'fink@ox.ac.uk'),
    400.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'sheng@hku.edu'),
    400.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'mihaylov@upenn.edu'),
    400.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    59456277000176,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'ranu@uc.edu'),
    200.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    59456277000176,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'singh@mit.edu'),
    200.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'cheung@mit.edu'),
    500.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'bahmani@stanford.edu'),
    500.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'satuluri@osu.edu'),
    500.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'jestes@utah.edu'),
    500.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    57286247000133,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'lu@nus.edu.sg'),
    400.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    57286247000133,
    1,
    38,
    1,
    38,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv = 1
      and I.numEd = 38
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'ports@mit.edu'),
    400.00,
    TO_DATE('24/08/2012', 'DD/MM/YYYY'),
    'Transportation aid'
);
/
-- EV 01 ED 39 VLDB
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'he@nus.edu.sg'),
    500.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'heimel@uwaterloo.edu'),
    500.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Hosting aid'
);

/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'stoica@bloomberg.com'),
    500.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    33372251000156,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'yuan@osu.edu'),
    500.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    33372251000156,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'yuan@osu.edu'),
    500.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'liu@nus.edu.sg'),
    200.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    61797924000155,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'pei@osu.edu'),
    500.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'mahmoud@uc.edu'),
    200.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'el-roby@uwaterloo.edu'),
    200.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'sathiamoorthy@uc.edu'),
    200.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'chi@nec-labs.com'),
    200.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    57286247000133,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'fu@hku.edu'),
    400.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Flight ticket aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    57286247000133,
    1,
    39,
    1,
    39,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 39
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'yuan@psu.edu'),
    800.00,
    TO_DATE('24/08/2013', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
-- EV 01 ED 40 VLDB
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'jin@hku.edu'),
    100.00,
    TO_DATE('28/08/2014', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'wu@cuhk.edu.hk'),
    100.00,
    TO_DATE('28/08/2014', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'tangwongsan@ibmresearch.com'),
    500.00,
    TO_DATE('28/08/2014', 'DD/MM/YYYY'),
    'Transportation aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    57286247000133,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'nirkhiwale@uc.edu'),
    800.00,
    TO_DATE('27/08/2014', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    33372251000156,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'li@gla.ac.uk'),
    400.00,
    TO_DATE('27/08/2014', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    61797924000155,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'roediger@mit.edu'),
    200.00,
    TO_DATE('27/08/2014', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'guowang@nus.edu.sg'),
    800.00,
    TO_DATE('28/08/2014', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    33372251000156,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'sarma@stanford.edu'),
    100.00,
    TO_DATE('28/08/2014', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    33372251000156,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'boehm@ibmresearch.com'),
    800.00,
    TO_DATE('28/08/2014', 'DD/MM/YYYY'),
    'Hosting aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    06990590000204,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'duggan@mit.edu'),
    100.00,
    TO_DATE('28/08/2014', 'DD/MM/YYYY'),
    'Food aid'
);
/
INSERT INTO auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
  values(
    19758880000198,
    1,
    40,
    1,
    40,
    (SELECT I.idPart FROM inscrito I, pessoa P 
      WHERE I.codEv =1 
      and I.numEd = 40
      and I.idPart = P.idPe 
      and I.tipoApresentador = '1' --para garantir
      and P.emailPe = 'yang@hku.edu'),
    500.00,
    TO_DATE('28/08/2014', 'DD/MM/YYYY'),
    'Transportation aid'
);
/
/
-- Update do atributo derivado qtdArtigosApresentadosEd da tabela edicao
/*
 * Conta-se todos os artigos distintos (com diferentes chaves primárias)
 * que pertencem ao mesmo evento e edição
 */
UPDATE edicao
  SET qtdArtigosApresentadosEd = (
    SELECT count(Art.idArt) FROM artigo Art
      WHERE edicao.codEv = Art.codEv and edicao.numEd = Art.numEd);
/
/*SELECT edicao.codEv, edicao.numEd, count(inscrito.idPart) FROM inscrito, edicao
    WHERE edicao.codEv = inscrito.codEv and edicao.numEd = inscrito.numEd
    GROUP BY edicao.codEv, edicao.numEd;
*/
/
/
/
-- Update dos atributo derivado totalArtigosApresentadosEv da tabela evento
/*
 *	Soma-se os campo qtdArtigosApresentadosEd de todas as edições que pertençam 
 * aquele evento
 */
UPDATE evento
  SET totalArtigosApresentadosEv = (
    SELECT sum(Ed.qtdArtigosApresentadosEd) FROM edicao Ed
      WHERE Ed.codEv = evento.codEv);
/
/
/
/
-- Update do atributo derivado saldoPat da tabela patrocinio
/*
 * Calcula-se o saldo final de cada patrocinio, contabilizando o que 
 * foi recebido como patrocinio e o que foi gasto com despesas do 
 * evento e com auxilio, representando o saldo gasto do determinado patrocinio.
 * OBS: Considerando o evento e edicao que o patrocinio foi conseguido, não a 
 * despesa ou auxilio.
 */
UPDATE patrocinio
	SET saldoPat = (
    SELECT (patrocinio.valorPat - sum(despesa.valorDesp) - sum(auxilio.valorAux) )
      FROM despesa, auxilio
      WHERE (patrocinio.codEv = despesa.codEvPat
        AND patrocinio.numEd = despesa.numEdPat)
        OR (patrocinio.codEv = auxilio.codEvPat
          AND patrocinio.numEd = auxilio.numEdPat)
      GROUP BY patrocinio.cnpjPat, despesa.cnpjPat, auxilio.cnpjPat
);
/*
SELECT cnpjPat, sum(valorDesp)
  FROM despesa
  GROUP BY cnpjPat;
*/
/
/
/
-- Update do atributo derivado saldoFinanceiroEd da tabela edicao
/*
 *	Calcula o saldo final da edicao contabilizando todos os patrocinios,
 * despesas e auxílios, através da soma dos resultados atualizados do campo
 * saldoPat da tabela patrocinio que se referem à mesma edicao; além
 * de contabilizar o valor recebido pelas taxas de inscrição.
 *
UPDATE edicao 
	SET saldoFinanceiroEd = (
		);
*/
/
/
/
