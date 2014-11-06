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
 /
 /*
  *****************************TABELA MUTANTE*******************************
  * DEFINIÇÃO: Tabela mutante ocorre quando um gatilho, diparado por uma 
  operação de alteração, inserção ou deleção, realiza uma operação na mesma 
  tabela que ocasionou o disparo deste gatilho. Ou seja, quando um gatilho 
  refere-se a própria tabela para a qual está sendo alterada.
  **************************************************************************
  *
  * Neste problema há problema de tabela mutante pois o gatilho realiza alteração na própria tabela.
  * A tabela de Patrocínio ativa o gatilho e também é nela que precisamos alterar o saldo. Portanto,
  * para resolver esse problema precisamos utilizar a técnica de gatilhos compostos.
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
/*
  * Neste caso, o problema da tabela mutante foi resolvido pois ao fazermos um update do valor 
  * do patrocínio, seu saldo será atualizado na tabela como no exemplo abaixo:
  */
/
SELECT * FROM Patrocinio WHERE CNPJPAT = 6990590000204 AND  CODEV = 1 and NUMED = 37;
-- Podemos ver que o valor do patrocinio eh 12000
UPDATE Patrocinio SET VALORPAT = 15000 WHERE CNPJPAT = 6990590000204 AND  CODEV = 1 and NUMED = 37;
SELECT * FROM Patrocinio WHERE CNPJPAT = 6990590000204 AND  CODEV = 1 and NUMED = 37;
-- Podemos ver que o valor do saldo foi aumentado em 3000, assim como o valor do patrocinio!