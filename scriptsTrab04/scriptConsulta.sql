/*
 * Carlos Humberto dos Santos Baqueta	7987456
 * Marina Coimbra						7126841
 * Vanessa Apolinário de Lima			7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 04
 *
 * Script de Consulta < scriptConsulta.sql >
 * 
 */

/*  TASKS:
  • Uma consulta que envolva pelo menos uma operação de conjunto (UNION, INTERSECT, MINUS). OK
  • Uma consulta que envolva pelo menos uma cláusula IN. OK
  • Uma consulta que envolva pelo menos uma cláusula EXISTS. OK
  
  • Pelo menos uma das consultas deve ser uma consulta de divisão. OK
  • Cada consulta deve ser definida sobre três ou mais tabelas.
  • Devem ser utilizadas cláusulas de formatação das respostas para os usuários, por 
    exemplo, que concatenem strings, que renomeiem os nomes das colunas, que 
    representem valores monetários de forma legível (e.g., R$10.000,00).
  • As colunas exibidas devem ser formatadas apropriadamente, justificando-se os resultados 
    à direita ou à esquerda quando necessário.
*/
/*	Consulta - 1
	Descrição da pesquisa:

	Listagem do nome, email e telefone de todos os autores que tiveram artigos apresentados 
	em todas as edições do evento International Conference on Very Large Data Bases - que 
	constam na base de dados.

	Atende aos seguintes itens pedidos:

	• Uma consulta que envolva pelo menos uma operação de conjunto (UNION, INTERSECT, MINUS).
	• Pelo menos uma das consultas deve ser uma consulta de divisão.

	RESULTADO OBTIDO:

	Autor                Contato (email/telefone)               
	-------------------- ----------------------------------------
	Guy Sagy             sagy@technion.ac.il / +972(482)92111  

*/
SELECT RPAD(P.NOMEPE, 20, ' ') AS "Autor", RPAD( CONCAT(CONCAT(P.emailPe, ' / '), P.TELEFONEPE), 40, ' ') AS "Contato (email/telefone)"  
	  FROM pessoa P
      WHERE NOT EXISTS(
        (SELECT Ed.numEd FROM edicao Ed, evento Ev
          WHERE Ev.nomeEv ='International Conference on Very Large Data Bases'
            AND Ev.codEv = Ed.codEv)
        MINUS
        (SELECT Ed.numEd FROM edicao Ed
          INNER JOIN evento Ev
          ON Ev.codEv = Ed.codEv
          INNER JOIN artigo A
          ON Ed.codEv = A.codEv AND Ed.numEd = A.numEd
          INNER JOIN escreve E
          ON A.idArt = E.idArt
          WHERE UPPER(Ev.nomeEv) = UPPER('International Conference on Very Large Data Bases')
          	AND P.tipoAutor = '1'
          	AND P.idPe = E.idAut)
      );
/
/
/*	Consulta - 2
	Descrição da pesquisa:

	Listagem de todos os patrocinadores que patrocinaram alguma edição do evento
	ACM SIGSPATIAL International Conference on Advances in Geographic Information 
	Systems com valor de patrocínio superior a R$ 10000.
	
	Atende aos seguintes itens pedidos:

	• Uma consulta que envolva pelo menos uma cláusula IN.
	
	RESULTADO OBTIDO:
	
	Patrocinador                             Telefone         
	---------------------------------------- ------------------
	GOOGLE BRASIL INTERNET LTDA.             +55(11)3797-1263   
	Microsoft Informatica Ltda.              +55(11)5504-2155   
	Oracle do Brasil Sistemas Ltda.          +55(11)5189-1000   
	Vmware Software e Servicos Brasil LTDA.  +55(11)5509-7200  

*/
SELECT RPAD(Patr.razaoSocialPat, 40, ' ') AS "Patrocinador", Patr.TELEFONEPAT AS "Telefone"
		FROM patrocinador Patr
		WHERE Patr.cnpjPat IN ( 
			SELECT P.cnpjPat FROM evento Ev
			INNER JOIN edicao Ed
			ON Ev.codEv = Ed.codEv
			INNER JOIN patrocinio P
			ON Ed.codEv = P.codEv AND Ed.numEd = P.numEd
			WHERE P.valorPat > 10000
      AND UPPER(Ev.NOMEEV) = UPPER('ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems'))
      ORDER BY Patr.razaoSocialPat ASC;
/
/
/*	Consulta - 3
	Descrição da pesquisa:
	
	Listagem do nome, nacionalidade e endereço de todos os apresentadores de artigos de quaisquer edições
	do evento ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems que 
	já receberam alguma vez o auxílio do tipo "Flight ticket aid".
	Tal consulta pode ser utilizada, por exemplo, para (1) analisar a distância entre esses apresentadores e os 
	locais que sediaram o evento e correlacionar com os valores empregados no auxílio, (2) utilizar tal informação 
	como base para decisão de próximas distribuições de auxílios do tipo "Flight ticket aid"  etc.	
	
	Atende aos seguintes itens pedidos:

	• Uma consulta que envolva pelo menos uma cláusula EXISTS.
	
	RESULTADO OBTIDO:
	
	Apresentador do artigo Nacionalidade Endereço                                              
	---------------------- ------------- -------------------------------------------------------
	Alan Both              Australian    Parkville VIC 3010, Australia                           
	Carla Macário          Brazilian     Barão Geraldo, Campinas - SP, 13083-970                 
	Christian Sengstock    German        Grabengasse 1, 69117 Heidelberg, Germany                
	Chunyao Song           American      Amherst, MA 01003, United States                        
	Gwen Wilke             Austrian      Karlsplatz 13, 1040 Wien, Austria                       
	Jan Oliver Wallgrün    German        Bibliothekstrabe 1, 28359 Bremen, Germany               
	Jia-Ching Ying         Taiwan        701, Taiwan, Tainan City, East District                 
	Kevin Buchin           Dutch         5612 AZ Eindhoven, Netherlands                          
	Marc van Kreveld       Dutch         3508 TC Utrecht, The Netherlands                        
	Sarana Nutanong        Australian    Parkville VIC 3010, Australia                           
	Shuo Shang             Australian    Brisbane QLD 4072 Australia                             
	Yunjun Gao             Chinese       38 Zheda Rd, Xihu, Hangzhou, Zhejiang, China, 310027   
	

*/
SELECT RPAD(P.NOMEPE, 20, ' ') AS "Apresentador do artigo", RPAD(P.NACIONALIDADEPE, 20, ' ') AS "Nacionalidade", 
  RPAD(P.ENDERECOPE, 70, ' ') AS "Endereço" FROM pessoa P
	WHERE EXISTS 
	(
		SELECT * FROM evento Ev
		INNER JOIN edicao Ed
			ON Ev.codEv = Ed.codEv
		INNER JOIN inscrito I 
			ON I.codEv = Ed.codEv AND I.numEd = Ed.numEd
		INNER JOIN auxilio A
			ON A.codEvApr = I.codEv AND A.numEdApr = I.numEd AND A.idApr = I.idPart
		WHERE P.idPe = I.idPart 
			AND UPPER(A.tipoAux) = UPPER('Flight ticket aid') 
			AND UPPER(Ev.nomeEv) = UPPER('ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems')
	)
  ORDER BY P.NOMEPE ASC;
/
/
/*	Consulta - 4
	Descrição da pesquisa:

	Listagem do nome, nacionalidade, telefone/email, quantidade de auxílios e valor total de auxílios 
	recebidos com mais de 2 auxílios no evento ACM SIGSPATIAL International Conference on Advances in Geographic 
	Information Systems - que constam na base de dados.

	Atende aos seguintes itens pedidos:

	• Uma consulta que envolva pelo menos uma função de agregação, incluindo as cláusulas GROUP BY e HAVING.

	RESULTADO OBTIDO:

	Nome Completo    Contato (email/telefone)                 Qnt Auxílios Total Recebido
	---------------- ---------------------------------------- ------------ --------------
	Kevin Buchin     buchin@eindhoven.edu / +31(40)247-9111              3 $1,400.00 

*/
SELECT P.nomePe AS "Nome Completo", 
       RPAD( CONCAT(CONCAT(P.emailPe, ' / '), P.TELEFONEPE), 40, ' ') AS "Contato (email/telefone)",
       count(AUX.tipoAux) AS "Qnt Auxilios",
       to_char(sum(AUX.valorAux), 'FM$999,999,999,990.00') AS "Total Recebido"
    FROM pessoa P, auxilio AUX
    WHERE P.idPe = AUX.idApr
          AND AUX.codEvApr = (SELECT codEv 
                                    FROM evento
                                    WHERE UPPER(nomeEv) = 
                                          UPPER('ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems') )
    GROUP BY P.nomePe, RPAD( CONCAT(CONCAT(P.emailPe, ' / '), P.TELEFONEPE), 40, ' ')
    HAVING count(AUX.tipoAux) > 2;
/
/
/*	Consulta - 5
	Descrição da pesquisa:

	Listagem do nome do patrocinador, número da edição, tipo de auxílio (sendo apenas os auxílios de 
	Passagens Aéreas e de Alimentação) e o valor total do patrocínio que foi gasto com tais auxílios por edição
	no evento ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems e o valor total
	gasto com os auxílios especificados por empresa patrocinadora.

	Atende aos seguintes itens pedidos:

	• Uma consulta que utilize pelo menos uma cláusula CUBE ou ROLLUP.

	RESULTADO OBTIDO:

	Razão Social Patrocinador                        Edição Tipo do Auxílio     Valor Total        
	-------------------------------------------- ---------- ------------------- --------------------
	IBM Brasil Ltda.                                     19 Food aid            $200.00              
	IBM Brasil Ltda.                                     19 Flight ticket aid   $1,300.00            
	IBM Brasil Ltda.                                     19                     $1,500.00            
	IBM Brasil Ltda.                                     20 Flight ticket aid   $1,200.00            
	IBM Brasil Ltda.                                     20                     $1,200.00            
	IBM Brasil Ltda.                                     21 Flight ticket aid   $1,800.00            
	IBM Brasil Ltda.                                     21                     $1,800.00            
	IBM Brasil Ltda.                                                            $4,500.00            
	Microsoft Informatica Ltda.                          18 Food aid            $450.00              
	Microsoft Informatica Ltda.                          18                     $450.00              
	Microsoft Informatica Ltda.                                                 $450.00              
	Hewlett-Packard Brasil Ltda.                         19 Food aid            $200.00              
	Hewlett-Packard Brasil Ltda.                         19                     $200.00              
	Hewlett-Packard Brasil Ltda.                                                $200.00              
	Oracle do Brasil Sistemas Ltda.                      18 Flight ticket aid   $2,600.00            
	Oracle do Brasil Sistemas Ltda.                      18                     $2,600.00            
	Oracle do Brasil Sistemas Ltda.                                             $2,600.00            
	Vmware Software e Servicos Brasil LTDA.              19 Food aid            $200.00              
	Vmware Software e Servicos Brasil LTDA.              19 Flight ticket aid   $650.00              
	Vmware Software e Servicos Brasil LTDA.              19                     $850.00              
	Vmware Software e Servicos Brasil LTDA.                                     $850.00              
	Facebook Serviços Online do Brasil Ltda.             20 Food aid            $400.00              
	Facebook Serviços Online do Brasil Ltda.             20                     $400.00              
	Facebook Serviços Online do Brasil Ltda.             21 Food aid            $400.00              
	Facebook Serviços Online do Brasil Ltda.             21                     $400.00              
	Facebook Serviços Online do Brasil Ltda.                                    $800.00              

*/
SELECT PAT.RazaoSocialPat AS "Razão Social Patrocinador",
       AUX.numEdApr AS "Edição",
       AUX.tipoAux AS "Tipo do Auxílio",
       to_char(sum(AUX.valorAux), 'FM$999,999,999,990.00') AS "Valor Total"
       FROM patrocinador PAT, auxilio AUX
       WHERE PAT.cnpjPat = AUX.cnpjPat
          AND (AUX.tipoAux = 'Flight ticket aid' OR AUX.tipoAux = 'Food aid')
          AND AUX.codEvApr = (SELECT codEv FROM evento
                                WHERE nomeEv = 'ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems')
       GROUP BY PAT.RazaoSocialPat, ROLLUP(AUX.numEdApr, AUX.tipoAux);
/
/