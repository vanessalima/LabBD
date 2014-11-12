/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conferencias;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author vanessalima
 */
public class DBconnection {
    private static Connection con = null;
    
    public DBconnection() throws Exception{
    }
    
    /**
     * Método para fechar a conexão com o banco de dados
     *
     * @param con
     * @throws SQLException
     */
    public void disconect(Connection con) throws SQLException{
        con.close();
    }
    
    /**
     * Metodo para efetuar o commit no banco
     *
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
     * Efetua a conexão com o banco de dados
     *
     * @return
     */
    public static Connection getConexao(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("nao deu erro... ");
        }catch(Exception e){
                    System.out.println("Classe "+e);
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@grad.icmc.usp.br:15215:orcl","a7239256","a7239256");
            //Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.183.15:1521:orcl","a7239256","a7239256");
            System.out.println("Conectou!!! =D");
            return con;
        }catch(Exception e){
            System.out.println("conectar"+e);
            return null;
        }
    }
    
    /**
     * Executa o comando sql
     * 
     * @param command comando que será executado
     * @return retorna 0 caso a execução tenha falhado e 1 caso contrário
     * @throws SQLException 
     */
    public int executeCommand(String command) throws SQLException {
        Statement st = con.createStatement();
        return st.executeUpdate(command);
    }

}
