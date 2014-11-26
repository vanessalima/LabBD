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

	for each ROW
		--WHEN ... 
		-- tem que usar para o delete
		-- mais de uma pode ser deletada, mas só uma pode ser inserida

	DECLARE

	BEGIN

END quantidadeArtigosEdicao;
￼

-- trigger para atualizar totalArtigosApresentadosEv
	-- depende da atualização de qntArtigosApresentadosEd tabela edicao
CREATE OR REPLACE TRIGGER quantidadeArtigosEvento AFTER
	INSERT OR DELETE OR UPDATE OF qntArtigosApresentadosEd ON EDICAO

	for each ROW
		--WHEN ... 
		-- tem que usar para o delete
		-- mais de uma pode ser deletada, mas só uma pode ser inserida

	DECLARE

	BEGIN

END quantidadeArtigosEvento;


-- trigger para atualizar saldoPat
	-- depende da:
		-- inserção, remoção ou atualização do valorDesp tabela despesa
		-- inserção, remoção ou atualização do valorAux tabela auxilio
		-- NÃO SEI COMO FAZER DEPENDER DE MAIS DE 1 TABELA
CREATE OR REPLACE TRIGGER novoSaldoPatrocinio AFTER
	INSERT OR DELETE OR UPDATE OF valorDesp ON DESPESA

	for each ROW
		--WHEN ... 
		-- tem que usar para o delete
		-- mais de uma pode ser deletada, mas só uma pode ser inserida

	DECLARE

	BEGIN

END novoSaldoPatrocinio;

-- trigger para atualizar saldoFinanceiroEd
	-- depende da inserção, remoção ou atualização (saldoPat) de patrocinio
CREATE OR REPLACE TRIGGER novoSaldoEdicao AFTER
	INSERT OR DELETE OR UPDATE OF saldoPat ON PATROCINIO

	for each ROW
		--WHEN ... 
		-- tem que usar para o delete
		-- mais de uma pode ser deletada, mas só uma pode ser inserida

	DECLARE

	BEGIN

END novoSaldoEdicao;




--TRIGGERS! Tem outros???