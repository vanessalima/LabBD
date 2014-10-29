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
  * Criar programa para verificar os gastos
  listar por patrocinio, por despesa, por tipo de auxílio
  por quem recebeu o auxílio

  * Listar a ordem de colocados de acordo com as notas do apresentador
e do artigo em si

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
  BEGIN
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
      LOOP
        FETCH cursor_despesas_pat INTO despesa_pat_item;
        EXIT WHEN cursor_despesas_pat%NotFound;
        dbms_output.put_line( RPAD(despesa_pat_item.descricaoDesp, 25, ' ') || '   ' || 
                              RPAD(despesa_pat_item.dataDesp, 25, ' ') || '  ' || 
                              RPAD( TO_CHAR(despesa_pat_item.valorDesp, 'FM$999,999,999,990.00'), 20, ' ') );
      END LOOP;
    -- Fecha o cursor
    CLOSE cursor_despesas_pat;
    
    RETURN total_despesas;
    
    -- exceptions!!!! ***
    EXCEPTION
    	WHEN NO_DATA_FOUND THEN
    		dbms_output.put_line('Erro');
    	WHEN NO_DATA_FOUND THEN
    		dbms_output.put_line('Erro');
END relatorio_despesas;
/
/
/
CREATE OR REPLACE FUNCTION relatorio_auxilios(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type, 
                                              pat IN patrocinador.CNPJPat%Type) 
RETURN Number IS
BEGIN
   dbms_output.put_line('auxilios');
   RETURN 2;
END;
/
/
/
CREATE OR REPLACE PROCEDURE relatorio_patrocinio(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type) IS
 nomePat Patrocinador.razaosocialpat%TYPE;
 totalPat NUMBER(10,2);
 totalGeral NUMBER(10,2);
 CURSOR c_pat IS SELECT DISTINCT CNPJPAT FROM PATROCINIO WHERE CODEV = ev and NUMED = ed ORDER BY CNPJPAT;
  var_cursor c_pat%ROWTYPE;
BEGIN
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
END relatorio_patrocinio;
/
CREATE OR REPLACE PROCEDURE relatorio_evento(ev IN NUMBER, ed IN NUMBER) IS
 CURSOR c_edicao IS SELECT DISTINCT NUMED FROM edicao WHERE CODEV = ev ORDER BY NUMED;
 var_cursor c_edicao%ROWTYPE;
 nomeEvento evento.nomeEv%TYPE;
BEGIN
  SELECT nomeEv into nomeEvento from evento where codEv = ev;
  dbms_output.put_line(' ----------------------------------------------------------- ');
  dbms_output.put_line('                     RELATORIO PATROCINIO                    ');
  dbms_output.put_line('  EVENTO: ' ||  RPAD(nomeEvento, 50, ' '));
  IF ed IS NOT NULL THEN
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
END relatorio_evento;
/
