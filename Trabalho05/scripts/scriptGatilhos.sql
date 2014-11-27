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
CREATE OR REPLACE TRIGGER quantidadeArtigosEdicao AFTER
	INSERT OR DELETE ON artigo
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		BEGIN
			IF deleting THEN
				UPDATE EDICAO SET qtdArtigosApresentadosEd = qtdArtigosApresentadosEd-1
						WHERE numEd = :antigo.numEd
							  AND codEv = :antigo.codEv;
			ELSIF inserting THEN
				UPDATE EDICAO SET qtdArtigosApresentadosEd = qtdArtigosApresentadosEd+1
						WHERE :novo.numEd = numEd
							  AND :novo.codEv = codEv;		
			END IF;

END quantidadeArtigosEdicao;
/
/
/
-- trigger para atualizar totalArtigosApresentadosEv
	-- depende da atualização de qntArtigosApresentadosEd tabela edicao
CREATE OR REPLACE TRIGGER quantidadeArtigosEvento AFTER
	INSERT OR DELETE OR UPDATE OF qtdArtigosApresentadosEd ON EDICAO
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		BEGIN
			IF deleting THEN
				UPDATE EVENTO SET totalArtigosApresentadosEv = 
						(totalArtigosApresentadosEv - :antigo.qtdArtigosApresentadosEd)
						WHERE codEv = :antigo.codEv;
			ELSIF inserting THEN
				UPDATE EVENTO SET totalArtigosApresentadosEv = 
						(totalArtigosApresentadosEv + :novo.qtdArtigosApresentadosEd)
						WHERE codEv = :novo.codEv;
			ELSIF updating THEN
				UPDATE EVENTO SET totalArtigosApresentadosEv = 
						(totalArtigosApresentadosEv + 
							(:novo.qtdArtigosApresentadosEd - :antigo.qtdArtigosApresentadosEd) )
						WHERE codEv = :novo.codEv;
			END IF;
END quantidadeArtigosEvento;
/
/
/
CREATE OR REPLACE TRIGGER verificaLimiteSaldoPatDespesa
	BEFORE INSERT OR UPDATE OF valorDesp ON DESPESA
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		DECLARE   
		   saldo patrocinio.saldoPat%Type;
		   negativo EXCEPTION;
		   PRAGMA EXCEPTION_INIT( negativo, -1722 );
		BEGIN
			SELECT saldoPat INTO saldo FROM PATROCINIO 
						WHERE cnpjPat = :novo.cnpjPat
							  AND codEv = :novo.codEvPat
							  AND numEd = :novo.numEdPat;
			IF inserting AND (saldo - :novo.valorDesp) < 0 THEN
				-- verifica se é negativo
				RAISE negativo;
			ELSIF updating AND (saldo - (:novo.valorDesp - :antigo.valorDesp) ) < 0 THEN
				RAISE negativo;
			END IF;
END verificaLimiteSaldoPatDespesa;
/
/
/
-- trigger para atualizar saldoPat
	-- depende da:
		-- inserção, remoção ou atualização do valorDesp tabela despesa
CREATE OR REPLACE TRIGGER novoSaldoPatrocinioDespesa AFTER
	INSERT OR DELETE OR UPDATE OF valorDesp ON DESPESA
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		BEGIN
			IF deleting THEN
				UPDATE PATROCINIO SET saldoPat = (saldoPat + :antigo.valorDesp)
						WHERE cnpjPat = :antigo.cnpjPat
							  AND codEv = :antigo.codEvPat
							  AND numEd = :antigo.numEdPat;
			ELSIF inserting THEN
				-- verificar se o valor eh negativo, e não trocar *******
				UPDATE PATROCINIO SET saldoPat = (saldoPat - :novo.valorDesp)
						WHERE cnpjPat = :novo.cnpjPat
							  AND codEv = :novo.codEvPat
							  AND numEd = :novo.numEdPat;
			ELSIF updating THEN
				-- verificar se o valor eh negativo, e não trocar *******
				UPDATE PATROCINIO SET saldoPat = (saldoPat - (:novo.valorDesp - :antigo.valorDesp) )
						WHERE cnpjPat = :novo.cnpjPat
							  AND codEv = :novo.codEvPat
							  AND numEd = :novo.numEdPat;
			END IF;

END novoSaldoPatrocinioDespesa;
/
/
/
-- trigger para atualizar saldoPat
	-- depende da:
		-- inserção, remoção ou atualização do valorAux tabela auxilio
CREATE OR REPLACE TRIGGER verificaLimiteSaldoPatAuxilio
	BEFORE INSERT OR UPDATE OF valorAux ON AUXILIO
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		DECLARE   
		   saldo patrocinio.saldoPat%Type;
		   negativo EXCEPTION;
		   PRAGMA EXCEPTION_INIT( negativo, -1722 );
		BEGIN
			SELECT saldoPat INTO saldo FROM PATROCINIO 
						WHERE cnpjPat = :novo.cnpjPat
							  AND codEv = :novo.codEvPat
							  AND numEd = :novo.numEdPat;
			IF inserting AND (saldo - :novo.valorAux) < 0 THEN
				-- verifica se é negativo
				RAISE negativo;
			ELSIF updating AND (saldo - (:novo.valorAux - :antigo.valorAux) ) < 0 THEN
				RAISE negativo;
			END IF;
END verificaLimiteSaldoPatAuxilio;
/
/
/
CREATE OR REPLACE TRIGGER novoSaldoPatrocinioAuxilio
	AFTER INSERT OR DELETE OR UPDATE OF valorAux ON AUXILIO
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		BEGIN
			IF deleting THEN
				UPDATE PATROCINIO SET saldoPat = (saldoPat + :antigo.valorAux)
						WHERE cnpjPat = :antigo.cnpjPat
							  AND codEv = :antigo.codEvPat
							  AND numEd = :antigo.numEdPat;
			ELSIF inserting THEN
				-- verificar se o valor eh negativo, e não trocar *******
				UPDATE PATROCINIO SET saldoPat = (saldoPat - :novo.valorAux)
						WHERE cnpjPat = :novo.cnpjPat
							  AND codEv = :novo.codEvPat
							  AND numEd = :novo.numEdPat;
			ELSIF updating THEN
				-- verificar se o valor eh negativo, e não trocar *******
				UPDATE PATROCINIO SET saldoPat = (saldoPat - (:novo.valorAux - :antigo.valorAux) )
						WHERE cnpjPat = :novo.cnpjPat
							  AND codEv = :novo.codEvPat
							  AND numEd = :novo.numEdPat;
			END IF;

END novoSaldoPatrocinioAuxilio;
/
/
/
-- trigger para atualizar saldoFinanceiroEd
	-- depende da inserção, remoção ou atualização (saldoPat) de patrocinio
CREATE OR REPLACE TRIGGER novoSaldoEdicao AFTER 
	INSERT OR DELETE OR UPDATE OF saldoPat ON PATROCINIO
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		BEGIN
			IF deleting THEN
				UPDATE EDICAO SET saldoFinanceiroEd = (saldoFinanceiroEd - :antigo.saldoPat)
						WHERE codEv = :antigo.codEv
							  AND numEd = :antigo.numEd;
			ELSIF inserting THEN
				UPDATE EDICAO SET saldoFinanceiroEd = (saldoFinanceiroEd + :novo.saldoPat)
						WHERE codEv = :novo.codEv
							  AND numEd = :novo.numEd;
			ELSIF updating THEN
				UPDATE EDICAO SET saldoFinanceiroEd = (saldoFinanceiroEd + (:novo.saldoPat - :antigo.saldoPat) )
						WHERE codEv = :novo.codEv
							  AND numEd = :novo.numEd;
			END IF;

END novoSaldoEdicao;
/
/
/
-- trigger para setar apresentador quando adicionar a apresentação
CREATE OR REPLACE TRIGGER adicionarApresentador AFTER
	INSERT OR DELETE OR UPDATE OF idApr ON ARTIGO
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		BEGIN
			IF deleting THEN
				IF :antigo.idApr IS NOT NULL THEN
					UPDATE INSCRITO SET tipoApresentador = '0'
							WHERE codEv = :antigo.codEv
								  AND numEd = :antigo.numEd
								  AND idPart = :antigo.idApr;
				END IF;
			ELSIF inserting THEN
				IF :novo.idApr IS NOT NULL THEN
					UPDATE INSCRITO SET tipoApresentador = '1'
							WHERE codEv = :novo.codEv
								  AND numEd = :novo.numEd
								  AND idPart = :novo.idApr;
				END IF;
			ELSIF updating THEN
				IF :antigo.idApr IS NOT NULL THEN
					UPDATE INSCRITO SET tipoApresentador = '0'
							WHERE codEv = :antigo.codEv
								  AND numEd = :antigo.numEd
								  AND idPart = :antigo.idApr;
				END IF;
				-- NOVO
				IF :novo.idApr IS NOT NULL THEN
					UPDATE INSCRITO SET tipoApresentador = '1'
							WHERE codEv = :novo.codEv
								  AND numEd = :novo.numEd
								  AND idPart = :novo.idApr;
				END IF;
			END IF;

END adicionarApresentador;
/
/
/
-- trigger de inserção e remoção de inscritos para alterar o valor do saldo da Edicao
CREATE OR REPLACE TRIGGER atualizaTaxaEd AFTER
	INSERT OR DELETE ON INSCRITO
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		BEGIN
			IF deleting THEN
				UPDATE EDICAO SET saldoFinanceiroEd = (saldoFinanceiroEd - taxaEd)
						WHERE codEv = :antigo.codEv
							  AND numEd = :antigo.numEd;
			ELSIF inserting THEN
				UPDATE EDICAO SET saldoFinanceiroEd = (saldoFinanceiroEd + taxaEd)
						WHERE codEv = :novo.codEv
							  AND numEd = :novo.numEd;
			END IF;

END atualizaTaxaEd;
/
/
/*
-- trigger para atualizar saldo da edicao caso o valor da taxa da edicao seja alterado
	-- ERRO TABELA MUTANTE ***********
CREATE OR REPLACE TRIGGER recalculaSaldoPorTaxaEdicao AFTER
	UPDATE OF taxaEd ON EDICAO
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		DECLARE
			--novoValor Number(20);
      numInsc Number(10);
      sumSaldoPat Number(20);
		BEGIN
      SELECT count(inscrito.idPart)
            INTO numInsc
						FROM inscrito
						WHERE inscrito.codEv = :novo.codEv
							AND inscrito.numEd = :novo.numEd;
      SELECT NVL(sum(patrocinio.saldoPat), 0)
            INTO sumSaldoPat
						FROM patrocinio
			      		WHERE patrocinio.codEv = :novo.codEv
			        			AND patrocinio.numEd = :novo.numEd
			        	GROUP BY patrocinio.numEd, patrocinio.codEv;
			:novo.saldoFinanceiroEd := ( :novo.taxaEd * numInsc ) + sumSaldoPat;

END recalculaSaldoPorTaxaEdicao;
/
/
/
-- trigger para alterar tipoAutor pessoa quando inserir, remover ou fazer update da tabela escreve
	-- lebrar de verificar se a pessoa não possui outros artigos
	-- ERRO TABELA MUTANTE ***********
CREATE OR REPLACE TRIGGER atualizarAutor AFTER
	DELETE ON ESCREVE
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		DECLARE
			PRAGMA AUTONOMOUS_TRANSACTION;
			artigos Number(10);
		BEGIN
				-- verifica se a pessoa tem mais algum artigo escrito
				SELECT NVL(count(idArt), 0) INTO artigos FROM ESCREVE WHERE idAut = :antigo.idAut;
				IF artigos = 0 THEN 
					UPDATE PESSOA SET tipoAutor = '0' WHERE idPe = :antigo.idAut;
				END IF;

END atualizarAutor;
/
/
/
CREATE OR REPLACE TRIGGER atualizarAutorInsert AFTER
	INSERT ON ESCREVE
	REFERENCING OLD AS antigo NEW AS novo
	FOR EACH ROW
		BEGIN
			UPDATE PESSOA SET tipoAutor = '1' WHERE idPe = :novo.idAut;

END atualizarAutorInsert;

INSERT INTO ESCREVE VALUES(350, 2);

DELETE FROM ESCREVE WHERE IDART = 2 AND IDAUT=350;

SELECT NVL(count(idArt), 0) FROM ESCREVE WHERE idAut = 350;
/
/
/
--TRIGGERS! Tem outros???
*/