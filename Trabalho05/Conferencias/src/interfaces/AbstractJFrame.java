/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import conferencias.DBconnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JFrame;

/** 
 *
 * @author vanessalima
 */
public abstract class AbstractJFrame extends javax.swing.JFrame implements Config{
    protected JFrame anterior;
    private DBconnection dbcon = new DBconnection();
    private ArrayList<String> tableAttr = new ArrayList<>();
    
    public AbstractJFrame(JFrame ant) {
        // Faz a janela de fundo ficar invisível
        if (ant == null) System.out.println("VC tá passando o ponteiro null para tela anterior!!!");
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
    
    public void loadInitialTable(String tablename) throws SQLException {
        ResultSet res;
        if(!tablename.isEmpty()){
            res = dbcon.query("SELECT COLUMN_NAME FROM ALL_TAB_COLUMNS WHERE lower(TABLE_NAME) = '" + tablename.toLowerCase() +"'");
            this.tableAttr.clear();
            while(res.next()) {
                 this.tableAttr.add(res.getString(1));
            }
            for(int i = 0; i < this.tableAttr.size(); i++){
                System.out.println(this.tableAttr.get(i));
            }
        }
        
    }
    
}
