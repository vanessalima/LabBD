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
public class myTableModel extends javax.swing.table.DefaultTableModel{

    myTableModel(Object[][] data, Object[] columnNames) {
        super(data, columnNames);
    }
    @Override
    
    public boolean isCellEditable(int rowIndex,int cIndex){
        return false;
    }
}

