/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import conferencias.DBconnection;
import java.awt.event.WindowEvent;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JFrame;

/**
 *
 * @author vanessalima
 */
public abstract class AbstractJFrame extends javax.swing.JFrame implements Config{
    protected JFrame anterior;
    protected DBconnection conn;
    protected String sql;
    
    public AbstractJFrame(JFrame ant) {
        // Faz a janela de fundo ficar invisível
        this.anterior = ant;
        this.anterior.setVisible(false);
        // Abre a janela da classe
        //this.setVisible(true);
    }
    
    protected void onClose(java.awt.event.WindowEvent evt) {                                   
        // fecha a janela
        this.dispose();
        // reabre a janela anterior
        this.anterior.setEnabled(true);
        this.anterior.setVisible(true);
    }                  
    
    protected void onClose(){
        this.dispose();
        // reabre a janela anterior
        this.anterior.setEnabled(true);
        this.anterior.setVisible(true);
    }
    
    protected void onDispose(){
        this.anterior.dispose(); // fecha a janela anterior
        this.dispose();          // fecha a janela atual
    }
    
    public void teste() {
        System.out.println("Funciona para override.");
    }
    
    public void loadInitialTable() {
        // TODO: create method on lower classes
        this.conn = new DBconnection();
        this.sql = "SELECT column_name FROM user_tab_cols WHERE table_name = 'artigo'";
        try {
            ResultSet res = conn.query(this.sql);
            int i = 0;
            while(res.next()) {
                System.out.println(res.getNString(i));
                i++;
            }
            conn.disconect();
            System.out.println("finalizou... ");
        } catch(SQLException e) {
            switch(e.getErrorCode()){
                    case -1 : // Chave duplicada
                    {                              
                        (new Mensagem(this, "Evento já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
                        break; 
                    }
                    case 1 : // Violacao de constraint UNIQUE
                    {                              
                        (new Mensagem(this, "Evento já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
                        break;
                    }
                    case 911: // Erro de sintaxe! q feio ...
                    {
                        System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                        break;
                    }
                    default:
                    {
                        System.out.println("ERROR CODE: "+e.getErrorCode());
                        e.printStackTrace();
                        break;
                    }
            }
        }
    }
    
    
}
