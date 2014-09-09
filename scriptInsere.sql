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
	 	'Brazilian Symposium on Geoinformatics', -- nome do evento
	 	'The GeoInfo series (Brazilian Symposium on Geoinformatics) is an annual conference 
	 	for exploring ongoing research, development and innovative applications on geographic 
	 	information science and related areas. Papers should describe original research, ongoing 
	 	(preferably) or recently completed and are reviewed by an international scientific committee.
		The GeoInfo conferences also aim to bring to Brazil leading GIScience and spatial database 
		researchers, to present to the local community a perspective of the state-of-the-art in the 
		area. Past speakers have included Max Egenhofer, Gary Hunter, Andrew Frank, Roger Bivand, 
		Mike Worboys, Werner Kuhn, Stefano Spaccapietra, Ralf Guting, Shashi Shekhar, Christopher 
		Jones, Martin Kulldorff, Andrea Rodriguez, Max Craglia, Stephen Winter, Edzer Pebesma, Fosca 
		Giannotti, Christian Freksa, Thomas Bittner, and Markus Schneider.', -- descrição do evento
	 	'http://www.geoinfo.info/'-- website do evento
);
/
/
/
-- Inserção da edição de 2013 do primeiro evento
INSERT INTO edicao(codEv, nomeEv, codEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		'ACM International Conference on Information and Knowlege Managment', -- nome do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('27/10/2013', 'DD/MM/YYYY'), -- data de início
		TO_DATE('01/11/2013', 'DD/MM/YYYY'), -- data de fim
		'San Francisco, USA',-- local onde a edição ocorreu na forma de Cidade, País
		1365.00-- valor da inscrição (Considerando a mais cara)
);
/
-- Inserção da edição de 2012 do primeiro evento
INSERT INTO edicao(codEv, nomeEv, codEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		'ACM International Conference on Information and Knowlege Managment', -- nome do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('', 'DD/MM/YYYY'), -- data de início
		TO_DATE('', 'DD/MM/YYYY'), -- data de fim
		'',-- local onde a edição ocorreu na forma de Cidade, País
		1-- valor da inscrição
);
/
-- Inserção da edição de 2011 do primeiro evento
INSERT INTO edicao(codEv, nomeEv, codEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		'ACM International Conference on Information and Knowlege Managment', -- nome do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('', 'DD/MM/YYYY'), -- data de início
		TO_DATE('', 'DD/MM/YYYY'), -- data de fim
		'',-- local onde a edição ocorreu na forma de Cidade, País
		1-- valor da inscrição
);
/
-- Inserção da edição de 2010 do primeiro evento
INSERT INTO edicao(codEv, nomeEv, codEd, dataInicioEd, dataFimEd, localEd, taxaEd)
	VALUES(
		1, -- código do evento
		'ACM International Conference on Information and Knowlege Managment', -- nome do evento
		SEQ_NUMED_EDICAO.NEXTVAL,
		TO_DATE('', 'DD/MM/YYYY'), -- data de início
		TO_DATE('', 'DD/MM/YYYY'), -- data de fim
		'',-- local onde a edição ocorreu na forma de Cidade, País
		1-- valor da inscrição
);
/

