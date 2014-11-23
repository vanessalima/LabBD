/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import conferencias.DBconnection;
import java.util.ArrayList;
import java.awt.event.WindowEvent;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JFrame;

/** 
 *
 * @author vanessalima
 */
public abstract class AbstractJFrame extends javax.swing.JFrame implements Config{
    protected JFrame anterior;

    private ArrayList<String> tableAttr = new ArrayList<>();

    
     // 1 : Cadastro, 0 : Atualizacao
    protected boolean flagCadastro; // ta ruim, mas foi o que consegui pensar, sugestoes?
    
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
    
    // Nos metodos abaixo seto a flag para cadastro ou atualizacao
    // Isso deve ser feito em LoadFrame, antes de dar setEnable() na classe
    public void setCadastro(){
        flagCadastro = true;
    }
    public void setAtualizacao(){
        flagCadastro = false;
    }
    
    public ArrayList<String> getAttr(){
        return tableAttr;
    }
    
    public String getStringList(){
        String conv = new String();
        for(int i = 0; i < tableAttr.size()-1; i++ ){
            conv = conv.concat(tableAttr.get(i));
            conv = conv.concat(",");
        }
        conv = conv.concat(tableAttr.get(tableAttr.size()-1));
        return conv;
    }
    
    public Object[][] populateTable(String tablename) throws SQLException{
        ArrayList<ArrayList<String>> list2 = new ArrayList<ArrayList<String>>();
        DBconnection dbcon;
        dbcon = new DBconnection();
        ResultSet res;
        int k;

        if(!tablename.isEmpty()){
            try{
               res = dbcon.query("SELECT "+ getStringList() +" FROM "+ tablename.toLowerCase());
               k = 0;

                while(res.next()) {
                    list2.add(new ArrayList<String>() {});
                    for (int j = 0; j < tableAttr.size(); j++){
                        System.out.println(tableAttr.get(j));
                        System.out.println(res.getString(tableAttr.get(j)));
                        list2.get(k).add(res.getString(tableAttr.get(j)));
                    }
                    k++;
                }
                //System.out.println("sjdbkajsbdksd");
//                for(int i = 0; i < list2.size(); i++){
//                    System.out.println("i:" + i );
//                    System.out.println("list size:" + list2.get(i).size() );
//                    for(int j = 0; j < list2.get(i).size(); j++ ){
//                        System.out.println("j:" + j);
//                        System.out.println(list2.get(i).get(j));
//                    }
//                }
                Object[][] b = new Object[list2.size()][tableAttr.size()];
                for(int i = 0; i < list2.size(); i++){
                        b[i] = list2.get(i).toArray();
                }
                
                 dbcon.disconect();
                 
                 return b;

            } catch(SQLException e) {
            switch(e.getErrorCode()){
                    case 911: // Erro de sintaxe! q feio ...
                    {
                        System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                        break;
                    }
                    default:
                    {
                        System.out.println("ERROR CODE: "+e.getErrorCode());
                        break;
                    }
            }
            
        }
      }
        return (Object[][]) new Object();

    } 
    
    public void loadInitialTable(String tablename) throws SQLException {
        DBconnection dbcon;
        dbcon = new DBconnection();
        ResultSet res;
        if(!tablename.isEmpty()){
            try{
               res = dbcon.query("SELECT COLUMN_NAME FROM ALL_TAB_COLUMNS WHERE lower(TABLE_NAME) = '" + tablename.toLowerCase() +"'");
            
                this.tableAttr.clear();
                while(res.next()) {
                     this.tableAttr.add(res.getString(1));
                }
                for(int i = 0; i < this.tableAttr.size(); i++){
                    System.out.println(this.tableAttr.get(i));
                }
                
            
            } catch(SQLException e) {
            switch(e.getErrorCode()){
                    case 911: // Erro de sintaxe! q feio ...
                    {
                        System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                        break;
                    }
                    default:
                    {
                        System.out.println("ERROR CODE: "+e.getErrorCode());
                        break;
                    }
            }
            
            dbcon.disconect();
        }
      }
    }
    
}
  
