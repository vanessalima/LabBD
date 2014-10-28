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
/
CREATE OR REPLACE FUNCTION relatorio_despesas(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type, 
                                              pat IN patrocinador.CNPJPat%Type) 
RETURN Number IS
BEGIN
   dbms_output.put_line('despesas');
   RETURN 2;
END;
/
CREATE OR REPLACE FUNCTION relatorio_auxilios(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type, 
                                              pat IN patrocinador.CNPJPat%Type) 
RETURN Number IS
BEGIN
   dbms_output.put_line('auxilios');
   RETURN 2;
END;
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
        dbms_output.put_line(' TOTAL GASTOS                                     R$' || totalPat);
        dbms_output.put_line(' ----------------------------------------------------------- ');
        totalGeral := totalGeral + totalPat;
      END LOOP;
      CLOSE c_pat;
      dbms_output.put_line(' ----------------------------------------------------------- ');
      dbms_output.put_line(' TOTAL EDICAO                                     R$' || totalGeral);
      dbms_output.put_line(' ----------------------------------------------------------- ');
END relatorio_patrocinio;
/
EXECUTE relatorio_patrocinio(1,37);
/
CREATE OR REPLACE PROCEDURE relatorio_evento(ev IN NUMBER, ed IN NUMBER) IS
 CURSOR c_edicao IS SELECT DISTINCT NUMED FROM edicao WHERE CODEV = ev ORDER BY NUMED;
 var_cursor c_edicao%ROWTYPE;
 nomeEvento evento.nomeEv%TYPE;
BEGIN
  SELECT nomeEv into nomeEvento from evento where codEv = ev;
  dbms_output.put_line(' ----------------------------------------------------------- ');
  dbms_output.put_line('                     RELATORIO PATROCINIO                    ');
  dbms_output.put_line('  EVENTO: ' || nomeEvento);
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
EXECUTE relatorio_evento(1, 37);
EXECUTE relatorio_evento(1, NULL);
