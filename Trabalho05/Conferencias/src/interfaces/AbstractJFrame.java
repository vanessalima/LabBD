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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;

/** 
 *
 * @author vanessalima
 */
public abstract class AbstractJFrame extends javax.swing.JFrame implements Config{
    protected JFrame anterior;

    private ArrayList<String> tableAttr = new ArrayList<>();
    private ArrayList<String> fromAttr = new ArrayList<>();
    private ArrayList<String> whereAttr = new ArrayList<>();
    private String tablename;
    private String sqlBasic = new String();
    
     // true : Cadastro, false : Atualizacao
    protected boolean flagCadastro; // ta ruim, mas foi o que consegui pensar, sugestoes?
    
    public AbstractJFrame(JFrame ant) {
        // Faz a janela de fundo ficar invisível
        if (ant == null) System.out.println("VC tá passando o ponteiro null para tela anterior!!!");
        this.anterior = ant;
        this.anterior.setVisible(false);
        // Abre a janela da classe
        this.setVisible(true);
        this.setResizable(false);
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
    
    /**
     * 
     */
    public void setCadastro(){
        this.flagCadastro = true;
        System.out.println("Setou flagCadastro = "+flagCadastro);
    }
    
    /**
     * 
     */
    public void setAtualizacao(){
        this.flagCadastro = false;
        System.out.println("Setou flagCadastro = "+flagCadastro);
    }
    
    /**
     * 
     * @return 
     */
    public boolean isCadastro(){
        System.out.println(" ---- flagCadastro: "+flagCadastro);
        return this.flagCadastro;
    }
    
    
    // fim seta flag para Cadastro
    
    /**
     * 
     * @return 
     */
    public ArrayList<String> getAttr(){
        return tableAttr;
    }
    
    /**
     * 
     * @return 
     */
    public String prepareSelect(){
        String conv = new String();
        
        //int size = tableAttr.size();
        conv = conv.concat("SELECT ");
        
        for(int i = 0; i < tableAttr.size(); i++ ){          
            if(i != 0)
                conv = conv.concat(",");
            
            if( this.tableAttr.get(i).equalsIgnoreCase("codev") && !this.tablename.equalsIgnoreCase("evento")){
               conv = conv.concat("evento." + tableAttr.get(i));
               continue;
            }
            if( this.tableAttr.get(i).equalsIgnoreCase("cnpjpat") && !this.tablename.equalsIgnoreCase("patrocinador")){
                conv = conv.concat("patrocinador." + tableAttr.get(i));
                continue;
            }
            if( this.tableAttr.get(i).equalsIgnoreCase("idpe") && !this.tablename.equalsIgnoreCase("pessoa")){
                conv = conv.concat("pessoa." + tableAttr.get(i));
                continue;
            }
             if( this.tableAttr.get(i).equalsIgnoreCase("idart") && !this.tablename.equalsIgnoreCase("artigo")){
                conv = conv.concat("artigo." + tableAttr.get(i));
                continue;
            }
            conv = conv.concat(tableAttr.get(i));
        }
        
        conv = conv.concat(" FROM ");
        for(int i = 0; i < fromAttr.size(); i++ ){          
            conv = conv.concat(fromAttr.get(i));
            if(i != (fromAttr.size()-1))
                conv = conv.concat(",");
        }
        
        if(fromAttr.size() > 1){
            conv = conv.concat(" WHERE ");
            for(int i = 0; i < whereAttr.size(); i++ ){          
                conv = conv.concat(whereAttr.get(i));
                if(i != (whereAttr.size()-1))
                    conv = conv.concat(" AND ");
        }
        
        }
        
        return conv;
    }
    
    /**
     * 
     * @param tablename
     * @return
     * @throws SQLException 
     */
    public Object[][] populateTable(String tablename) throws SQLException{
        ArrayList<ArrayList<String>> list2 = new ArrayList<ArrayList<String>>();
        DBconnection dbcon;
        dbcon = new DBconnection();
        ResultSet res;
        
        int k;
        
        this.sqlBasic = prepareSelect();
        System.out.println(this.sqlBasic + "\n");

        if(!tablename.isEmpty()){
            try{
//           
               res = dbcon.query(this.sqlBasic);
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
        return null;
    } 
    
    public void findAllAttr(){
        
         for(int i = 0; i < this.tableAttr.size(); i++ ){
            if( this.tableAttr.get(i).equalsIgnoreCase("codev") && !this.tablename.equalsIgnoreCase("evento")){
                this.tableAttr.add("NOMEEV");
                this.fromAttr.add("evento");
                this.whereAttr.add(this.tablename + ".codev = evento.codev");
            }
            if( this.tableAttr.get(i).equalsIgnoreCase("cnpjpat") && !this.tablename.equalsIgnoreCase("patrocinador")){
                this.tableAttr.add("RAZAOSOCIALPAT");
                this.fromAttr.add("patrocinador"); 
                this.whereAttr.add(this.tablename + ".cnpjpat = patrocinador.cnpjpat");
            }
            if( this.tableAttr.get(i).equalsIgnoreCase("idpe") && !this.tablename.equalsIgnoreCase("pessoa")){
                this.tableAttr.add("NOMEPE");
                this.fromAttr.add("pessoa");
                this.whereAttr.add(this.tablename + ".idpe = pessoa.idpe");
            }
            if( this.tableAttr.get(i).equalsIgnoreCase("idorg") && !this.tablename.equalsIgnoreCase("pessoa")){
                this.tableAttr.add("NOMEPE");
                this.fromAttr.add("pessoa"); 
                this.whereAttr.add(this.tablename + ".idorg = pessoa.idpe");
            }
            if( this.tableAttr.get(i).equalsIgnoreCase("idaut") && !this.tablename.equalsIgnoreCase("pessoa")){
                this.tableAttr.add("NOMEPE");
                this.fromAttr.add("pessoa"); 
                this.whereAttr.add(this.tablename + ".idaut = pessoa.idpe");
            }
            if( this.tableAttr.get(i).equalsIgnoreCase("idapr") && !this.tablename.equalsIgnoreCase("pessoa")){
                this.tableAttr.add("NOMEPE");
                this.fromAttr.add("pessoa");
                this.whereAttr.add(this.tablename + ".idapr = pessoa.idpe");
            }
            if( this.tableAttr.get(i).equalsIgnoreCase("idpart") && !this.tablename.equalsIgnoreCase("pessoa")){
                this.tableAttr.add("NOMEPE");
                this.fromAttr.add("pessoa");
                this.whereAttr.add(this.tablename + ".idpart = pessoa.idpe");
            }
             if( this.tableAttr.get(i).equalsIgnoreCase("idart") && !this.tablename.equalsIgnoreCase("artigo")){
                this.tableAttr.add("TITULOART");
                this.fromAttr.add("artigo"); 
                this.whereAttr.add(this.tablename + ".idart = artigo.idart");
            }
//            if( this.tableAttr.get(i).equalsIgnoreCase("codevpat") && !this.tablename.equalsIgnoreCase("evento")){
//                this.tableAttr.add("NOMEEV");
//                this.fromAttr.add("evento");
//                this.whereAttr.add(this.tablename + ".codevpat = evento.codev");
//            }
            
        }
    }
    
    /**
     * 
     * @param tablename
     * @throws SQLException 
     */
    public void loadInitialTable(String tablename) throws SQLException {
        DBconnection dbcon;
        dbcon = new DBconnection();
        ResultSet res;
        this.tablename = tablename;
        this.fromAttr.add(tablename);
        
        if(!tablename.isEmpty()){
            try{
               res = dbcon.query("SELECT COLUMN_NAME FROM ALL_TAB_COLUMNS WHERE lower(TABLE_NAME) = '" + tablename.toLowerCase() +"'");
               
                this.tableAttr.clear();
                while(res.next()) {
                     this.tableAttr.add(res.getString(1));
                }
                
                findAllAttr();

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
    
    /**
     * 
     * @param table
     * @param field
     * @return 
     */
    public String[] getFieldType(String table, String field) {
        
        if(table.isEmpty() || field.isEmpty()) {
            System.out.println("ERRO: String vazia!");
            return new String[]{};
        }
        
        DBconnection dbcon;
        dbcon = new DBconnection();
        ResultSet res;
        try{
               res = dbcon.query("SELECT DATA_TYPE FROM ALL_TAB_COLUMNS WHERE lower(TABLE_NAME) = '" +
                       table.toLowerCase() +"' AND lower(COLUMN_NAME) = '"+field.toLowerCase()+"'");
               
                if(res.next()) {
                   switch(res.getString(1).toLowerCase()) {
                       case "number":
                           return new String[]{"<", ">", "<=", ">=", "==", "!="};
                       case "varchar2":
                           return new String[]{"igual à", "contém"};
                       case "date":
                           return new String[]{"DD/MM/AAAA", "dia", "mes", "ano"};
                   }
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
            }
            
        try {
            dbcon.disconect();
        } catch (SQLException e) {
            System.out.println("ERROR CODE: "+e.getErrorCode());
            System.out.println("Problema para desconectar");
        }
        
        return new String[]{};
    }
    
    public void removeRow(String tablename, String field, String code) {
        if(tablename.isEmpty() || field.isEmpty() || code.isEmpty())
            System.out.println("ERRO: String vazia!");
        
        System.out.println("DELETE FROM "+tablename+" WHERE "+field.toLowerCase()+" = "+code.toLowerCase());
        
        DBconnection dbcon;
        dbcon = new DBconnection();
        boolean res;
        try{
               res = dbcon.execute("DELETE FROM "+tablename+" WHERE "+field.toLowerCase()+" = "+code.toLowerCase());
               System.out.println(res);
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
            
        try {
            dbcon.disconect();
        } catch (SQLException e) {
            System.out.println("ERROR CODE: "+e.getErrorCode());
            System.out.println("Problema para desconectar");
        }
    }

}
  
