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
- evento: pelo menos 1
- edição por evento: pelo menos 3
- artigos por edição: pelo menos 15
- inscritos por edição: pelo menos 30
- patrocinadores: pelo menos 4
- patrocínios: pelo menos 4 por edição
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
DROP SEQUENCE SEQ_NUMED_EDICAO;
DROP SEQUENCE SEQ_IDPE_PESSOA;
DROP SEQUENCE SEQ_IDART_ARTIGO;
DROP SEQUENCE SEQ_CODDESP_DESPESA
/
/
/
DELETE FROM evento;
DELETE FROM edicao;
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
 */
CREATE SEQUENCE SEQ_NUMED_EDICAO
	MINVALUE 0
	START WITH 1
	INCREMENT BY 1;
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
-- Inserção da edição de 2013 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('27/10/2013', 'DD/MM/YYYY'), -- data de início
		TO_DATE('01/11/2013', 'DD/MM/YYYY'), -- data de fim
		'San Francisco, United States',-- local onde a edição ocorreu na forma de Cidade, País
		1365.00 -- valor da inscrição (Considerando a mais cara)
);
/
-- Inserção da edição de 2012 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('29/10/2012', 'DD/MM/YYYY'), -- data de início
		TO_DATE('02/11/2012', 'DD/MM/YYYY'), -- data de fim
		'Sheraton, Maui Hawaii',-- local onde a edição ocorreu na forma de Cidade, País
		1355.00-- valor da inscrição
);
/
-- Inserção da edição de 2011 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('23/10/2011', 'DD/MM/YYYY'), -- data de início
		TO_DATE('28/10/2011', 'DD/MM/YYYY'), -- data de fim
		'Glasgow, United Kingdom',-- local onde a edição ocorreu na forma de Cidade, País
		1040.00-- valor da inscrição
);
/
-- Inserção da edição de 2010 do primeiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('26/10/2010', 'DD/MM/YYYY'), -- data de início
		TO_DATE('30/10/2010', 'DD/MM/YYYY'), -- data de fim
		'Toronto, Canada',-- local onde a edição ocorreu na forma de Cidade, País
		1580.00-- valor da inscrição
);
/
/
/
-- Inserção da edição de 2014 do segundo evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		2, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
    TO_DATE('01/09/2014', 'DD/MM/YYYY'),
    TO_DATE('05/09/2014', 'DD/MM/YYYY'),
    'Hangzhou, China',
    1100.00
);
-- Inserção da edição de 2013 do segundo evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		2, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
    TO_DATE('26/08/2013', 'DD/MM/YYYY'),
    TO_DATE('30/08/2013', 'DD/MM/YYYY'),
    'Trento, Italy',
    1100.00
);
-- Inserção da edição de 2012 do segundo evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		2, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
    TO_DATE('27/08/2012', 'DD/MM/YYYY'),
    TO_DATE('31/08/2012', 'DD/MM/YYYY'),
    'Istanbul, Turkey',
    1100.00
);
-- Inserção da edição de 2011 do segundo evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		2, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
    TO_DATE('29/08/2011', 'DD/MM/YYYY'),
    TO_DATE('03/09/2011', 'DD/MM/YYYY'),
    'Seattle, Washington',
    1220.00
);
/
/
/
-- Inserção da edição de 2013 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('05/11/2013', 'DD/MM/YYYY'), -- data de início
		TO_DATE('08/11/2013', 'DD/MM/YYYY'), -- data de fim
		'Orlando, United States',-- local onde a edição ocorreu na forma de Cidade, País
		650.00-- valor da inscrição
);
/
-- Inserção da edição de 2012 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('06/11/2012', 'DD/MM/YYYY'), -- data de início
		TO_DATE('09/11/2012', 'DD/MM/YYYY'), -- data de fim
		'Redondo Beach, United States',-- local onde a edição ocorreu na forma de Cidade, País
		650.00-- valor da inscrição
);
/
-- Inserção da edição de 2011 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('01/11/2011', 'DD/MM/YYYY'), -- data de início
		TO_DATE('04/11/2011', 'DD/MM/YYYY'), -- data de fim
		'Chicago, United States',-- local onde a edição ocorreu na forma de Cidade, País
		650.00-- valor da inscrição
);
/
-- Inserção da edição de 2010 do terceiro evento
INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		3, -- código do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('02/11/2010', 'DD/MM/YYYY'), -- data de início
		TO_DATE('05/11/2010', 'DD/MM/YYYY'), -- data de fim
		'San Jose, United States',-- local onde a edição ocorreu na forma de Cidade, País
		650.00-- valor da inscrição
);


