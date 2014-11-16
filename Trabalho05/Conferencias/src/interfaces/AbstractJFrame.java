/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.awt.event.WindowEvent;
import javax.swing.JFrame;

/**
 *
 * @author vanessalima
 */
public abstract class AbstractJFrame extends javax.swing.JFrame implements Config{
    protected JFrame anterior;
    
    public AbstractJFrame(JFrame ant) {
        // Faz a janela de fundo ficar invisível
        this.anterior = ant;
        this.anterior.setVisible(false);
        // Abre a janela da classe
        this.setVisible(true);
    }
    
    public AbstractJFrame() {
        //initComponents();
    }
    
    protected void onClose(java.awt.event.WindowEvent evt) {                                   
        // fecha a janela
        this.dispose();
        // reabre a janela anterior
        this.anterior.setEnabled(true);
        this.anterior.setVisible(true);
    }                  
    
    
}
