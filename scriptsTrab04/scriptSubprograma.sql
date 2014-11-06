/*
 * Carlos Humberto dos Santos Baqueta 7987456
 * Marina Coimbra                     7126841
 * Vanessa Apolinário de Lima         7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 04
 *
 * Script de Geração de Relatórios < scriptSubPrograma.sql >
 * 
 */

 /*
  * Com o objetivo de criar um procedimento para geração de relatórios com base em
  certos parâmetros, sendo que este deve conter duas funções, consideramos o problema
  da recuperação dos dados financeiros de um certo evento.
  *
  * O relatório mostra as informações dos gastos com despesas e auxílios por patrocinador 
  para cada edição do evento, caso o número da edição seja Nulo, permitindo justificar 
  com o que os valores de cada patrocínio foram gastos. Caso o número da edição seja um
  valor válido para o dado evento, são mostradas as informações dos gastos com despesas
  e auxílios por patrocinador apenas para aquela edição em específico.
  *
  * Para mostrar o funcionamento da função são realizados abaixo alguns exemplos.
  * 
  */
set serveroutput on;
set verify off;
/
/
/
CREATE OR REPLACE FUNCTION relatorio_despesas(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type, 
                                              pat IN patrocinador.CNPJPat%Type) 
RETURN Number IS
  -- Cursor que recebe todas as despesas daquele patrocinador
  CURSOR cursor_despesas_pat (ev edicao.codEv%Type, ed edicao.numEd%Type, pat patrocinador.CNPJPat%Type) IS
    SELECT despesa.descricaoDesp, despesa.dataDesp, despesa.valorDesp
      FROM despesa JOIN patrocinio ON 
                 (despesa.cnpjPat = patrocinio.cnpjPat 
                  AND despesa.CODEV = patrocinio.CODEV
                  AND despesa.numEd = patrocinio.NUMED)
      WHERE despesa.codEv = ev
                  AND despesa.numEd = ed
                  AND despesa.cnpjPat = pat;
  -- Variável de acesso ao cursor
  despesa_pat_item cursor_despesas_pat%RowType;
  -- Variável que soma o total de gastos com essas despesas
  total_despesas Number(10,2) := 0;
  -- Variável temporária para verificação de erros
  tmp Number(15);
  -- Variável para receber a Razão Social do patrocinador
  nome_pat patrocinador.razaoSocialPat%Type;

  flag Varchar2(15);
  -- Exceptions
  sem_despesas EXCEPTION;
  BEGIN
    -- Verifica o evento
  	flag := 'evento';
  	SELECT codEv INTO tmp FROM evento WHERE codEv = ev;
    -- Verifica a edição
  	flag := 'edição';
  	SELECT numEd INTO tmp FROM edicao WHERE codEv = ev AND numEd = ed;
    -- Verifica o patrocinador
  	flag := 'patrocinador';
  	SELECT cnpjPat, razaoSocialPat INTO tmp, nome_pat FROM patrocinador WHERE cnpjPat = pat;

    SELECT sum(despesa.valorDesp)
      INTO total_despesas
      FROM despesa JOIN patrocinio ON 
            (despesa.cnpjPat = patrocinio.cnpjPat 
             AND despesa.CODEV = patrocinio.CODEV
             AND despesa.numEd = patrocinio.NUMED)
      WHERE despesa.codEv = ev
            AND despesa.numEd = ed
            AND despesa.cnpjPat = pat;
    -- Imprime o cabeçalho
    dbms_output.put_line('Descrição                  Data da Despesa            Valor da Despesa  ');
    dbms_output.put_line('-------------------------  -------------------------  --------------------');
    -- Abre o cursor
    OPEN cursor_despesas_pat(ev, ed, pat);
      -- Imprimi todas as despesas ordenadas por data e depois por valor
      FETCH cursor_despesas_pat INTO despesa_pat_item;
      IF cursor_despesas_pat%NotFound THEN
      	RAISE sem_despesas;
      END IF;
      LOOP
        dbms_output.put_line( RPAD(despesa_pat_item.descricaoDesp, 25, ' ') || '   ' || 
                              RPAD(despesa_pat_item.dataDesp, 25, ' ') || '  ' || 
                              RPAD( TO_CHAR(despesa_pat_item.valorDesp, 'FM$999,999,999,990.00'), 20, ' ') );
        FETCH cursor_despesas_pat INTO despesa_pat_item;
        EXIT WHEN cursor_despesas_pat%NotFound;
      END LOOP;
    -- Fecha o cursor
    CLOSE cursor_despesas_pat;
    
    RETURN total_despesas;
    
    -- Exceptions
    EXCEPTION
    	WHEN NO_DATA_FOUND THEN
    		IF flag = 'evento' THEN
    			dbms_output.put_line('Evento especificado não cadastrado.');
    		ELSIF flag = 'edição' THEN
    			dbms_output.put_line('Edição não cadastrada para o evento.');
    		ELSE
    			dbms_output.put_line('Patrocinador não cadastrado.');
    		END IF;
        RETURN -1;
    	WHEN sem_despesas THEN
    		dbms_output.put_line('Não há despesas cadastradas na edição' ||
    		ed || ' para o patrocinador ' || nome_pat || '.');
        RETURN -2;

END relatorio_despesas;
/
/
/
CREATE OR REPLACE FUNCTION relatorio_auxilios (CODEV_ IN INSCRITO.CODEV%TYPE, NUMED_ IN INSCRITO.NUMED%TYPE, CNPJPAT_ IN AUXILIO.CNPJPAT%TYPE) return NUMBER
AS
  RET NUMBER;
  IDAUX ARTIGO.IDAPR%TYPE;
  
  CURSOR AUX_LIST IS 
    SELECT P.NOMEPE, ART.TITULOART, AUX.TIPOAUX, AUX.VALORAUX FROM AUXILIO AUX
      INNER JOIN INSCRITO I
        ON AUX.CODEVAPR = I.CODEV 
        AND AUX.NUMEDAPR = I.NUMED
        AND AUX.IDAPR = I.IDPART
      INNER JOIN ARTIGO ART
        ON ART.CODEV = I.CODEV
        AND ART.NUMED = I.NUMED
        AND ART.IDAPR= I.IDPART
      INNER JOIN PESSOA P
        ON I.IDPART = P.IDPE
      WHERE I.CODEV = CODEV_ AND I.NUMED = NUMED_ AND AUX.CNPJPAT = CNPJPAT_
      ORDER BY AUX.TIPOAUX, P.NOMEPE;
  AUX_INFO AUX_LIST%RowType;
  
  flag Varchar2(15); -- Usada para auxiliar na identificação das exceções de mesmo tipo
  temp NUMBER; -- Variável temporária para auxiliar no tratamento de exceções
  -- Exceptions
  sem_auxilios EXCEPTION;
BEGIN
  
  -- Checa se existe um evento com CODEV informado:
  flag := 'evento';
  SELECT Ev.CODEV INTO temp FROM evento Ev WHERE Ev.CODEV = CODEV_;
  
  -- Checa se existe uma edição com NUMED informado, associada ao evento com CODEV informado:
  flag := 'edicao';
  SELECT Ed.NUMED INTO temp FROM edicao Ed WHERE Ed.CODEV = CODEV_ AND Ed.NUMED = NUMED_;
  
  -- Checa se existe um patrocinador com o CNPJ informado que patrocinou o evento com código CODEV_
  flag := 'patEv';
  SELECT distinct Pa.CNPJPAT INTO temp FROM patrocinio Pa WHERE Pa.CNPJPAT = CNPJPAT_ AND Pa.CODEV = CODEV_;
  
    dbms_output.put_line('Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor');
    dbms_output.put_line('-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------');
    
  OPEN AUX_LIST;
  FETCH AUX_LIST INTO AUX_INFO; 
  IF AUX_LIST%NOTFOUND THEN
      RAISE sem_auxilios;
  END IF;
  LOOP
    dbms_output.put_line( RPAD(AUX_INFO.NOMEPE, 25, ' ') || '   ' || 
                          RPAD(AUX_INFO.TITULOART, 90, ' ') || '  ' || 
                          RPAD(AUX_INFO.TIPOAUX, 25, ' ') || '  ' || 
                          RPAD( TO_CHAR(AUX_INFO.VALORAUX, 'FM$999,999,999,990.00'), 20, ' ') );
  
    FETCH AUX_LIST INTO AUX_INFO; 
    EXIT WHEN AUX_LIST%NOTFOUND;    -- Condição de parada

  END LOOP;
  CLOSE AUX_LIST;
  
  -- CALCULA O VALOR TOTAL GASTO EM AUXÍLIO, REFERENTE A UM PATROCÍNIO DE UM PATROCINADOR, DADO UM EVENTO E UMA EDICAO (FUNÇÃO DE AGRUPAMENTO SUM())
  SELECT SUM(AUX.VALORAUX) INTO RET FROM AUXILIO AUX WHERE AUX.CODEVAPR = CODEV_  AND AUX.NUMEDAPR = NUMED_ AND AUX.CNPJPAT = CNPJPAT_; 
  
  RETURN RET;
  EXCEPTION
  WHEN no_data_found THEN 
     IF flag = 'evento' THEN 
        dbms_output.put_line (' Não há nenhum evento válido com o código ' || CODEV_ ||'.'); 
      END IF;
      IF flag = 'edicao' THEN
        dbms_output.put_line (' Não há nenhuma edição válida com número '|| NUMED_ || ' associada ao evento de código ' || CODEV_ ||'.');
      END IF;
      IF flag = 'patEv' THEN
        dbms_output.put_line (' O CNPJ informado não corresponde a um patrocinador válido que tenha patrocinado o evento de código ' || CODEV_ ||'.');
      END IF;
  WHEN sem_auxilios THEN
      dbms_output.put_line('Não há auxílios cadastrados na edição' || NUMED_ || '.');
END relatorio_auxilios;
/
/
/
CREATE OR REPLACE PROCEDURE relatorio_patrocinio(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type) IS
 nomePat Patrocinador.razaosocialpat%TYPE;
 totalPat NUMBER(10,2);
 totalGeral NUMBER(10,2);
 CURSOR c_pat IS SELECT DISTINCT CNPJPAT FROM PATROCINIO WHERE CODEV = ev and NUMED = ed ORDER BY CNPJPAT;
  var_cursor c_pat%ROWTYPE;

 -- Variáveis para verificação de exceptions
 tmp Number(15);
 flag Varchar2(15);
BEGIN
  flag := 'evento';
  SELECT codEv INTO tmp FROM evento WHERE codEv = ev;

  flag := 'edição';
  SELECT numEd INTO tmp FROM edicao WHERE codEv = ev AND numEd = ed;

  totalGeral := 0;
  OPEN c_pat; 
      LOOP
        FETCH c_pat INTO var_cursor;
        EXIT WHEN c_pat%NotFound;
        SELECT razaosocialpat into nomePat from Patrocinador where CNPJPAT = var_cursor.cnpjpat;
        dbms_output.put_line(' ----------------------------------------------------------- ');
        dbms_output.put_line('  PATROCINADOR: ' || nomePat);
        dbms_output.put_line(' ----------------------------------------------------------- ');
        totalPat := 0;
        totalPat := totalPat + relatorio_despesas(ev, ed, var_cursor.cnpjpat);
        totalPat := totalPat + relatorio_auxilios(ev, ed, var_cursor.cnpjpat);
        dbms_output.put_line(' ----------------------------------------------------------- ');
        dbms_output.put_line(' TOTAL GASTOS                                     ' || TO_CHAR(totalPat, 'FM$999,999,999,990.00'));
        dbms_output.put_line(' ----------------------------------------------------------- ');
        totalGeral := totalGeral + totalPat;
      END LOOP;
      CLOSE c_pat;
      dbms_output.put_line(' ----------------------------------------------------------- ');
      dbms_output.put_line(' TOTAL EDICAO                                     ' || TO_CHAR(totalGeral, 'FM$999,999,999,990.00'));
      dbms_output.put_line(' ----------------------------------------------------------- ');

  -- Exceptions
  EXCEPTION
   	WHEN NO_DATA_FOUND THEN
    	IF flag = 'evento' THEN
    		dbms_output.put_line('Evento não cadastrado.');
    	ELSE
    		dbms_output.put_line('Edição não cadastrada para o evento.');
    	END IF;
END relatorio_patrocinio;
/
/
/
CREATE OR REPLACE PROCEDURE relatorio_evento(ev IN NUMBER, ed IN NUMBER) IS
 CURSOR c_edicao IS SELECT DISTINCT NUMED FROM edicao WHERE CODEV = ev ORDER BY NUMED;
 var_cursor c_edicao%ROWTYPE;
 nomeEvento evento.nomeEv%TYPE;
 -- Variáveis para verificação de exceptions
 tmp Number(15);
 flag Varchar2(15);
BEGIN
  flag := 'evento';
  SELECT nomeEv into nomeEvento from evento where codEv = ev;
  dbms_output.put_line(' ----------------------------------------------------------- ');
  dbms_output.put_line('                     RELATORIO PATROCINIO                    ');
  dbms_output.put_line('  EVENTO: ' ||  RPAD(nomeEvento, 50, ' '));
  IF ed IS NOT NULL THEN
  	   flag := 'edição';
  	   SELECT numEd INTO tmp FROM edicao WHERE codEv = ev AND numEd = ed;
       dbms_output.put_line('  EDICAO: ' || ed);
       relatorio_Patrocinio(ev, ed);
  END IF;
  IF ed IS NULL THEN
   dbms_output.put_line(' ----------------------------------------------------------- ');
    OPEN c_edicao; 
      LOOP
        FETCH c_edicao INTO var_cursor;
        EXIT WHEN c_edicao%NotFound;
        dbms_output.put_line(' ----------------------------------------------------------- ');
        dbms_output.put_line('  EDICAO: ' || var_cursor.numed);
        dbms_output.put_line(' ----------------------------------------------------------- ');
        relatorio_Patrocinio(ev, var_cursor.numed);
      END LOOP;
    CLOSE c_edicao;
  END IF;

-- Exceptions
  EXCEPTION
   	WHEN NO_DATA_FOUND THEN
    	IF flag = 'evento' THEN
    		dbms_output.put_line('Evento não cadastrado.');
    	ELSE
    		dbms_output.put_line('Edição não cadastrada para o evento ' || nomeEvento || '.');
    	END IF;
END relatorio_evento;
/
/*
 *
 */

