/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces.tables;

import conferencias.DBconnection;
import entidades.EInscrito;
import interfaces.AbstractJFrame;
import interfaces.LoadFrame;
import interfaces.Mensagem;
import java.awt.Color;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;

/**
 *
 * @author Rina
 */
public class Inscrito extends AbstractJFrame {
    private EInscrito i;
    private HashMap<String, Integer> listaEventos;
    private HashMap<String, Integer> listaPessoas;
    
    /**
     * Creates new form CadastrarInscrito
     */
    public Inscrito(AbstractJFrame ant) {
        super(ant);
        initComponents();
        this.mInitialize(null, null);
        this.setTitle("Cadastro de Inscrito");
        this.cadastrarButton.setText("Cadastrar");
    }

    public Inscrito(AbstractJFrame ant, Object obj) {
        super(ant);
        initComponents();
        this.setTitle("Atualização de Inscrito");
        this.cadastrarButton.setText("Atualizar");
        this.infoLabel.setText("*Campos que não podem ser alterados");
        this.cbEvento.setEditable(false);
        this.cbEdicao.setEditable(false);
        this.cbPessoa.setEditable(false);
        this.cadastrarInscButton.setEnabled(false);
        this.cadastrarInscButton.setVisible(false);
        if(obj instanceof EInscrito){
            this.i = (EInscrito) obj;
            
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lEvento = new javax.swing.JLabel();
        cbEvento = new javax.swing.JComboBox();
        lEdicao = new javax.swing.JLabel();
        cbEdicao = new javax.swing.JComboBox();
        lPessoa = new javax.swing.JLabel();
        cbPessoa = new javax.swing.JComboBox();
        cadastrarInscButton = new javax.swing.JButton();
        infoLabel = new javax.swing.JLabel();
        cancelarButton = new javax.swing.JButton();
        cadastrarButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setResizable(false);
        addWindowFocusListener(new java.awt.event.WindowFocusListener() {
            public void windowGainedFocus(java.awt.event.WindowEvent evt) {
                formWindowGainedFocus(evt);
            }
            public void windowLostFocus(java.awt.event.WindowEvent evt) {
            }
        });
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        lEvento.setText("Evento*");

        cbEvento.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                cbEventoMouseClicked(evt);
            }
        });
        cbEvento.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                cbEventoFocusLost(evt);
            }
        });

        lEdicao.setText("Edição*");

        lPessoa.setText("Pessoa*");

        cadastrarInscButton.setText("Cadastrar Pessoa");
        cadastrarInscButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cadastrarInscButtonActionPerformed(evt);
            }
        });

        infoLabel.setFont(new java.awt.Font("Ubuntu", 2, 15)); // NOI18N
        infoLabel.setText("* Campos obrigatórios");

        cancelarButton.setText("Cancelar");
        cancelarButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelarButtonActionPerformed(evt);
            }
        });

        cadastrarButton.setText("Cadastrar");
        cadastrarButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cadastrarButtonActionPerformed(evt);
            }
        });

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, layout.createSequentialGroup()
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(lEvento)
                            .add(lEdicao))
                        .add(18, 18, 18)
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(cbEvento, 0, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .add(layout.createSequentialGroup()
                                .add(cbEdicao, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 127, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                .add(0, 0, Short.MAX_VALUE))))
                    .add(layout.createSequentialGroup()
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(layout.createSequentialGroup()
                                .add(lPessoa)
                                .add(18, 18, 18)
                                .add(cbPessoa, 0, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .add(18, 18, 18))
                            .add(layout.createSequentialGroup()
                                .add(0, 0, Short.MAX_VALUE)
                                .add(infoLabel)
                                .add(172, 172, 172)
                                .add(cancelarButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 130, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                .add(16, 16, 16)))
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                            .add(cadastrarInscButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 142, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                            .add(cadastrarButton, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .add(9, 9, 9)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(lEvento)
                    .add(cbEvento, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(cbEdicao, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(lEdicao))
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(cbPessoa, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(lPessoa)
                    .add(cadastrarInscButton))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 22, Short.MAX_VALUE)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(infoLabel)
                    .add(cadastrarButton)
                    .add(cancelarButton))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        // TODO add your handling code here:
        this.onClose();
    }//GEN-LAST:event_formWindowClosing

    private void cbEventoMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cbEventoMouseClicked

    }//GEN-LAST:event_cbEventoMouseClicked

    private void cbEventoFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_cbEventoFocusLost
        // Se for atualizacao nao faz nada
        // if(cadastrarButton.getText().matches("Atualizar")){return;}
        // Limpa o combobox
        if (cadastrarButton.getText().matches("Atualizar")){ return; }
        cbEdicao.removeAllItems();
        cbEdicao.addItem("-");
        if(!cbEvento.getSelectedItem().toString().matches("-")){
            // Busca as edicoes associadas ao evento selecionado
            DBconnection conn = new DBconnection();
            ResultSet rs;
            String sql;
            Integer aux;

            try { // Edicoes
                sql = "SELECT numed from edicao WHERE codEv = "+listaEventos.get(cbEvento.getSelectedItem().toString())+" ORDER BY numEd";
                rs = conn.query(sql);
                System.out.println("SQL: "+sql);
                while(rs != null && rs.next()){
                    aux = rs.getInt("numed");
                    cbEdicao.addItem(aux);
                }
                if (rs != null) { rs.close(); }
                conn.disconect();
            } catch (SQLException ex) {
                Logger.getLogger(Patrocinio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }//GEN-LAST:event_cbEventoFocusLost

    private void cadastrarInscButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cadastrarInscButtonActionPerformed
        // TODO add your handling code here:
        Pessoa framePessoa = new Pessoa(this);
        framePessoa.setVisible(true);
    }//GEN-LAST:event_cadastrarInscButtonActionPerformed

    private void cancelarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarButtonActionPerformed
        super.onClose();
    }//GEN-LAST:event_cancelarButtonActionPerformed

    private void cadastrarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cadastrarButtonActionPerformed
        DBconnection conn;
        String sql;        
        
        if(this.cadastrarButton.getText().matches("Cadastrar")){ // testa se é cadastro
            if(cbEvento.getSelectedItem().toString().matches("-") || cbEdicao.getSelectedItem().toString().matches("-") || cbPessoa.getSelectedItem().toString().matches("-")){
                infoLabel.setForeground(Color.red);
                lEvento.setForeground(Color.red);
                lEdicao.setForeground(Color.red);
                lPessoa.setForeground(Color.red);
            } else {
                try{
                    conn = new DBconnection();
                    sql = "INSERT INTO inscrito (codEv, numEd, idPart, dataInsc, tipoApresentador) VALUES("+
                    this.listaEventos.get(cbEvento.getSelectedItem().toString())+", "+
                    cbEdicao.getSelectedItem().toString()+", sysdate, 1)";
                    System.out.println("SQL: "+sql);
                    conn.execute(sql);
                    conn.disconect();
                    (new Mensagem(this, this.anterior, null, SUCCESS, CADASTRO)).setEnabled(true);
                }catch(SQLException e){
                    String sujeito = "Patrocínio";
                    switch(e.getErrorCode()){
                        case -1 : // Chave duplicada
                        {
                            (new Mensagem(this, this.anterior, sujeito+" já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
                            break;
                        }
                        case 1 : // Violacao de constraint UNIQUE
                        {
                            (new Mensagem(this, this.anterior, sujeito+" já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
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
    }//GEN-LAST:event_cadastrarButtonActionPerformed

    private void formWindowGainedFocus(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowGainedFocus
        try { // Pessoa
            String sql;
            ResultSet rs;
            DBconnection conn = new DBconnection();
            if(this.cadastrarButton.getText().matches("Cadastrar")) { // No caso de cadastro:
                sql = "SELECT idPe, nomePe from pessoa ORDER BY nomePe";
                System.out.println("SQL: "+sql);
                rs = conn.query(sql);
                while(rs != null && rs.next()){
                    String auxNome = rs.getString("nomePe");
                    cbPessoa.addItem(auxNome);
                    this.listaPessoas.put(auxNome, rs.getInt("idPe"));
                }
            } 
        } catch (SQLException ex) {
            Logger.getLogger(Patrocinio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_formWindowGainedFocus

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cadastrarButton;
    private javax.swing.JButton cadastrarInscButton;
    private javax.swing.JButton cancelarButton;
    private javax.swing.JComboBox cbEdicao;
    private javax.swing.JComboBox cbEvento;
    private javax.swing.JComboBox cbPessoa;
    private javax.swing.JLabel infoLabel;
    private javax.swing.JLabel lEdicao;
    private javax.swing.JLabel lEvento;
    private javax.swing.JLabel lPessoa;
    // End of variables declaration//GEN-END:variables

    
    private void mInitialize(String cnpj, String codev) {
        if(this.cadastrarButton.getText().matches("Cadastrar")){
            cbEvento.addItem("-");
            cbEdicao.addItem("-");
            cbPessoa.addItem("-");
        }
        // New nas listas
        this.listaEventos = new HashMap<String, Integer>();
        this.listaPessoas = new HashMap<String, Integer>();
        
        // popula os comboboxes de Evento e Patrocinador:
        DBconnection conn = new DBconnection();
        ResultSet rs = null;
        String sql;
        String auxNome=null;
              
        try { // Eventos
            if(codev == null) { // No caso de cadastro:
                sql = "SELECT codEv, nomeEv from evento order by nomeEv";
            
                rs = conn.query(sql);
                while(rs != null && rs.next()){
                    auxNome = rs.getString("nomeEv");
                    cbEvento.addItem(auxNome);
                    this.listaEventos.put(auxNome, rs.getInt("codEv"));
                }
            } else { // No caso de atualizacao:
                sql = "SELECT nomeEv from evento WHERE codEv = "+codev;
                rs = conn.query(sql);
                if(rs != null && rs.next()){
                    cbEvento.addItem(rs.getString("nomeEv"));
                }
            }
            if (rs != null) { rs.close(); } 
            conn.disconect();
        } catch (SQLException ex) {
            Logger.getLogger(Patrocinio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
             
    }
}
