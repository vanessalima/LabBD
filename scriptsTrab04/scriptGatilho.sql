/*
 * Carlos Humberto dos Santos Baqueta 7987456
 * Marina Coimbra                     7126841
 * Vanessa Apolinário de Lima         7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 04
 *
 * Script de Gatilhos < scriptGatilho.sql >
 * 
 */

 /*
  *****************************TABELA MUTANTE*****************************
  * DEFINIÇÃO: Tabela mutante ocorre é quando uma tabela, ao realizar uma 
  alteração, inserção ou deleção ativa um gatilho que realiza uma operação 
  nessa mesma tabela. Ou seja, quando um gatilho refere-se a própria 
  tabela para a qual está sendo alterada.
  ************************************************************************
  *
  * O gatilho que realiza alteração na própria tabela é o de 
  * tabela Patrocinio
  * quando altera o valor do patrocinio, o gatilho tem que alterar o valor
  do saldoPat
  *
  * é inteessante criar os gatilhos para atualizar todos os atributos derivados
  */
set serveroutput on;
set verify off;
/
CREATE OR REPLACE TRIGGER alterar_valorPat FOR UPDATE OF valorPat ON patrocinio
COMPOUND TRIGGER
  old_valorPat patrocinio.valorPat%Type;
  old_saldoPat patrocinio.saldoPat%Type;
AFTER EACH ROW IS
BEGIN
    UPDATE patrocinio
      SET saldoPat = (
        (patrocinio.valorPat
        - NVL( (SELECT sum(NVL(auxilio.valorAux, 0) )
          FROM auxilio
          WHERE patrocinio.codEv = auxilio.codEvPat
                AND patrocinio.numEd = auxilio.numEdPat
                AND patrocinio.cnpjPat = auxilio.cnpjPat ), 0 )
          - NVL( ( SELECT sum(despesa.valorDesp)
            FROM despesa
            WHERE patrocinio.codEv = despesa.codEvPat
                AND patrocinio.numEd = despesa.numEdPat
                AND patrocinio.cnpjPat = despesa.cnpjPat ), 0 )
      ) 
    );
END AFTER EACH ROW;
END;
/
/
create or replace trigger teste_trigger
FOR UPDATE ON patrocinio  
COMPOUND TRIGGER   
  threshhold CONSTANT SIMPLE_INTEGER := 10;

  TYPE saldoPat_t IS TABLE OF patrocinio%ROWTYPE INDEX BY SIMPLE_INTEGER;
  saldo  saldoPat_t;
  idx       SIMPLE_INTEGER := 0;

  PROCEDURE flush_array IS
    n CONSTANT SIMPLE_INTEGER := saldo.count();
  BEGIN
    FORALL j IN 1..n
      INSERT INTO patrocinio VALUES saldo(j);
    saldo.delete();
    idx := 0;
    DBMS_OUTPUT.PUT_LINE('Flushed ' || n || ' rows');
  END flush_array;

---- AFTER EACH  
  AFTER EACH ROW IS
  BEGIN
    /*idx := idx + 1;
    salaries(idx).employee_id := :NEW.employee_id;
    salaries(idx).change_date := SYSDATE();
    salaries(idx).salary := :NEW.salary;
    IF idx >= threshhold THEN
      flush_array();
    END IF;*/
    NULL;
  END AFTER EACH ROW;


---- AFTER
  AFTER STATEMENT IS
  BEGIN
    dbms_output.put_line('TEST_COMP_TRIGGER:  AFTER STATEMENT');
    flush_array();
  END AFTER STATEMENT;
  
END teste_trigger;
/