DROP TABLE result_pat;
CREATE TABLE result_pat(id number(10), text varchar2(500));
/
set serveroutput on;
CREATE OR REPLACE PACKAGE relatorio_pat AS
  FUNCTION relatorio_despesas(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type, pat IN patrocinador.CNPJPat%Type) RETURN Number;
  FUNCTION relatorio_auxilios (CODEV_ IN INSCRITO.CODEV%TYPE, NUMED_ IN INSCRITO.NUMED%TYPE, CNPJPAT_ IN AUXILIO.CNPJPAT%TYPE) return NUMBER;
  PROCEDURE relatorio_patrocinio(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type);
  PROCEDURE relatorio_evento(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type);
END relatorio_pat;
/
CREATE OR REPLACE PACKAGE BODY relatorio_pat AS
  num Number(10);
  text varchar2(500);
  FUNCTION relatorio_despesas(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type, 
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
      --dbms_output.put_line('Descrição                  Data da Despesa            Valor da Despesa  ');
      --dbms_output.put_line('-------------------------  -------------------------  --------------------');
      text :='Descrição                  Data da Despesa            Valor da Despesa  ';
      INSERT INTO result_pat values ( num ,text);
      num := num + 1;
      text :='-------------------------  -------------------------  --------------------';
      INSERT INTO result_pat values ( num ,text);
      num := num + 1;
      -- Abre o cursor
      OPEN cursor_despesas_pat(ev, ed, pat);
        -- Imprimi todas as despesas ordenadas por data e depois por valor
        FETCH cursor_despesas_pat INTO despesa_pat_item;
        IF cursor_despesas_pat%NotFound THEN
          RAISE sem_despesas;
        END IF;
        LOOP
          --dbms_output.put_line( RPAD(despesa_pat_item.descricaoDesp, 25, ' ') || '   ' || 
          --                      RPAD(despesa_pat_item.dataDesp, 25, ' ') || '  ' || 
          --                      RPAD( TO_CHAR(despesa_pat_item.valorDesp, 'FM$999,999,999,990.00'), 20, ' ') );
         text :=RPAD(despesa_pat_item.descricaoDesp, 25, ' ') || '   ' || 
                                RPAD(despesa_pat_item.dataDesp, 25, ' ') || '  ' || 
                                RPAD( TO_CHAR(despesa_pat_item.valorDesp, 'FM$999,999,999,990.00'), 20, ' ') ;
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
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
            --dbms_output.put_line('Evento especificado não cadastrado.');
            text :='Evento especificado não cadastrado.';
            INSERT INTO result_pat values ( num ,text);
            num := num + 1;
          ELSIF flag = 'edição' THEN
            --dbms_output.put_line('Edição não cadastrada para o evento.');
            text :='Edição não cadastrada para o evento.';
            INSERT INTO result_pat values ( num ,text);
            num := num + 1;
          ELSE
            --dbms_output.put_line('Patrocinador não cadastrado.');
            text :='Patrocinador não cadastrado.';
            INSERT INTO result_pat values ( num ,text);
            num := num + 1;
          END IF;
          RETURN 0;
        WHEN sem_despesas THEN
          --dbms_output.put_line('Não há despesas cadastradas na edição ' ||
          --ed || ' para o patrocinador ' || nome_pat || '.');
          text :='Não há despesas cadastradas na edição ' ||
            ed || ' para o patrocinador ' || nome_pat || '.';
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
          RETURN 0;

  END relatorio_despesas;
  
  
  /*
   * Função que gera o relatório do dos gastos com auxílios de um evento e edição para um certo patrocínio
   */
  FUNCTION relatorio_auxilios (CODEV_ IN INSCRITO.CODEV%TYPE, NUMED_ IN INSCRITO.NUMED%TYPE, CNPJPAT_ IN AUXILIO.CNPJPAT%TYPE) return NUMBER
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
    
      --dbms_output.put_line('Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor');
      --dbms_output.put_line('-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------');
      text :='Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor';
      INSERT INTO result_pat values ( num ,text);
      num := num + 1;
      text :='-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------';
      INSERT INTO result_pat values ( num ,text);
      num := num + 1;
    OPEN AUX_LIST;
    FETCH AUX_LIST INTO AUX_INFO; 
    IF AUX_LIST%NOTFOUND THEN
        RAISE sem_auxilios;
    END IF;
    LOOP
      --dbms_output.put_line( RPAD(AUX_INFO.NOMEPE, 25, ' ') || '   ' || 
      --                      RPAD(AUX_INFO.TITULOART, 90, ' ') || '  ' || 
      --                      RPAD(AUX_INFO.TIPOAUX, 25, ' ') || '  ' || 
      --                      RPAD( TO_CHAR(AUX_INFO.VALORAUX, 'FM$999,999,999,990.00'), 20, ' ') );
      text :=RPAD(AUX_INFO.NOMEPE, 25, ' ') || '   ' || 
                            RPAD(AUX_INFO.TITULOART, 90, ' ') || '  ' || 
                            RPAD(AUX_INFO.TIPOAUX, 25, ' ') || '  ' || 
                            RPAD( TO_CHAR(AUX_INFO.VALORAUX, 'FM$999,999,999,990.00'), 20, ' ');
     INSERT INTO result_pat values ( num ,text);
     num := num + 1;
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
          --dbms_output.put_line (' Não há nenhum evento válido com o código ' || CODEV_ ||'.'); 
          text :=' Não há nenhum evento válido com o código ' || CODEV_ ;
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
        END IF;
        IF flag = 'edicao' THEN
          --dbms_output.put_line (' Não há nenhuma edição válida com número '|| NUMED_ || ' associada ao evento de código ' || CODEV_ ||'.');
          text :=' Não há nenhuma edição válida com número '|| NUMED_ || ' associada ao evento de código ' || CODEV_ ;
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
        END IF;
        IF flag = 'patEv' THEN
          --dbms_output.put_line (' O CNPJ informado não corresponde a um patrocinador válido que tenha patrocinado o evento de código ' || CODEV_ ||'.');
          text :=' O CNPJ informado não corresponde a um patrocinador válido que tenha patrocinado o evento de código ' || CODEV_ ;
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
        END IF;
        RETURN 0;
    WHEN sem_auxilios THEN
        --dbms_output.put_line('Não há auxílios cadastrados na edição ' || NUMED_ || '.');
        text :='Não há auxílios cadastrados na edição ' || NUMED_ ;
        INSERT INTO result_pat values ( num ,text);
        num := num + 1;
        RETURN 0;
  END relatorio_auxilios;
  
  
  /*
   * Procedimento que gera o relatório do evento e edição para um certo patrocínio
   */
  PROCEDURE relatorio_patrocinio(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type) IS
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
          --dbms_output.put_line('----------------------------------------------------------- ');
          text :='-----------------------------------------------------------';
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
          --dbms_output.put_line(' PATROCINADOR: ' || nomePat);
          text :=' PATROCINADOR: ' || nomePat ;
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
          --dbms_output.put_line('----------------------------------------------------------- ');
          text :='-----------------------------------------------------------';
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
          totalPat := 0;
          totalPat := totalPat + relatorio_despesas(ev, ed, var_cursor.cnpjpat);
          totalPat := totalPat + relatorio_auxilios(ev, ed, var_cursor.cnpjpat);
          text :='-----------------------------------------------------------';
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
          --dbms_output.put_line('----------------------------------------------------------- ');
          --dbms_output.put_line('TOTAL GASTOS                                     ' || TO_CHAR(totalPat, 'FM$999,999,999,990.00'));
          text :='TOTAL GASTOS                                     ' || TO_CHAR(totalPat, 'FM$999,999,999,990.00');
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
          --dbms_output.put_line('----------------------------------------------------------- ');
          text :='-----------------------------------------------------------';
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
          totalGeral := totalGeral + totalPat;
        END LOOP;
        CLOSE c_pat;
        --dbms_output.put_line('----------------------------------------------------------- ');
        text :='-----------------------------------------------------------';
        INSERT INTO result_pat values ( num ,text);
          num := num + 1;
        --dbms_output.put_line('TOTAL EDICAO                                     ' || TO_CHAR(totalGeral, 'FM$999,999,999,990.00'));
        text :='TOTAL EDICAO                                     ' || TO_CHAR(totalGeral, 'FM$999,999,999,990.00') ;
        INSERT INTO result_pat values ( num ,text);
        num := num + 1;
        --dbms_output.put_line('----------------------------------------------------------- ');
        text :='-----------------------------------------------------------';
        INSERT INTO result_pat values ( num ,text);
        num := num + 1;
    -- Exceptions
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        IF flag = 'evento' THEN
          --dbms_output.put_line('Evento não cadastrado.');
          text :='Evento não cadastrado.';
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
        ELSE
          --dbms_output.put_line('Edição não cadastrada para o evento.');
          text :='Edição não cadastrada para o evento.';
          INSERT INTO result_pat values ( num ,text);
          num := num + 1;
        END IF;
  END relatorio_patrocinio;
  
  
  /*
   * Procedimento principal que gera o relatório de gastos de um dado o código de um evento e uma dada edição, se 
   esta for diferente de nula.
   */
  PROCEDURE relatorio_evento(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type) IS
   CURSOR c_edicao IS SELECT DISTINCT NUMED FROM edicao WHERE CODEV = ev ORDER BY NUMED;
   var_cursor c_edicao%ROWTYPE;
   nomeEvento evento.nomeEv%TYPE;
   -- Variáveis para verificação de exceptions
   tmp Number(15);
   flag Varchar2(15);
  BEGIN
    num := 0;
    flag := 'evento';
    SELECT nomeEv into nomeEvento from evento where codEv = ev;
    INSERT INTO result_pat values (num,'----------------------------------------------------------- ');
    num := num + 1;
    INSERT INTO result_pat values ( num ,'                    RELATORIO PATROCINIO                    ');
    num := num + 1;
    INSERT INTO result_pat values (num ,' EVENTO: ' ||  RPAD(nomeEvento, 50, ' '));
    num := num + 1;
    IF ed IS NOT NULL THEN
         flag := 'edição';
         SELECT numEd INTO tmp FROM edicao WHERE codEv = ev AND numEd = ed;
         INSERT INTO result_pat values (num ,'  EDICAO: ' || ed);
          num := num + 1;
         relatorio_Patrocinio(ev, ed);
    END IF;
    IF ed IS NULL THEN
     INSERT INTO result_pat values (num , '-----------------------------------------------------------');
     num := num + 1;
      OPEN c_edicao; 
        LOOP
          FETCH c_edicao INTO var_cursor;
          EXIT WHEN c_edicao%NotFound;
         INSERT INTO result_pat values (num , '-----------------------------------------------------------');
         num := num +1;
          INSERT INTO result_pat values (num , ' EDICAO: ' || var_cursor.numed );
          num := num +1;
          INSERT INTO result_pat values (num, '-----------------------------------------------------------');
          num := num +1;
          relatorio_Patrocinio(ev, var_cursor.numed);
        END LOOP;
      CLOSE c_edicao;
    END IF;

  -- Exceptions
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        IF flag = 'evento' THEN
          INSERT INTO result_pat values (num, 'Evento não cadastrado.');
          num := num + 1;
        ELSE
          INSERT INTO result_pat values (num, 'Edição não cadastrada para o evento ' || nomeEvento || '.');
          num := num + 1;
        END IF;
  END relatorio_evento;
BEGIN
num := 0;
END relatorio_pat;
/
execute relatorio_pat.relatorio_evento(1,NULL);
select * from result_pat ORDER BY id;
delete result_pat;