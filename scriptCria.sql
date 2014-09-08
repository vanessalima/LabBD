/*
 * Carlos Humberto dos Santos Baqueta	7987456
 * Vanessa Apolinário de Lima			7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 01
 *
 * Script de Criação < scriptCria.sql >
 * 
 */
/
-- Configuração do uso de caracteres especiais
ALTER SESSION SET NLS_LANGUAGE= 'PORTUGUESE' NLS_TERRITORY= 'BRAZIL'
/
-- Evita problemas com a criação incorreta de sequências 
ALTER SESSION SET deferred_segment_creation = FALSE;
/
-- Remoção das Tabelas
DROP TABLE emissora CASCADE CONSTRAINT;
DROP TABLE nome CASCADE CONSTRAINT;
/
-- Remoção das Sequências
DROP SEQUENCE SEQ_IDDE_DEPTO;
/
-- Criação da tabela XXX
/*
 * Descrever a função da tabela 
 */
CREATE TABLE XXX (
	CHAVE Number(2) NOT NULL,	-- Chave primária

	CONSTRAINT PK_XXX PRIMARY KEY (CHAVE) -- PK_XXX define a restrição de chave primária
);



