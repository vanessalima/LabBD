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
  *****************************TABELA MUTANTE*******************************
  * DEFINIÇÃO: Tabela mutante ocorre quando um gatilho, diparado por uma 
  operação de alteração, inserção ou deleção, realiza uma operação na mesma 
  tabela que ocasionou o disparo deste gatilho. Ou seja, quando um gatilho 
  refere-se a própria tabela para a qual está sendo alterada.
  **************************************************************************
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

BEFORE EACH ROW IS
  BEGIN
    :NEW.saldoPat := :NEW.valorPat - (:OLD.valorPat - :OLD.saldoPat);
END BEFORE EACH ROW;
END;