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
    protected boolean flagCadastro; // Usada em LoadFrame
    
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
//        this.anterior.setEnabled(true);
        this.anterior.setVisible(true);
    }                  
    
    protected void onClose(){
        this.dispose();
        // reabre a janela anterior
//        this.anterior.setEnabled(true);
        this.anterior.setVisible(true);
    }
    
    protected void onDispose(){ // Fecha todas as janelas anteriores 
        if(this.anterior instanceof AbstractJFrame){// fecha a janela anterior
            ((AbstractJFrame)this.anterior).onDispose();
        }else{
            this.anterior.dispose(); // fecha a janela progenitora
        }
        this.dispose();          // fecha a janela atual
        System.exit(1);
    }
    
    public void teste() {
        System.out.println("Funciona para override.");
    }
    
    // Nos metodos abaixo seto a flag para cadastro ou atualizacao
    // Isso deve ser feito em LoadFrame, antes de dar setEnable() na classe
    // (Possivelmente vai sair esses metodos)
    public void setCadastro(){
        this.flagCadastro = true;
        System.out.println("Setou flagCadastro = "+flagCadastro);
    }
    public void setAtualizacao(){
        this.flagCadastro = false;
        System.out.println("Setou flagCadastro = "+flagCadastro);
    }
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
    public Object[][] populateTable(String tablename) {
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
                        //System.out.println(tableAttr.get(j));
                        //System.out.println(res.getString(tableAttr.get(j)));
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

                /*for(int i = 0; i < this.tableAttr.size(); i++){
                    System.out.println(this.tableAttr.get(i));
                }*/
                
            
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
        String sql;
        try{
               sql = "SELECT DATA_TYPE FROM ALL_TAB_COLUMNS WHERE lower(TABLE_NAME) = '" +
                       table.toLowerCase() +"' AND lower(COLUMN_NAME) = '"+field.toLowerCase()+"'";
               System.out.println(sql);
               res = dbcon.query(sql);
               
                if(res.next()) {
                   switch(res.getString(1).toLowerCase()) {
                       case "number":
                           return new String[]{"<", ">", "<=", ">=", "=", "!="};
                       case "varchar2":
                           return new String[]{"igual à", "contém"};
                       case "date":
                           return new String[]{"antes de (DD/MM/AAAA)", "depois de (DD/MM/AAAA)", 
                               "na data (DD/MM/AAAA)", "dia", "mes", "ano"};
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
    
    public void removeRow(String tablename, Object[] values) {
        if(tablename.isEmpty())
            System.out.println("ERRO: String vazia!");
        
        DBconnection dbcon;
        dbcon = new DBconnection();
        String sql;
        ResultSet res;
        
        try{
               sql = "SELECT cols.column_name, cols.position" +
                                " FROM all_constraints cons, all_cons_columns cols " +
                                " WHERE lower(cols.table_name) = '" + tablename.toLowerCase()+ "' " +
                                " AND cons.constraint_type = 'P' " +
                                " AND cons.constraint_name = cols.constraint_name " +
                                " AND cons.owner = cols.owner " +
                                " ORDER BY cols.table_name, cols.position";
               System.out.println("Lista as PRIMARY KEYS: \n" + sql);
               res = dbcon.query(sql);
               
               int i = 0;
               sql = "DELETE FROM "+tablename+" WHERE ";
               while(res.next()) {
                   if(i > 0)
                       sql += " AND ";
                   sql += res.getString(1) + " = " + values[res.getInt(2)-1].toString();
                   i++;
               }
               System.out.println(sql);
               dbcon.execute(sql);
               
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
    
    
    public Object[][] getSearch(String tablename, ArrayList<ArrayList<Object>> filters) {
        if(tablename.isEmpty() || filters.isEmpty()) {
            System.out.println("ERRO: String vazia!");
            return this.populateTable(tablename);
        }
        
        DBconnection dbcon;
        dbcon = new DBconnection();
        String sql;
        int flag = 0;
        ResultSet res = null;
        int k = 0;
        ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();;
        
        try{
               sql = this.sqlBasic;
               if(sql.contains("WHERE"))
                   flag = 1;
               else
                   sql += " WHERE ";
               
                       //"SELECT "+ this.getStringList() + " FROM "+tablename+" WHERE ";
               // itera pelos filtros, adicionando os mesmos na busca
               for(int i = 0; i < filters.size(); i++) {
                   if(flag == 1) {
                       sql += " AND ";
                   }
                   flag = 1;
                   
                   // adiciona o nome da tabela caso seja o código da mesma
                   if(filters.get(i).get(0).toString().toLowerCase().equals("codev") ||
                           filters.get(i).get(0).toString().toLowerCase().equals("idpe") ||
                           filters.get(i).get(0).toString().toLowerCase().equals("idart") ||
                           filters.get(i).get(0).toString().toLowerCase().equals("cnpjpat") ) {
                       sql += tablename + ".";
                   }
                   
                   switch(filters.get(i).get(1).toString()) {
                       case "<":
                       case ">":
                       case "<=":
                       case ">=":
                       case "=":
                       case "!=":
                           sql += filters.get(i).get(0).toString() + " " +// campo
                                   filters.get(i).get(1).toString() + " " +  // operador
                                   filters.get(i).get(2).toString();        // valor
                           break;
                       case "igual à":
                           sql += "lower(" + filters.get(i).get(0).toString() + ") = '" + 
                                   filters.get(i).get(2).toString().toLowerCase() + "'";
                           break;
                       case "contém":
                           sql += "lower(" + filters.get(i).get(0).toString() + ") LIKE '%" + 
                                   filters.get(i).get(2).toString().toLowerCase() + "%'";
                           break;
                       case "antes de (DD/MM/AAAA)":
                           sql += filters.get(i).get(0).toString() + " < TO_DATE('" + 
                                   filters.get(i).get(2).toString().toLowerCase() + "', 'DD/MM/YYYY')";
                           break;
                       case "depois de (DD/MM/AAAA)":
                           sql += filters.get(i).get(0).toString() + " > TO_DATE('" + 
                                   filters.get(i).get(2).toString().toLowerCase() + "', 'DD/MM/YYYY')";
                           break;
                       case "na data (DD/MM/AAAA)":
                           sql += filters.get(i).get(0).toString() + " = TO_DATE('" + 
                                   filters.get(i).get(2).toString().toLowerCase() + "', 'DD/MM/YYYY')";
                           break;
                       case "dia":
                           sql += "EXTRACT( DAY FROM " + filters.get(i).get(0).toString() + ") = " + 
                                   filters.get(i).get(2).toString().toLowerCase();
                           break;
                       case "mes":
                           sql += "EXTRACT( MONTH FROM " + filters.get(i).get(0).toString() + ") = " + 
                                   filters.get(i).get(2).toString().toLowerCase();
                           break;
                       case "ano":
                           sql += "EXTRACT( YEAR FROM " + filters.get(i).get(0).toString() + ") = " + 
                                   filters.get(i).get(2).toString().toLowerCase();
                           break;
                   }
               }
               System.out.println(sql);
               
               res = dbcon.query(sql);
               
               while(res.next()) {
                    list.add(new ArrayList<String>() {});
                    for (int j = 0; j < tableAttr.size(); j++){
                        //System.out.println(tableAttr.get(j));
                        //System.out.println(res.getString(tableAttr.get(j)));
                        list.get(k).add(res.getString(tableAttr.get(j)));
                    }
                    k++;
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
        
        if(res == null || list.isEmpty()) {
            return this.populateTable(tablename);
        }
                
        Object[][] b = new Object[list.size()][tableAttr.size()];
        for(int i = 0; i < list.size(); i++){
            b[i] = list.get(i).toArray();
        }
        
        return b;
    }
    
    
    // Tentativa fiasco de fazer o update generico. Vanessa se vc nao for mexer 
    // com isso pode deletar. Só deixei aqui pra modi ajuda ocê se caso
    // cê tentasse se aventura por essa zágua.
    public void updateTable(String tablename, String values[]){
        // Não está sendo feita verificacoes de tipo aqui. 
        //Assume-se que os parâmetros já estão prontos para montar o comando sql.
        /*int i = 0;
        String sql = "UPDATE "+tableName+" SET ";
        for(i = 0; i < params.length-1; i++){
            sql += params[i]+" = "+values[i]+", ";
        }
        sql += params[i]+" = "+values[i];
        sql += " WHERE ";
        for(i=0; i < key.length-1; i++){
            sql += key[i]+" = "+keyValue[i]+" AND ";
        }
        sql += key[i]+" = "+keyValue[i];
        
        System.out.println("SQL [UPDATE] = "+sql);
        */
    
        if(tablename.isEmpty())
            System.out.println("ERRO: String vazia!");
        
        DBconnection dbcon;
        dbcon = new DBconnection();
        String sql, sql2 = "";
        ResultSet res;
        
        try{
               sql = "SELECT cols.column_name, cols.position" +
                                " FROM all_constraints cons, all_cons_columns cols " +
                                " WHERE lower(cols.table_name) = '" + tablename.toLowerCase()+ "' " +
                                " AND cons.constraint_type = 'P' " +
                                " AND cons.constraint_name = cols.constraint_name " +
                                " AND cons.owner = cols.owner " +
                                " ORDER BY cols.table_name, cols.position";
               System.out.println("Lista as PRIMARY KEYS: \n" + sql);
               res = dbcon.query(sql);
               int i = 0;
               ArrayList<Integer> keys = new ArrayList<Integer>();
               
               // Aqui não precisa fazer verificação de tipo, pois todas as chaves primárias são números
               while(res.next()) {
                   if(i > 0)
                       sql2 += " AND ";
                   sql2 += res.getString(1) + " = " + values[res.getInt(2)-1].toString();
                   keys.add(res.getInt(2)-1);
                   i++;
               }
               
               sql = "UPDATE "+tablename+" SET ";
               // aqui eu tem que verificar, eu coloquei como se fosse número
               for(i = 0; i < values.length; i++) {
                   if(keys.contains(i)) {
                       continue;
                   }
                   sql += this.tableAttr.get(i) + " = " + values[res.getInt(2)-1].toString();
               }
               
               sql += " WHERE " + sql2;
               
               System.out.println(sql);
               dbcon.execute(sql);
               
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
  
