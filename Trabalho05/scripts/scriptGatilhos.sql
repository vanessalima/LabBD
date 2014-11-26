/*
 * Carlos Humberto dos Santos Baqueta	7987456
 * Marina Coimbra						7126841
 * Vanessa Apolinário de Lima			7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 05
 *
 * Script de Gatilhos < scriptGatilhos.sql >
 * 
 */
/
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
/
/
/
-- trigger para atualizar qntArtigosApresentadosEd
	-- depende da inserção e deleção de artigos

-- trigger para atualizar totalArtigosApresentadosEv
	-- depende da atualização de qntArtigosApresentadosEd tabela edicao

-- trigger para atualizar saldoPat
	-- depende da:
		-- inserção, remoção ou atualização do valorDesp tabela despesa
		-- inserção, remoção ou atualização do valorAux tabela auxilio

-- trigger para atualizar saldoFinanceiroEd
	-- depende da inserção, remoção ou atualização (saldoPat) de patrocinio





--TRIGGERS! Tem outros???