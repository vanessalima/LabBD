/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conferencias;

import java.sql.Connection;
import interfaces.NewJFrame;

/**
 *
 * @author vanessalima
 */
public class Conferencias {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        
        NewJFrame frame = new NewJFrame();
        frame.setVisible(true);
        
        DBconnection db = new DBconnection();      
        db.disconect();
    }
    
}
