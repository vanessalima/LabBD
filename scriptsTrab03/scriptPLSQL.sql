/*
 * Carlos Humberto dos Santos Baqueta	7987456
 * Vanessa Apolinário de Lima			7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 03
 *
 * Script de PL-SQL < scriptPLSQL.sql >
 * 
 */
set serveroutput on; 
set verify off;

 /*
 * Pelo menos um problema que envolva a remoção ou a atualização de tuplas em uma 
tabela já existente

  Atualiza o valor de todos os auxílios do mesmo tipo dado pelo usuário, da mesma 
edição e evento e depois realiza um novo cálculo dos valores do saldo da edição e
dos patrocínios.

ERROS:
 - Verifica se o tipo de auxílio existe;
 - Verifica se o evento e edição existem;
 - Verifica se o valor inserido não extrapola o valor dos patrocínios; ???
 - Verifica por erros no update das tuplas;
 - Verifica outros erros.
NAO ESQUECER DO COMMIT

RESULTADOS:


 */

DECLARE
	-- Variavel para encontrar o evento e edição
	nome_evento evento.nomeEv%Type;
	edicao_evento edicao.numEd%Type;
	verifica_edicao edicao.numEd%Type;
	-- Variáveis para receber o tipo de auxilio e seu novo valor
	tipo_auxilio auxilio.tipoAux%Type;
	valor_aux auxilio.valorAux%Type;
	novo_valor auxilio.valorAux%Type;
	-- Cursor que busca todos os auxilios do tipo descrito
	CURSOR cursor_auxilios (nome_evento, edicao_evento, tipo_auxilio)
		IS SELECT * -- trocar depois
			FROM auxilio, edicao, evento
			WHERE UPPER(auxilio.tipoAux) = UPPER(tipo_auxilio)
				  AND UPPER(evento.nomeEv) = UPPER(nome_evento)
				  AND codEvApr = evento.codEv
				  AND numEdApr = edicao_evento;
	-- Variável de acesso ao cursor
	auxilio_substituir cursor_auxilios%RowType;

	-- Excepetions
	valor_negativo EXCEPTION;
	nenhum_auxilio EXCEPTION;
	excede_valor   EXCEPTION;
BEGIN 
	-- Procura a edição do evento, caso não exista gera um erro
	nome_evento := 'ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems';
	edicao_evento := 19;
	-- Verifica se a edição passada existe
	SELECT edicao.numEd 
		INTO verifica_edicao
		FROM edicao, evento 
		WHERE edicao.numEd = edicao_evento
			  AND evento.nomeEv = nome_evento
			  AND edicao.codEv = evento.codEv;

	-- Recebe o tipo de auxílio a ser substituído
	tipo_auxilio := 'Hosting aid';
	-- Recebe o novo valor do auxílio
	valor_aux := '1000.00';
	-- Verifica se o valor passado é realmente um número
	novo_valor := to_number(valor_aux);
	-- Verifica se o valor não é negativo
	IF novo_valor < 0.00 THEN
		RAISE valor_negativo;
	END IF;

	OPEN cursor_auxilios;
		FETCH cursor_auxilios INTO auxilio_substituir;
		IF cursor_auxilios%NOTFOUND THEN
			RAISE nenhum_auxilio;
		END IF;

		LOOP
			-- processos sobre a linha atual do cursor; 
			dbms_output.put_line ('Patrocinador: ' || auxilio_substituir.cnpjPat || 
								  ' Tipo aux: ' || auxilio_substituir.tipoAux ||
								  ' Valor aux: ' || auxilio_substituir.valorAux
								 ); 
			dbms_output.put_line ('Novo valor: ' || novo_valor-auxilio_substituir.valorAux );
			-- Fazer a verificação se é possível substituir o valor dos auxilios
			-- Se for menor, já substitui direto e recalcula os saldos, caso contrário faz a 
				-- verificação um a um

			FETCH cursor_auxilios INTO auxilio_substituir;
			EXIT WHEN cursor_auxilios%NOTFOUND;
		END LOOP;

	CLOSE cursor_auxilios;

	-- colocar nome e numero da edicao, valor antigo e valor novo
	dbms_output.put_line ('Valor alterado com sucesso.'); 

 EXCEPTION 
 	WHEN NO_DATA_FOUND
 		THEN dbms_output.put_line ('Nome do evento ou número da edição errado(s).'); 
 	WHEN VALUE_ERROR
 		THEN dbms_output.put_line ('Novo valor do auxílio está errado.'); 
 	WHEN valor_negativo
 		THEN dbms_output.put_line ('Novo valor do auxílio deve ser positivo.'); 
 	WHEN nenhum_auxilio
 		THEN dbms_output.put_line ('Não há nenhum auxílio deste tipo nesta edição.'); 
 	WHEN excede_valor
 		THEN ROLLBACK;
 			 dbms_output.put_line ('O valor não pode ser pago pelos patrocínios.'); 
 	WHEN Others 
 		THEN dbms_output.put_line ('Erro no cadastramento.' ); 
END; 