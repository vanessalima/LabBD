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
	 	'http://cikm2014.fudan.edu.cn',-- website do evento
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
	 	'http://www.vldb.org/',-- website do evento
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
	 	'http://www.geoinfo.info/',-- website do evento
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
		
);


codEv Number(10) NOT NULL,	-- Chave primária e estrangeira (identifica identidade fraca)
	nomeEv Varchar2(15) NOT NULL, -- Chave primária e estrangeira (identifica identidade fraca)
	codEd Number(10) NOT NULL, -- Chave primária para diferenciar de evento
	dataInicioEd Date,
	dataFimEd Date,
	localEd Varchar2(20), -- *** seria essa a melhor variável??? 
	taxaEd Number(20),


