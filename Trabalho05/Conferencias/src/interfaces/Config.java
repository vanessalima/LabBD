/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

/**
 *
 * @author ch
 */
public interface Config {
    // Definicoes para mostrar as mensagens apropriadamente no form Mensagem
    int CADASTRO = 0;
    int ATUALIZACAO = 1;
    int REMOCAO = 2;
    int RELATORIO = 3;
    int SUCCESS = 1; //status da operacao
    int FAIL = 0;    //status da operacao
    
    
    int APRESENTACAO = 0;
    int ARTIGO = 1;
    int AUXILIO = 2;
    //int AVALIA_APRESENTADOR = 3;
    //int AVALIA_ARTIGO = 4;
    int DESPESA = 5;
    int EDICAO = 6;
    int EVENTO = 7;
    int INSCRITO = 8;
    int ORGANIZADOR = 9;
    int PATROCINADOR = 10;
    int PATROCINIO = 11;
    int PESSOA = 12;
    
}
