/*
 * Carlos Humberto dos Santos Baqueta 7987456
 * Vanessa Apolinário de Lima     7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 03
 *
 * Script de PLSQL < scriptPLSQL.sql >
 * 
 *
 * ITENS A SEREM COBERTOS/RESPONDIDOS:
 * • pelo menos um problema que envolva a criação e o povoamento de uma (ou mais) 
 *   nova(s) tabela(s);
 * • pelo menos um problema que envolva a remoção ou a atualização de tuplas em uma 
 *   tabela já existente;
 * • um problema adicional, definido pela dupla.
 */
/
/
/
set serveroutput on; 
set verify off;
/
/
/
/
/**********************************************************************************************************
 **********************************************************************************************************
 ****************************FUNÇÕES***OU***PROCEDIMENTOS***EXTRAS*****************************************
 **********************************************************************************************************
 **********************************************************************************************************/
/
/
/
/*
 * Calcula-se o saldo final de cada patrocinio, contabilizando o que 
 * foi recebido como patrocinio e o que foi gasto com despesas do 
 * evento e com auxilio, representando o saldo gasto do determinado patrocinio.
 * OBS: Considerando o evento e edicao que o patrocinio foi conseguido, não a 
 * despesa ou auxilio.
 */
CREATE OR REPLACE PROCEDURE atualiza_saldo_patrocinio AS 
 BEGIN
  UPDATE patrocinio
	SET saldoPat = (
		(patrocinio.valorPat
    - NVL( (SELECT sum(NVL(auxilio.valorAux, 0) )
			FROM auxilio
			WHERE patrocinio.codEv = auxilio.codEvPat
        		AND patrocinio.numEd = auxilio.numEdPat
        		AND patrocinio.cnpjPat = auxilio.cnpjPat ), 0 )
        	--GROUP BY auxilio.codEvPat, auxilio.numEdPat, auxilio.cnpjPat) 
      - NVL( ( SELECT sum(despesa.valorDesp)
        FROM despesa
        WHERE patrocinio.codEv = despesa.codEvPat
        		AND patrocinio.numEd = despesa.numEdPat
        		AND patrocinio.cnpjPat = despesa.cnpjPat )
        	--GROUP BY despesa.codEvPat, despesa.numEdPat, despesa.cnpjPat)
    , 0 )
  ) 
);
END;
/
/
/*
 *	Calcula o saldo final da edicao contabilizando todos os patrocinios,
 * despesas e auxílios, através da soma dos resultados atualizados do campo
 * saldoPat da tabela patrocinio que se referem à mesma edicao; além
 * de contabilizar o valor recebido pelas taxas de inscrição.
 */
CREATE OR REPLACE PROCEDURE atualiza_saldo_edicao AS 
 BEGIN
  UPDATE edicao 
	SET saldoFinanceiroEd = ( edicao.taxaEd *
		(SELECT count(inscrito.idPart)
			FROM inscrito
			WHERE edicao.codEv = inscrito.codEv
				AND edicao.numEd = inscrito.numEd )
		+ NVL( (SELECT sum(patrocinio.saldoPat) 
			FROM patrocinio
      		WHERE edicao.codEv = patrocinio.codEv
        			AND edicao.numEd = patrocinio.numEd
        	GROUP BY patrocinio.numEd, patrocinio.codEv ), 0)
  );
END;
/
/*
 * Função que verifica se o nome do evento dado existe e retorna o código do evento.
**/
CREATE OR REPLACE FUNCTION get_codigo_evento(nome_evento IN evento.nomeEv%Type) RETURN evento.codEv%Type 
  IS
    codigo_evento evento.codEv%Type;
  BEGIN
  SELECT evento.codEv 
    INTO codigo_evento
    FROM evento
    WHERE UPPER(evento.nomeEv) = UPPER(nome_evento);
  RETURN codigo_evento;
  
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RETURN -1; 
END;
/
/
/
/**********************************************************************************************************
 **********************************************************************************************************
 *****************************************ITEM***01********************************************************
 **********************************************************************************************************
 **********************************************************************************************************/
/
/
/
/*
  ITEM RESPONDIDO:
  • pelo menos um problema que envolva a criação e o povoamento de uma (ou mais) nova(s) tabela(s);
  
  DESCRIÇÃO DO PROBLEMA:
  1 - Criar duas tabelas (avaliaArtigo e avaliaApresentador) para se avaliar artigos e apresentadores;
  2 - Criar um procedimento POPUL_AVAL_ART_APR que recebe como parâmetros o código do evento e o número 
      da edição para popular as duas tabelas criadas utilizando os artigos e apresentadores já inseridos
      no banco;
  3 - Criar dois procedimentos:
      (1) ATRIBUI_NOTA_ARTIGO que recebe como parâmetros o id do evento, o id da edição, o id do artigo,
      o e-mail do avaliador (que também está inserido na tabela pessoa) e a nota que o avaliador atribuiu
      ao artigo;
      (2) ATRIBUI_NOTA_APRESENTADOR que recebe como parâmetros o id do evento, o id da edição, o id do 
      palestrante, o e-mail do avaliador (que também está inserido na tabela pessoa) e a nota que o 
      avaliador atribuiu ao palestrante;
      Obs.: Somente organizadores podem valiar em artigos e em palestrantes.
  4 - Testar os procedimentos criados, verificando a corretude no tratamento das excessões que foram 
      tratadas.
  Obs.:Observar o tratamento de excessões relacionadas aos procedimentos criados. 

  TESTES REALIZADOS:
  Teste 1 
  - ENTRADA:
    ATRIBUI_NOTA_ARTIGO (1, 40, 137, 'xu@hku.edu', 6.8);
    ATRIBUI_NOTA_ARTIGO (1, 40, 122, 'austerus@uc.edu', 8.88);
    ATRIBUI_NOTA_ARTIGO (1, 40, 127, 'lee@psu.edu', 9.1);
    ATRIBUI_NOTA_ARTIGO (1, 40, 137, 'shell@microsoft.com', -5.78);
    ATRIBUI_NOTA_ARTIGO (1, 40, 137, 'shell@microsoft.com', 9.0);
    ATRIBUI_NOTA_ARTIGO (1, 40, 137, 'shell@mycrosoft.com', 9.0);
      
  - SAÍDA:
    NOTA CADASTRADA COM SUCESSO!
    Avaliador: Hong Xu
    Artigo: "Hybrid Parallelization Strategies for Large-Scale Machine Learning in SystemML"
    Nota: 6,8
    ----------------------------------------------------------------------------------------------
    NOTA CADASTRADA COM SUCESSO!
    Avaliador: Megasthenis Austerus
    Artigo: "Simple, Fast, and Scalable Reachability Oracle"
    Nota: 8,88
    ----------------------------------------------------------------------------------------------
    NOTA CADASTRADA COM SUCESSO!
    Avaliador: Chum Lee
    Artigo: "Finding the Cost-Optimal Path with Time Constraint over Time-Dependent Graphs"
    Nota: 9,1
    ----------------------------------------------------------------------------------------------
    "-5,78 " não é uma nota válida. Insira um valor entre 0 e 10.
    ----------------------------------------------------------------------------------------------
    NOTA CADASTRADA COM SUCESSO!
    Avaliador: Bill Shell
    Artigo: "Hybrid Parallelization Strategies for Large-Scale Machine Learning in SystemML"
    Nota: 9
    ----------------------------------------------------------------------------------------------
    "shell@mycrosoft.com " não corresponde a um e-mail de um organizador válido.
    ----------------------------------------------------------------------------------------------
  
  
  Teste 2 
  - ENTRADA:
    ATRIBUI_NOTA_APRESENTADOR (2, 21, 125, 'qi_he@linkedin.com', 5.98);
    ATRIBUI_NOTA_APRESENTADOR (2, 21, 128, 'jin.gao@mycrosoft.com', 3.99);
    ATRIBUI_NOTA_APRESENTADOR (2, 21, 132, 'xue.huang@microsoft.com', 10.96);
    ATRIBUI_NOTA_APRESENTADOR (2, 21, 199, 'amol.gh@ibmresearch.com', 7.65);
    ATRIBUI_NOTA_APRESENTADOR (2, 21, 132, 'amol.gh@ibmresearch.com', 7.65);
    ATRIBUI_NOTA_APRESENTADOR (2, 21, 144, 'yua_tian@ibmresearch.com', 7.75);
    ATRIBUI_NOTA_APRESENTADOR (2, 21, 144, 'yua_tian@ibmresearch.com', 7.75);
  
  - SAÍDA:
    Qi He já avaliou Weize Kong.
    ----------------------------------------------------------------------------------------------
    "jin.gao@mycrosoft.com" não corresponde a um e-mail de um organizador válido.
    ----------------------------------------------------------------------------------------------
    "10,96 " não é uma nota válida. Insira um valor entre 0 e 10.
    ----------------------------------------------------------------------------------------------
    Não há nenhum apresentador válido com o id informado.
    ----------------------------------------------------------------------------------------------
    Amol Ghoting já avaliou Karsten Jakobsen.
    ----------------------------------------------------------------------------------------------
    NOTA CADASTRADA COM SUCESSO!
    Avaliador: Yuanyuan Tian
    Apresentador: Chang Liu
    Nota: 7,75
    ----------------------------------------------------------------------------------------------
    Yuanyuan Tian já avaliou Chang Liu.
*/
/
DROP TABLE avaliaArtigo;
DROP TABLE avaliaApresentador;
/
DROP PROCEDURE ATRIBUI_NOTA_ARTIGO;
DROP PROCEDURE ATRIBUI_NOTA_APRESENTADOR;
DROP PROCEDURE POPUL_AVAL_ART_APR;
/
 -- Criação de avaliaArtigo
 CREATE TABLE avaliaArtigo (
    idArt NUMBER(5),    -- id do artigo apresentado
    idAva NUMBER(5),    -- idPe do avaliador
    nota FLOAT NOT NULL,
    CONSTRAINT PK_AVALIA_ARTIGO PRIMARY KEY (idArt, idAva),
    CONSTRAINT FK_AVA_ART_ARTIGO FOREIGN KEY (idArt)
      REFERENCES ARTIGO (idArt)
      ON DELETE CASCADE,
    CONSTRAINT FK_AVA_ART_PESSOA FOREIGN KEY (idAva) 
      REFERENCES PESSOA (idPe)
      ON DELETE CASCADE
    );
/
 -- Criação de avaliaApresentador
 CREATE TABLE avaliaApresentador(
    idApr NUMBER(5),    -- id do participante
    codev NUMBER(5),    -- codigo do evento
    numed NUMBER(5),    -- numero da edição
    idAva NUMBER(5),    -- idPe do avaliador
    nota FLOAT NOT NULL,
    CONSTRAINT PK_AVALIA_APRESENTADOR PRIMARY KEY (idApr, codev, numed, idAva),
    CONSTRAINT FK_AVA_APR_INSCRITO FOREIGN KEY (idApr, codev, numed) 
      REFERENCES INSCRITO(idPart, codEv, numEd)
      ON DELETE CASCADE,
    CONSTRAINT FK_AVA_APR_PESSOA FOREIGN KEY (idAva) 
      REFERENCES PESSOA (idPe)
      ON DELETE CASCADE
    );
/
ALTER SESSION SET NLS_LANGUAGE= 'PORTUGUESE' NLS_TERRITORY = 'BRAZIL';
SET VERIFY OFF;
/
set serveroutput on;
/
/
/
CREATE OR REPLACE PROCEDURE ATRIBUI_NOTA_ARTIGO (EV IN VARCHAR2, ED IN NUMBER, IDARTIGO IN NUMBER, EMAILORG IN VARCHAR2, NOTA IN FLOAT)
AS  
  flag NUMBER(1) DEFAULT 0;  -- DEFAULT
  AUX NUMBER(12);
  IDORG PESSOA.IDPE%TYPE;
  NOMEORG PESSOA.NOMEPE%TYPE;
  NOMEART ARTIGO.TITULOART%TYPE;
  
  --EXCEPTION ARTIGO_INVALIDO;
  --EXCEPTION EMAIL_INVALIDO;
  NOTA_INVALIDA EXCEPTION;
  
BEGIN
  -- Checa se o artigo existe:
  flag := 1;
  SELECT A.TITULOART INTO NOMEART FROM ARTIGO A 
    INNER JOIN EDICAO E
    ON A.CODEV = E.CODEV 
      AND A.NUMED = E.NUMED
    WHERE A.IDART = idArtigo
      AND A.CODEV = EV
      AND A.NUMED = ED;
  /*IF NUMLIN = 0 then 
    raise ; 
  END IF;*/
  
  -- Checa se o email corresponde a um organizador válido:
  flag := 2;
  SELECT P.IDPE, P.NOMEPE INTO IDORG, NOMEORG FROM PESSOA P
    INNER JOIN ORGANIZA O
    ON O.IDORG = P.IDPE
    WHERE TRIM(P.EMAILPE) = TRIM(EMAILORG)
      AND O.CODEV = EV
      AND O.NUMED = ED;
  
  -- Checa se a nota é um valor válido:
  IF NOTA < 0 OR NOTA > 10 THEN
    RAISE NOTA_INVALIDA;
  END IF;
  
  -- Insere a tupla na tabela
  INSERT INTO avaliaArtigo (idArt, idAva, nota) values (IDARTIGO, IDORG, nota);
    
  dbms_output.put_line (' NOTA CADASTRADA COM SUCESSO!');
  dbms_output.put_line ( '  Avaliador: ' || NOMEORG); 
  dbms_output.put_line ( '  Artigo: "' || NOMEART ||'"');
  dbms_output.put_line ( '  Nota: ' || NOTA);    

  EXCEPTION
    WHEN NOTA_INVALIDA 
      THEN dbms_output.put_line (' "' || nota || ' " não é uma nota válida. Insira um valor entre 0 e 10.');
    WHEN Dup_Val_On_Index 
      THEN dbms_output.put_line (' ' || NOMEORG || ' já avaliou esse artigo.'); 
    WHEN no_data_found THEN 
        if flag = 1 then --
          dbms_output.put_line (' "' || idArtigo || ' " não é um Id de artigo válido.'); 
        end if;
        if flag = 2 then--
          dbms_output.put_line (' "' || emailOrg || ' " não corresponde a um e-mail de um organizador válido.');
        end if;
    WHEN Others 
      THEN dbms_output.put_line (SQLERRM); 

END ATRIBUI_NOTA_ARTIGO;
/
/
CREATE OR REPLACE PROCEDURE ATRIBUI_NOTA_APRESENTADOR (EV IN VARCHAR2, ED IN NUMBER, IDAPRESENTADOR IN NUMBER, EMAILORG IN VARCHAR2, NOTA IN FLOAT)
AS  
  flag NUMBER(1) DEFAULT 0;  -- DEFAULT
  AUX NUMBER(12);
  IDORG PESSOA.IDPE%TYPE;
  NOMEORG PESSOA.NOMEPE%TYPE;
  NOMEART ARTIGO.TITULOART%TYPE;
  IDAUX ARTIGO.IDAPR%TYPE;
  NOMEAPR PESSOA.NOMEPE%TYPE;
  NOTA_INVALIDA EXCEPTION;
  
BEGIN
  -- Checa se o id do apresentador informado É VÁLIDO
  flag := 1;
  SELECT DISTINCT A.IDAPR INTO IDAUX FROM ARTIGO A 
    INNER JOIN EDICAO E
    ON A.CODEV = E.CODEV 
      AND A.NUMED = E.NUMED
    WHERE A.CODEV = EV
      AND A.NUMED = ED
      AND A.IDAPR = IDAPRESENTADOR;

  -- Checa se o email corresponde a um organizador válido:
  flag := 2;
  SELECT P.IDPE, P.NOMEPE INTO IDORG, NOMEORG FROM PESSOA P
    INNER JOIN ORGANIZA O
    ON O.IDORG = P.IDPE
    WHERE TRIM(P.EMAILPE) = TRIM(EMAILORG)
      AND O.CODEV = EV
      AND O.NUMED = ED;

  -- Checa se a nota é um valor válido:
  IF NOTA < 0 OR NOTA > 10 THEN
    RAISE NOTA_INVALIDA;
  END IF;

  -- Captura nome do apresentador para exibí-lo posteriormente:
  SELECT P.NOMEPE INTO NOMEAPR FROM PESSOA P
    WHERE P.IDPE = IDAPRESENTADOR;

  -- Insere a tupla na tabela avaliaApresentador
  INSERT INTO avaliaApresentador (IDAPR, CODEV, NUMED, IDAVA, NOTA) values (IDAPRESENTADOR, EV, ED, IDORG, nota);

  dbms_output.put_line (' NOTA CADASTRADA COM SUCESSO!');
  dbms_output.put_line ( '  Avaliador: ' || NOMEORG); 
  dbms_output.put_line ( '  Apresentador: ' || NOMEAPR);
  dbms_output.put_line ( '  Nota: ' || NOTA);    

  EXCEPTION
    WHEN NOTA_INVALIDA 
      THEN dbms_output.put_line ( ' "' || nota || ' " não é uma nota válida. Insira um valor entre 0 e 10.');
    WHEN Dup_Val_On_Index 
      THEN dbms_output.put_line (' '||NOMEORG || ' já avaliou ' || NOMEAPR ||'.'); 
    WHEN no_data_found THEN 
        if flag = 1 then --
          dbms_output.put_line (' Não há nenhum apresentador válido com o id informado.'); 
        end if;
        if flag = 2 then--
          dbms_output.put_line (' "' || emailOrg || '" não corresponde a um e-mail de um organizador válido.');
        end if;
    WHEN Others 
      THEN dbms_output.put_line (SQLERRM); 

END ATRIBUI_NOTA_APRESENTADOR;
/
/
-- Código PL/SQL relacionado com o povoamento das duas tabelas criadas (COM NOTAS ENTRE 2.0 E 10):
CREATE OR REPLACE PROCEDURE POPUL_AVAL_ART_APR (CODEV_ IN NUMBER, NUMED_ IN NUMBER) 
AS
  nota FLOAT := 4.0;
  IDAUX ARTIGO.IDAPR%TYPE;
  
  CURSOR ART_LIST IS 
    SELECT A.IDART FROM ARTIGO A
    WHERE A.CODEV = CODEV_
    AND A.NUMED = NUMED_; 
  ART_INFO ARTIGO.IDART%type; -- guarda o id do artigo
 
  CURSOR ORG_LIST IS
    SELECT P.IDPE FROM PESSOA P
    INNER JOIN ORGANIZA O
    ON O.IDORG = P.IDPE
    WHERE O.CODEV = CODEV_
    AND O.NUMED = NUMED_;
  ORG_INFO ORGANIZA.IDORG%Type; -- guarda o id do organizador
  
BEGIN
  
  OPEN ART_LIST;    -- Abre a lista de ARTIGOS da edição e do evento informados 
  OPEN ORG_LIST;    -- Abre a lista de organizadores da edição e do evento informados     
  
  LOOP
    FETCH ART_LIST INTO ART_INFO; 
    EXIT WHEN ART_LIST%NOTFOUND;    -- Condição de paradA
    
    FETCH ORG_LIST INTO ORG_INFO;
    EXIT WHEN ORG_LIST%NOTFOUND;    -- Condição de parada
             
    NOTA := NOTA + 0.5;
    NOTA := MOD (NOTA, 10);
    IF NOTA < 2.0 
      THEN NOTA := 4.0;
    END IF;
    --dbms_output.put_line ('ARTIGO: ' || ART_INFO || ', ORG: ' ||ORG_INFO || ', NOTA: ' || NOTA);
    
    -- Insere a tupla na tabela avaliaArtigo
    INSERT INTO avaliaArtigo (idArt, idAva, nota) values (ART_INFO, ORG_INFO, nota);
    
    -- Busca o id do apresentador do artigo com id ART_INFO:
    SELECT A.IDAPR INTO IDAUX FROM ARTIGO A 
      WHERE A.IDART = ART_INFO;
    
    -- Insere a tupla na tabela avaliaApresentador
    INSERT INTO avaliaApresentador (IDAPR, CODEV, NUMED, IDAVA, NOTA) values (IDAUX, CODEV_, NUMED_, ORG_INFO, nota);
    
  END LOOP;
  CLOSE ORG_LIST; -- FECHA O CURSOR DE ORGANIZADORES
  CLOSE ART_LIST;
END POPUL_AVAL_ART_APR;
/
/
-------------------------------- MAIN ---------------------------------------
DECLARE
  CURSOR ED IS
    SELECT E.CODEV, E.NUMED FROM EDICAO E;
  EDINFO ED%ROWTYPE;
 BEGIN 
 -- População das tabelas avaliaArtigo e avaliaApresentador criadas
  OPEN ED;
  LOOP
    FETCH ED INTO EDINFO; 
    EXIT WHEN ED%NotFound;
    POPUL_AVAL_ART_APR(EDINFO.CODEV, EDINFO.NUMED);
  END LOOP;
  CLOSE ED;
  
  dbms_output.put_line ('');
  
  -- Teste do procedimento ATRIBUI_NOTA_ARTIGO:
  dbms_output.put_line ('• Saídas do teste 1 da resposta ao item 1:');
  dbms_output.put_line ('');
  ATRIBUI_NOTA_ARTIGO (1, 40, 137, 'xu@hku.edu', 6.8);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_ARTIGO (1, 40, 122, 'austerus@uc.edu', 8.88);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_ARTIGO (1, 40, 127, 'lee@psu.edu', 9.1);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_ARTIGO (1, 40, 137, 'shell@microsoft.com', -5.78);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_ARTIGO (1, 40, 137, 'shell@microsoft.com', 9.0);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_ARTIGO (1, 40, 137, 'shell@mycrosoft.com', 9.0);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  dbms_output.put_line ('');
  
  -- Teste do procedimento ATRIBUI_NOTA_APRESENTADOR:
  dbms_output.put_line ('• Saídas do teste 2 da resposta ao item 1:');
  dbms_output.put_line ('');
  ATRIBUI_NOTA_APRESENTADOR (2, 21, 125, 'qi_he@linkedin.com', 5.98);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_APRESENTADOR (2, 21, 128, 'jin.gao@mycrosoft.com', 3.99);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_APRESENTADOR (2, 21, 132, 'xue.huang@microsoft.com', 10.96);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_APRESENTADOR (2, 21, 199, 'amol.gh@ibmresearch.com', 7.65);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_APRESENTADOR (2, 21, 132, 'amol.gh@ibmresearch.com', 7.65);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_APRESENTADOR (2, 21, 144, 'yua_tian@ibmresearch.com', 7.75);
  dbms_output.put_line (' ----------------------------------------------------------------------------------------------');
  ATRIBUI_NOTA_APRESENTADOR (2, 21, 144, 'yua_tian@ibmresearch.com', 7.75);
  dbms_output.put_line ('');
  
END;
/
/
/
/**********************************************************************************************************
 **********************************************************************************************************
 *****************************************ITEM***02********************************************************
 **********************************************************************************************************
 **********************************************************************************************************/
/
/
/
/*
 * Pelo menos um problema que envolva a remoção ou a atualização de tuplas em uma 
tabela já existente.

 * O usuário passa os dados do Nome do Evento, Número da Edição, Tipo de auxílio e Novo valor para aquele auxílio,
com esses dados, o valor de todos os auxílios do tipo de auxílios daquela edição do evento, dados pelo usuário 
são alterados para o novo valor passado. Por fim, os valores dos patrocínios e da saldo da edição são atualizados.

 * VERIFICAÇÃO DE ERROS:
   - Verifica se o tipo de auxílio existe;
   - Verifica se o evento e edição existem;
   - Verifica se o valor inserido não extrapola o valor dos patrocínios;
   - Verifica por erros no update das tuplas;
   - Verifica outros erros.
**/
CREATE OR REPLACE PROCEDURE altera_valor_auxilio(nome_evento evento.nomeEv%Type, edicao_evento edicao.numEd%Type,
                                                 tipo_auxilio auxilio.tipoAux%Type, valor_aux Varchar2) AS
  -- Variavel para encontrar o evento e edição
  codigo_evento evento.codEv%Type;
  numero_edicao edicao.numEd%Type;
  -- Variaveis para impressão
  nome_pessoa pessoa.nomePe%Type;
  razao_social patrocinador.razaoSocialPat%Type;
  -- Variáveis para receber o tipo de auxilio e seu novo valor
  novo_valor auxilio.valorAux%Type;
  dif auxilio.valorAux%Type;
  saldo_patrocinio patrocinio.saldoPat%Type;
  -- Cursor que busca todos os auxilios do tipo descrito
  CURSOR cursor_auxilios (codigo_evento evento.codEv%Type, 
        edicao_evento edicao.numEd%Type, tipo_auxilio auxilio.tipoAux%Type)
        IS SELECT *
        FROM auxilio
        WHERE UPPER(auxilio.tipoAux) = UPPER(tipo_auxilio)
         AND auxilio.codEvApr = codigo_evento
         AND auxilio.numEdApr = edicao_evento;
  -- Variável de acesso ao cursor
  auxilio_substituir cursor_auxilios%RowType;
  -- Excepetions
  evento_inexistente EXCEPTION;
  valor_negativo     EXCEPTION;
  nenhum_auxilio     EXCEPTION;
  excede_valor       EXCEPTION;
BEGIN 
  -- Verifica se o evento dado existe
  codigo_evento := get_codigo_evento(nome_evento);
  IF codigo_evento = -1 THEN
    RAISE evento_inexistente;
  END IF;
  -- Verifica a existencia da edição dada
  SELECT edicao.numEd 
    INTO numero_edicao
    FROM edicao
    WHERE edicao.codEv = codigo_evento
     AND edicao.numEd = edicao_evento;
  
  -- Verifica se o valor passado é realmente um número
  novo_valor := to_number(valor_aux, '99999.99');
  -- Verifica se o valor não é negativo
  IF novo_valor < 0.00 THEN
    RAISE valor_negativo;
  END IF;
  
  OPEN cursor_auxilios(codigo_evento, edicao_evento, tipo_auxilio);
	  FETCH cursor_auxilios INTO auxilio_substituir;
	  IF cursor_auxilios%NOTFOUND THEN
	   RAISE nenhum_auxilio;
	  END IF;
	  
	  LOOP
		  dif := novo_valor - auxilio_substituir.valorAux;
		  -- Se a valor novo for menor que o valor antigo, só faz a alteração
		  -- Não realiza nenhuma alteração se o valor for igual
		  IF (dif < 0) THEN
			  UPDATE auxilio SET auxilio.valorAux = novo_valor 
				WHERE codEvApr = auxilio_substituir.codEvApr
					  AND numEdApr = auxilio_substituir.numEdApr
					  AND idApr = auxilio_substituir.idApr;
		  ELSE 
			  IF (dif > 0) THEN
				-- verifica se pode fazer a substituição
				-- pega o patrocinio e testa subtrair o valor, se funcionar, faz o update
				SELECT saldoPat INTO saldo_patrocinio 
					  FROM patrocinio 
					  WHERE cnpjPat = auxilio_substituir.cnpjPat
							AND codEv = auxilio_substituir.codEvPat
							AND numEd = auxilio_substituir.numEdPat;
				IF saldo_patrocinio - dif >= 0 THEN
					-- Atualiza
					UPDATE auxilio SET auxilio.valorAux = novo_valor 
					  WHERE codEvApr = auxilio_substituir.codEvApr
							AND numEdApr = auxilio_substituir.numEdApr
							AND idApr = auxilio_substituir.idApr;
				ELSE
				  -- Variaveis de impressão
				  SELECT razaoSocialPat INTO razao_social FROM patrocinador WHERE cnpjPat = auxilio_substituir.cnpjPat;
				  SELECT nomePe INTO nome_pessoa FROM pessoa WHERE idPe = auxilio_substituir.idApr;
				  RAISE excede_valor;
				END IF;
			  END IF;
		  END IF;

	  FETCH cursor_auxilios INTO auxilio_substituir;
	  EXIT WHEN cursor_auxilios%NOTFOUND;
	  END LOOP;
  CLOSE cursor_auxilios;
  
  atualiza_saldo_patrocinio();
  atualiza_saldo_edicao();
  dbms_output.put_line ('Valor do auxílio "' || tipo_auxilio || '" foi alterado com sucesso.');
  COMMIT;
 EXCEPTION 
 WHEN evento_inexistente
 THEN dbms_output.put_line ('Evento não cadastrado.');
 WHEN NO_DATA_FOUND
 THEN dbms_output.put_line ('Edição do evento não cadastrada.');
 WHEN VALUE_ERROR
 THEN dbms_output.put_line ('Novo valor do auxílio está errado.'); 
 WHEN valor_negativo
 THEN dbms_output.put_line ('Novo valor do auxílio deve ser positivo.'); 
 WHEN nenhum_auxilio
 THEN dbms_output.put_line ('Não há nenhum auxílio deste tipo nesta edição.'); 
 WHEN excede_valor
 THEN ROLLBACK;
         -- Imprime as tuplas com problema 
         dbms_output.put_line ('O valor não pode ser alterado, pois o Saldo do Patrocinio é de ' || 
                               to_char(saldo_patrocinio, 'FM$999,999,999,990.00') || 
                               ' e o valor a ser adicionado é de ' || to_char(dif, 'FM$999,999,999,990.00') );
         dbms_output.put_line ('  - Nome do evento (ID): ' || nome_evento || ' (' || auxilio_substituir.codEvApr || '), ');
         dbms_output.put_line ('  - Edição: '|| auxilio_substituir.numEdApr || ', ');
         dbms_output.put_line ('  - Nome Apresentador (ID): '|| nome_pessoa || ' (' || auxilio_substituir.idApr || '), ');
         dbms_output.put_line ('  - Patrocinador (CNPJ): '|| razao_social || ' (' || auxilio_substituir.cnpjPat || ')');
 WHEN Others 
 THEN dbms_output.put_line ('Outro Erro.' ); 
END; 
/
/*
 * EXECUÇÃO 01: Erro Nome do evento
   - Nome do evento: qualquer string
   - Edição: 10
   - Tipo de Auxílio: tipo auxílio
   - Novo valor do auxílio: 100
 * RESULTADO: "Evento não cadastrado."
**/
EXECUTE altera_valor_auxilio('Não é um evento', 10, 'tipo auxílio', '10');
/
/*
 * EXECUÇÃO 02: Erro número Edição do evento
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 10
   - Tipo de Auxílio: tipo auxílio
   - Novo valor do auxílio: 100
 * RESULTADO: "Edição do evento não cadastrada."
**/
EXECUTE altera_valor_auxilio('International Conference on Very Large Data Bases', 10, 'tipo auxílio', '10');
/
/*
 * EXECUÇÃO 03: Valor do auxílio Inválido
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Tipo de Auxílio: tipo auxílio
   - Novo valor do auxílio: letras10
 * RESULTADO: "Novo valor do auxílio está errado."
**/
EXECUTE altera_valor_auxilio('International Conference on Very Large Data Bases', 40, 'tipo auxílio', 'letras10');
/
/*
 * EXECUÇÃO 04: Tipo Auxílio não encontrado
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Tipo de Auxílio: nao_existe
   - Novo valor do auxílio: 100.00
 * RESULTADO: "Não há nenhum auxílio deste tipo nesta edição."
**/
EXECUTE altera_valor_auxilio('International Conference on Very Large Data Bases', 40, 'nao_existe', '100.00');
/
/*
 * CONSULTA 01: Tabela base (sem alterações)
 * RESULTADO:
Nome do Evento                                       Número da Edição CNPJ Patrocinador Valor do Auxílio     Tipo do Auxílio 
---------------------------------------------------- ---------------- ----------------- ----------------- -------------------
International Conference on Very Large Data Bases                  40   6990590000204   $100.00              Food aid 
International Conference on Very Large Data Bases                  40   6990590000204   $100.00              Food aid 
International Conference on Very Large Data Bases                  40  61797924000155   $200.00              Food aid 
International Conference on Very Large Data Bases                  40   6990590000204   $100.00              Food aid 
International Conference on Very Large Data Bases                  40  33372251000156   $100.00              Food aid 
**/
SELECT evento.nomeEv AS "Nome do Evento", 
       auxilio.numEdApr AS "Número da Edição", 
       to_char(auxilio.cnpjPat, '99999999999999') AS "CNPJ Patrocinador", 
       to_char(auxilio.valorAux, 'FM$999,999,999,990.00') AS "Valor do Auxílio", 
       auxilio.tipoAux AS "Tipo do Auxílio"
  FROM evento JOIN auxilio ON (evento.codEv = auxilio.codEvApr)
  WHERE UPPER(auxilio.tipoAux) = UPPER('Food Aid')
        AND auxilio.numEdApr = 40
        AND evento.nomeEv = 'International Conference on Very Large Data Bases';
/
/*
 * EXECUÇÃO 05: Novo valor auxílio ultrapassa valor de patrocínio disponível
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Tipo de Auxílio: food aid
   - Novo valor do auxílio: 600.00
 * RESULTADO: "O valor não pode ser alterado, pois o Saldo do Patrocinio é de $200.00 e o valor a ser adicionado é de $300.00
                - Nome do evento (ID): International Conference on Very Large Data Bases (1), 
                - Edição: 40, 
                - Nome Apresentador (ID): Wolf Roediger (332), 
                - Patrocinador (CNPJ): Hewlett-Packard Brasil Ltda. (61797924000155)"
**/
EXECUTE altera_valor_auxilio('International Conference on Very Large Data Bases', 40, 'food aid', '600.00');
/
/*
 * CONSULTA 02: Tabela depois de execução que o valor ultrapassa os patrocínios (sem alterações)
 * RESULTADO:
Nome do Evento                                       Número da Edição CNPJ Patrocinador Valor do Auxílio     Tipo do Auxílio 
---------------------------------------------------- ---------------- ----------------- ----------------- -------------------
International Conference on Very Large Data Bases                  40   6990590000204   $100.00              Food aid  
International Conference on Very Large Data Bases                  40   6990590000204   $100.00              Food aid  
International Conference on Very Large Data Bases                  40  61797924000155   $200.00              Food aid  
International Conference on Very Large Data Bases                  40   6990590000204   $100.00              Food aid  
International Conference on Very Large Data Bases                  40  33372251000156   $100.00              Food aid 
**/
SELECT evento.nomeEv AS "Nome do Evento", 
       auxilio.numEdApr AS "Número da Edição", 
       to_char(auxilio.cnpjPat, '99999999999999') AS "CNPJ Patrocinador", 
       to_char(auxilio.valorAux, 'FM$999,999,999,990.00') AS "Valor do Auxílio", 
       auxilio.tipoAux AS "Tipo do Auxílio"
  FROM evento JOIN auxilio ON (evento.codEv = auxilio.codEvApr)
  WHERE UPPER(auxilio.tipoAux) = UPPER('Food Aid')
        AND auxilio.numEdApr = 40
        AND evento.nomeEv = 'International Conference on Very Large Data Bases';
/
/*
 * EXECUÇÃO 06: Execução bem sucedida
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Tipo de Auxílio: food aid
   - Novo valor do auxílio: 300.00
 * RESULTADO: "Valor do auxílio "food aid" foi alterado com sucesso."
**/
EXECUTE altera_valor_auxilio('International Conference on Very Large Data Bases', 40, 'food aid', '300.00');

/*
 * CONSULTA 03: Tabela com alterações (todos os preços devem estar setados para $300.00 )
 * RESULTADO:
Nome do Evento                                       Número da Edição CNPJ Patrocinador Valor do Auxílio     Tipo do Auxílio  
---------------------------------------------------- ---------------- ----------------- ----------------- -------------------
International Conference on Very Large Data Bases                  40   6990590000204   $300.00              Food aid   
International Conference on Very Large Data Bases                  40   6990590000204   $300.00              Food aid   
International Conference on Very Large Data Bases                  40  61797924000155   $300.00              Food aid   
International Conference on Very Large Data Bases                  40   6990590000204   $300.00              Food aid   
International Conference on Very Large Data Bases                  40  33372251000156   $300.00              Food aid   
**/
SELECT evento.nomeEv AS "Nome do Evento", 
       auxilio.numEdApr AS "Número da Edição", 
       to_char(auxilio.cnpjPat, '99999999999999') AS "CNPJ Patrocinador", 
       to_char(auxilio.valorAux, 'FM$999,999,999,990.00') AS "Valor do Auxílio", 
       auxilio.tipoAux AS "Tipo do Auxílio"
  FROM evento JOIN auxilio ON (evento.codEv = auxilio.codEvApr)
  WHERE UPPER(auxilio.tipoAux) = UPPER('Food Aid')
        AND auxilio.numEdApr = 40
        AND evento.nomeEv = 'International Conference on Very Large Data Bases';
/
/
/
/**********************************************************************************************************
 **********************************************************************************************************
 *****************************************ITEM***03********************************************************
 **********************************************************************************************************
 **********************************************************************************************************/
/
/
/
/*
 * Problema adicional definido pela dupla

 * O usuário insere o nome do evento, edição e os valor da despesa e sua descrição, e pode ou não inserir o CNPJ de um 
patrocinador. A nova despesa é inserida na base de dados caso haja saldo suficiente no patrocinio daquela edição oferecido
pelo patrocinador para pagar a nova despesa. Caso o patrocinador não seja passado pelo usuário, encontra-se o maior saldo 
de patrocinio daquela edição, verifica se a despesa pode ser paga com aquele valor, e caso possa, insere a nova despesa 
na base de dados com aquele patrocínio. Por fim, atualiza o saldo do Patrocínio e da edição do evento.

 * VERIFICAÇÃO DE ERROS:
   - Verifica se o evento e edição existem;
   - Verifica se o valor da despesa é válido e positivo;
   - Verifica a existência do CNPJ do patrocinador;
   - Verifica se há patrocínio daquele patrocinador na edição do evento que está sendo considerada;
   - Verifica se o valor inserido não extrapola o valor dos patrocínios;
   - Verifica outros erros.
**/
set serveroutput on; 
set verify off;
/
DROP PROCEDURE insere_despesa;
/
CREATE OR REPLACE PROCEDURE insere_despesa(nome_evento evento.nomeEv%Type, edicao_evento edicao.numEd%Type,
                                                 descricao_despesa despesa.descricaoDesp%Type, valor_despesa Varchar2,
                                                 cnpj_patrocinador patrocinio.cnpjPat%Type) AS

  CURSOR cursor_patrocinios_com_cnpj (codigo_evento evento.codEv%Type, 
        edicao_evento edicao.numEd%Type, cnpj_patrocinador patrocinio.cnpjPat%Type)
        IS SELECT *
        FROM patrocinio
        WHERE cnpjPat = cnpj_patrocinador
         AND codEv = codigo_evento
         AND numEd = edicao_evento;
  -- Variável de acesso ao cursor
  patrocinio_despesa cursor_patrocinios_com_cnpj%RowType;
  
  -- Váriavel para encontrar o evento e edição
  codigo_evento evento.codEv%Type;
  numero_edicao edicao.numEd%Type;
  
  -- Variável para verificação do valor da despesa
  novo_valor despesa.valorDesp%Type;

  -- Variável para encontrar o próximo código da despesa
  cod_despesa despesa.codDesp%Type;

  -- Variável para verificar se o CNPJ existe
  cnpj_temp patrocinador.cnpjPat%Type;

  CURSOR cursor_patrocinios (codigo_evento evento.codEv%Type, edicao_evento edicao.numEd%Type, cnpj_patrocinador patrocinador.cnpjPat%Type)
        IS SELECT *
            FROM (SELECT * FROM patrocinio
                    WHERE cnpjPat = cnpj_patrocinador
                       AND codEv = codigo_evento
                       AND numEd = edicao_evento
                    ORDER BY saldoPat DESC)
            WHERE rownum = 1;
  patrocinio_item cursor_patrocinios%RowType;

  flag Varchar2(10);

  -- Exceptions
  evento_inexistente      EXCEPTION;
  valor_negativo          EXCEPTION;
  patrocinio_inexistente  EXCEPTION;
  excede_valor            EXCEPTION;
BEGIN
  -- Verifica se o evento dado existe
  codigo_evento := get_codigo_evento(nome_evento);
  IF codigo_evento = -1 THEN
    RAISE evento_inexistente;
  END IF;

  -- Verifica a existencia da edição dada
  flag := 'edicao';
  SELECT edicao.numEd 
    INTO numero_edicao
    FROM edicao
    WHERE edicao.codEv = codigo_evento
     AND edicao.numEd = edicao_evento;
  
  -- Verifica se o valor passado é realmente um número
  novo_valor := to_number(valor_despesa, '99999.99');
  -- Verifica se o valor não é negativo
  IF novo_valor < 0.00 THEN
    RAISE valor_negativo;
  END IF;

  -- Encontra o próximo código da despesa
  SELECT max(codDesp)
    INTO cod_despesa
    FROM despesa;
  cod_despesa := cod_despesa + 1;

  -- Verifica se foi passado algum CNPJ
  IF cnpj_patrocinador IS NULL THEN
    -- Seleciona o maior saldo de Patrocinio
    SELECT *
      INTO patrocinio_despesa
      FROM (SELECT * FROM patrocinio
              WHERE codEv = codigo_evento
                 AND numEd = edicao_evento
              ORDER BY saldoPat DESC)
      WHERE rownum = 1;
  ELSE
    -- Verifica se o CNPJ existe
    flag := 'cnpj';
    SELECT cnpjPat
      INTO cnpj_temp
      FROM patrocinador
      WHERE cnpjPat = cnpj_patrocinador;

    -- Seleciona o maior saldo Patrocinio daquele patrocinador para aquela edicao
    OPEN cursor_patrocinios(codigo_evento, edicao_evento, cnpj_patrocinador);
      FETCH cursor_patrocinios INTO patrocinio_item;
      IF cursor_patrocinios%NOTFOUND THEN
       RAISE patrocinio_inexistente;
      ELSE 
        patrocinio_despesa := patrocinio_item;
      END IF;
    CLOSE cursor_patrocinios;
  END IF;

  IF patrocinio_despesa.saldoPat > novo_valor THEN
    -- Insere a despesa
    INSERT INTO DESPESA VALUES(codigo_evento, numero_edicao, cod_despesa, patrocinio_despesa.cnpjPat, patrocinio_despesa.codEv, 
                               patrocinio_despesa.numEd, SYSDATE, novo_valor, descricao_despesa);
  ELSE
    RAISE excede_valor;
  END IF;


  atualiza_saldo_patrocinio();
  atualiza_saldo_edicao();
  dbms_output.put_line ('Despesa "' || descricao_despesa || '" com valor: ' || 
                        to_char(valor_despesa, 'FM$999,999,999,990.00') || ' foi alterado com sucesso.');
  COMMIT;

  EXCEPTION
    WHEN evento_inexistente
      THEN dbms_output.put_line ('Evento não cadastrado.');
    WHEN NO_DATA_FOUND THEN
      IF flag = 'edicao'
        THEN dbms_output.put_line ('Edição do evento não cadastrada.');
      ELSE
        dbms_output.put_line ('CNPJ não cadastrado.');
      END IF;
    WHEN VALUE_ERROR
      THEN dbms_output.put_line ('Valor da Despesa é inválido.'); 
    WHEN valor_negativo
      THEN dbms_output.put_line ('Valor da Despesa deve ser positivo'); 
    WHEN patrocinio_inexistente
      THEN dbms_output.put_line ('Não há patrocínios para está edição do evento com este patrocinador.'); 
    WHEN excede_valor THEN
      IF cnpj_patrocinador IS NULL THEN
        dbms_output.put_line ('O Saldo de nenhum patrocínio é suficiente para esta despesa, o maior saldo é de apenas ' || 
                              to_char(patrocinio_despesa.saldoPat, 'FM$999,999,999,990.00') || '.'); 
      ELSE
        dbms_output.put_line ('O Saldo do Patrocínio de CNPJ ' || cnpj_patrocinador || ' é insuficiente para esta despesa.'); 
      END IF;
    WHEN Others
      THEN dbms_output.put_line ('Outro Erro.' ); 

END;
/
/
/
/*
 * EXECUÇÃO 01: Erro Nome do evento
   - Nome do evento: nome_errado
   - Edição: 10
   - Descrição da Despesa: Descricao_despesa
   - Valor da Despesa: 100.00
   - CNPJ do Patrocinador (opcional) : NULL
 * RESULTADO: "Evento não cadastrado."
**/
EXECUTE insere_despesa('nome_errado', 10, 'Descricao_despesa', '100.00', NULL);
/
/*
 * EXECUÇÃO 02: Erro número Edição do evento
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 10
   - Descrição da Despesa: Descricao_despesa
   - Valor da Despesa: 100.00
   - CNPJ do Patrocinador (opcional) : NULL
 * RESULTADO: "Edição do evento não cadastrada."
**/
EXECUTE insere_despesa('International Conference on Very Large Data Bases', 10, 'Descricao_despesa', '100.00', NULL);
/
/*
 * EXECUÇÃO 03: Valor da Despesa Inválido
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Descrição da Despesa: Descricao_despesa
   - Valor da Despesa: letras100
   - CNPJ do Patrocinador (opcional) : NULL
 * RESULTADO: "Valor da Despesa é inválido."
**/
EXECUTE insere_despesa('International Conference on Very Large Data Bases', 40, 'Descricao_despesa', 'letras10', NULL);
/
/*
 * EXECUÇÃO 04: CNPJ não encontrado
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Tipo de Auxílio: nao_existe
   - Novo valor do auxílio: 100.00
   - Descrição da Despesa: Descricao_despesa
   - Valor da Despesa: letras100
   - CNPJ do Patrocinador (opcional) : 11111111111111
 * RESULTADO: "CNPJ não cadastrado."
**/
EXECUTE insere_despesa('International Conference on Very Large Data Bases', 40, 'Descricao_despesa', '100.00', '11111111111111');
/
/*
 * EXECUÇÃO 05: Não há patrocinio com este CNPJ para a edição dada
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Descrição da Despesa: Descricao_despesa
   - Valor da Despesa: 100.00
   - CNPJ do Patrocinador (opcional) : 59456277000176
 * RESULTADO: "Não há patrocínios para está edição do evento com este patrocinador."
**/
EXECUTE insere_despesa('International Conference on Very Large Data Bases', 40, 'Descricao_despesa', '100.00', '59456277000176');
/
/*
 * EXECUÇÃO 06: O valor da Despesa Ultrapassa o Valor do Patrocínio dado um CNPJ
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Descrição da Despesa: Descricao_despesa
   - Valor da Despesa: 100.00
   - CNPJ do Patrocinador (opcional) : 57286247000133
 * RESULTADO: "O Saldo do Patrocínio de CNPJ 57286247000133 é insuficiente para esta despesa."
**/
EXECUTE insere_despesa('International Conference on Very Large Data Bases', 40, 'Marketing Digital', '500.00', '57286247000133');
/
/*
 * EXECUÇÃO 07: O valor da Despesa Ultrapassa o Valor de todos os Patrocínios individualmente
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Descrição da Despesa: Marketing Digital
   - Valor da Despesa: 500.00
   - CNPJ do Patrocinador (opcional) : 57286247000133
 * RESULTADO: "O Saldo do Patrocínio de CNPJ 57286247000133 é insuficiente para esta despesa."????
**/
EXECUTE insere_despesa('International Conference on Very Large Data Bases', 40, 'Marketing Digital', '5000.00', NULL);
/
/
/
/*
 * CONSULTA 01: Tabela base (sem alterações)
 * RESULTADO:
Nome do Evento                                                                         Edição Descrição da Despesa   CNPJ Patrocinador Valor da Despesa  Saldo Patrocinador 
-------------------------------------------------------------------------------------- ------- ---------------------- ----------------- ----------------- --------------------
International Conference on Very Large Data Bases                                           39 Marketing digital      6990590000204     $1,500.00         $0.00                
ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems       18 Marketing digital       6990590000204    $2,000.00         $0.00                
ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems       20 Marketing digital      60316817000103    $1,500.00         $1,900.00            

**/
SELECT evento.nomeEv AS "Nome do Evento", 
       despesa.numEd AS "Edição", 
       despesa.descricaoDesp AS "Descrição da Despesa",
       to_char(despesa.cnpjPat, '99999999999999') AS "CNPJ Patrocinador", 
       to_char(despesa.valorDesp, 'FM$999,999,999,990.00') AS "Valor da Despesa", 
       to_char(patrocinio.saldoPat, 'FM$999,999,999,990.00') AS "Saldo Patrocinador"
  FROM evento JOIN despesa ON (evento.codEv = despesa.codEv)
       JOIN patrocinio ON (despesa.codEv = patrocinio.codEv AND despesa.numEd = patrocinio.numEd AND despesa.cnpjPat = patrocinio.cnpjPat)
  WHERE UPPER(despesa.descricaoDesp) = UPPER('Marketing Digital');
        --AND despesa.numEd = 40
        --AND evento.nomeEv = 'International Conference on Very Large Data Bases';
/
/
/
/*
 * EXECUÇÃO 08: Execução Bem-sucedida
   - Nome do evento: International Conference on Very Large Data Bases
   - Edição: 40
   - Descrição da Despesa: Marketing Digital
   - Valor da Despesa: 500.00
   - CNPJ do Patrocinador (opcional) : 57286247000133
 * RESULTADO: "Despesa "Marketing Digital" com valor: $500.00 foi alterado com sucesso."
**/
EXECUTE insere_despesa('International Conference on Very Large Data Bases', 40, 'Marketing Digital', '500.00', NULL);
/
/
/
/*
 * CONSULTA 02: Tabela alterada, inserindo Marketing Digital para edição 40 do evento 
International Conference on Very Large Data Bases.
 * RESULTADO:
Nome do Evento                                                                         Edição Descrição da Despesa   CNPJ Patrocinador Valor da Despesa  Saldo Patrocinador 
-------------------------------------------------------------------------------------- ------- ---------------------- ----------------- ----------------- --------------------
International Conference on Very Large Data Bases                                           39 Marketing digital      6990590000204     $1,500.00         $0.00                
International Conference on Very Large Data Bases                                           40 Marketing Digital      6990590000204     $500.00           $1,400.00
ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems       18 Marketing digital       6990590000204    $2,000.00         $0.00                
ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems       20 Marketing digital      60316817000103    $1,500.00         $1,900.00            

**/
SELECT evento.nomeEv AS "Nome do Evento", 
       despesa.numEd AS "Edição", 
       despesa.descricaoDesp AS "Descrição da Despesa",
       to_char(despesa.cnpjPat, '99999999999999') AS "CNPJ Patrocinador", 
       to_char(despesa.valorDesp, 'FM$999,999,999,990.00') AS "Valor da Despesa", 
       to_char(patrocinio.saldoPat, 'FM$999,999,999,990.00') AS "Saldo Patrocinador"
  FROM evento JOIN despesa ON (evento.codEv = despesa.codEv)
       JOIN patrocinio ON (despesa.codEv = patrocinio.codEv AND despesa.numEd = patrocinio.numEd AND despesa.cnpjPat = patrocinio.cnpjPat)
  WHERE UPPER(despesa.descricaoDesp) = UPPER('Marketing Digital');
        --AND despesa.numEd = 40
        --AND evento.nomeEv = 'International Conference on Very Large Data Bases';

/
/
/