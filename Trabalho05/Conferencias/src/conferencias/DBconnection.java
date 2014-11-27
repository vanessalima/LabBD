/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conferencias;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Classe para criação, coneção e operações com a base de dados Oracle
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class DBconnection {
    private Connection con = null;
    
    /**
     * Cria e efetua a conexão com o banco de dados
     *
     * @throws java.lang.Exception
     */
    public DBconnection(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            //System.out.println("nao deu erro... ");
        }catch(Exception e){
            System.out.println("Classe "+e);
        }
        try {
            this.con = DriverManager.getConnection("jdbc:oracle:thin:@grad.icmc.usp.br:15214:orcl14","a7987456","a7987456");
            if(this.con == null) {
                System.out.println("Sem conexão");
            }
            //Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.183.15:1521:orcl","a7239256","a7239256");
            System.out.println("Conectou!!! =D");       
        }catch(Exception e){
            System.out.println("conectar"+e);
        }
    }
    
    /**
     * Método para fechar a conexão com o banco de dados
     * e enviar as alterações ao banco de dados
     * @param con
     * @throws SQLException
     */
    public void disconect() throws SQLException{
        this.commit(this.con);
        this.con.close();
    }
    
    /**
     * Metodo para efetuar o commit no banco
     *
     * @param con
     * @throws SQLException
     */
    public void commit(Connection con) throws SQLException{
        con.commit();
    }
    
    /**
     * Método para efetuar o rollback no banco
     *
     * @param con
     * @throws SQLException
     */
    public void rollback(Connection con) throws SQLException {
        con.rollback();
    }
 
    /**
     * Executa os comandos sql de update
     * 
     * @param command comando que será executado
     * @return retorna 0 caso a execução tenha falhado e 1 caso contrário
     * @throws SQLException 
     */
    public int executeCommand(String command) throws SQLException {
        Statement st = this.con.createStatement();
        return st.executeUpdate(command);
    }
    
    /**
     * Para execucao de insert, create
     * @param sql
     * @return true para sucesso, false, c.c.
     * @throws SQLException
     */
    public boolean execute(String sql) throws SQLException{
        Statement stmt = this.con.createStatement();
        //System.out.println(" .. . STMT: "+stmt.toString()+"\n | SQL: "+sql);
        boolean ret = stmt.execute(sql); // insert, create
        //System.out.println(".. pelo menos mandou pro servidor.");
        this.commit(con);
        return ret;
    }
    
    /**
     * Para execucao do comando select
     * @param sql
     * @return
     * @throws SQLException
     */
    public ResultSet query(String sql) throws SQLException {
        Statement stmt = this.con.createStatement();
        ResultSet result = stmt.executeQuery(sql); // select
        return result;
    }
}
