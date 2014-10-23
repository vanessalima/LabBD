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
	WHERE P.emailPe = 'rice@uc.edu' and I.idPart = P.idPe and P.tipoParticipante = '1';
/
--Escreve
INSERT INTO escreve (idAutor, idArt)
	SELECT P.idPe,
	SEQ_IDART_ARTIGO.CURRVAL
	FROM pessoa P
	WHERE P.emailPe='rice@uc.edu';
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
	WHERE P.emailPe = 'wu@cuhk.edu.hk' and I.idPart = P.idPe and P.tipoParticipante = '1';
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
