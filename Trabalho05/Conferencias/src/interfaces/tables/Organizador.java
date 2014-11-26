/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces.tables;

import conferencias.DBconnection;
import entidades.EOrganizador;
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
 * @author vanessalima
 */
public class Organizador extends AbstractJFrame {
    private HashMap<String, Integer> listaEventos;
    private HashMap<String, Integer> listaPessoas;

    private EOrganizador p;
    
    /**
     * Creates new form Organizador
     */
    public Organizador(JFrame ant) {
        super(ant);
        initComponents();
        this.mInitialize();
        this.setTitle("Cadastro de Organizador");
        this.cadastrarButton.setText("Cadastrar");
    }

    public Organizador(JFrame ant, Object obj) {
        super(ant);
        initComponents();
        this.setTitle("Atualização de Organizador");
        this.cadastrarButton.setText("Atualizar");
        this.infoLabel.setText("*Campos que não podem ser alterados");
        this.cbEvento.setEditable(false);
        this.cbEdicao.setEditable(false);
        this.cbPessoa.setEditable(false);
        this.cadastrarOrgButton.setEnabled(false);
        this.cadastrarOrgButton.setVisible(false);
        if (obj instanceof EOrganizador){
            this.p = (EOrganizador)obj;
            this.cbPessoa.addItem(this.p.getNomePe());
            this.cbEdicao.addItem(this.p.getNumEd());
            this.cbEvento.addItem(this.p.getNomeEv());
            this.tfCargo.setText(this.p.getCargoOrg());
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

        cbEvento = new javax.swing.JComboBox();
        lEvento = new javax.swing.JLabel();
        lEdicao = new javax.swing.JLabel();
        cbEdicao = new javax.swing.JComboBox();
        lPessoa = new javax.swing.JLabel();
        cbPessoa = new javax.swing.JComboBox();
        cadastrarOrgButton = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        cancelarButton = new javax.swing.JButton();
        cadastrarButton = new javax.swing.JButton();
        infoLabel = new javax.swing.JLabel();
        tfCargo = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
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

        lEvento.setText("Evento*");

        lEdicao.setText("Edição*");

        lPessoa.setText("Pessoa*");

        cadastrarOrgButton.setText("Cadastrar Pessoa");
        cadastrarOrgButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cadastrarOrgButtonActionPerformed(evt);
            }
        });

        jLabel2.setText("Cargo");

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

        infoLabel.setFont(new java.awt.Font("Ubuntu", 2, 15)); // NOI18N
        infoLabel.setText("* Campos obrigatórios");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lEvento)
                            .addComponent(lEdicao))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(cbEvento, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(cbEdicao, javax.swing.GroupLayout.PREFERRED_SIZE, 128, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(infoLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 151, Short.MAX_VALUE)
                        .addComponent(cancelarButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(cadastrarButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lPessoa)
                            .addComponent(jLabel2))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(cbPessoa, 0, 349, Short.MAX_VALUE)
                            .addComponent(tfCargo))
                        .addGap(18, 18, 18)
                        .addComponent(cadastrarOrgButton)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lEvento)
                    .addComponent(cbEvento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cbEdicao, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lEdicao))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cbPessoa, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lPessoa)
                    .addComponent(cadastrarOrgButton))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(tfCargo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 17, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cadastrarButton)
                    .addComponent(cancelarButton)
                    .addComponent(infoLabel))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

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

    private void cancelarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarButtonActionPerformed
        super.onClose();
    }//GEN-LAST:event_cancelarButtonActionPerformed

    private void cadastrarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cadastrarButtonActionPerformed
        DBconnection conn;
        String sql;
        String valorPat=null;
        
        if(this.cadastrarButton.getText().matches("Cadastrar")){ // testa se é cadastro
            if(cbEvento.getSelectedItem().toString().matches("-") || cbEdicao.getSelectedItem().toString().matches("-") || cbPessoa.getSelectedItem().toString().matches("-")){
                infoLabel.setForeground(Color.red);
                lEvento.setForeground(Color.red);
                lEdicao.setForeground(Color.red);
                lPessoa.setForeground(Color.red);
            } else {
                try{
                    conn = new DBconnection();
                    sql = "INSERT INTO organiza(idOrg, codEv, numEd, cargoOrg) VALUES ("+
                    this.listaPessoas.get(cbPessoa.getSelectedItem().toString())+", "+
                    this.listaEventos.get(cbEvento.getSelectedItem().toString())+", "+
                    cbEdicao.getSelectedItem().toString()+", '"+
                    tfCargo.getText()+"')";
                    System.out.println("SQL: "+sql);
                    conn.execute(sql);
                    conn.disconect();
                    (new Mensagem(this, this.anterior, null, SUCCESS, CADASTRO)).setEnabled(true);
                }catch(SQLException e){
                    String sujeito = "Organizador ";
                    switch(e.getErrorCode()){
                        case -1 : // Chave duplicada
                        {
                            (new Mensagem(this, this.anterior, sujeito+" já organiza essa edição do evento.", FAIL, CADASTRO)).setEnabled(true);
                            break;
                        }
                        case 911: // Erro de sintaxe! q feio ...
                        {
                            System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                            break;
                        }
                        default:
                        {
                            (new Mensagem(this, this.anterior, null, FAIL, CADASTRO)).setEnabled(true);
                            System.out.println("ERROR CODE: "+e.getErrorCode());
                            e.printStackTrace();
                            break;
                        }
                    }
                }
            }
        } else { // É Atualizacao!

            try{
                conn = new DBconnection();
                sql = "UPDATE organiza SET cargoOrg = '"+tfCargo.getText()+"' WHERE idOrg = "+
                this.p.getIdOrg()+" AND codEv = "+this.p.getCodEv()+" AND numEd = "+this.p.getNumEd();
                System.out.println("SQL: "+sql);
                conn.execute(sql);
                conn.disconect();
                (new Mensagem(this, this.anterior, null, SUCCESS, ATUALIZACAO)).setEnabled(true);
            }catch(SQLException e){
                switch(e.getErrorCode()){
                    case 911: // Erro de sintaxe! q feio ...
                    {
                        System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                        break;
                    }
                    case 904:
                    {
                        (new Mensagem(this, this.anterior,"Uso de caracter não permitido.", FAIL, ATUALIZACAO)).setEnabled(true);
                        break;
                    }
                    default:
                    {
                        (new Mensagem(this, this.anterior, e.getMessage(), FAIL, ATUALIZACAO)).setEnabled(true);
                        System.out.println("ERROR CODE: "+e.getErrorCode());
                        e.printStackTrace();
                        break;
                    }
                }
            }
        }
    }//GEN-LAST:event_cadastrarButtonActionPerformed

    private void cadastrarOrgButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cadastrarOrgButtonActionPerformed
        // TODO add your handling code here:
        Pessoa framePessoa = new Pessoa(this);
        framePessoa.setVisible(true);
    }//GEN-LAST:event_cadastrarOrgButtonActionPerformed

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        // TODO add your handling code here:
        this.onClose();
    }//GEN-LAST:event_formWindowClosing

    private void formWindowGainedFocus(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowGainedFocus
        // TODO add your handling code here:
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
    private javax.swing.JButton cadastrarOrgButton;
    private javax.swing.JButton cancelarButton;
    private javax.swing.JComboBox cbEdicao;
    private javax.swing.JComboBox cbEvento;
    private javax.swing.JComboBox cbPessoa;
    private javax.swing.JLabel infoLabel;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel lEdicao;
    private javax.swing.JLabel lEvento;
    private javax.swing.JLabel lPessoa;
    private javax.swing.JTextField tfCargo;
    // End of variables declaration//GEN-END:variables


    private void mInitialize() {
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
//            if(codev == null) { // No caso de cadastro:
                sql = "SELECT codEv, nomeEv from evento order by nomeEv";
            
                rs = conn.query(sql);
                while(rs != null && rs.next()){
                    auxNome = rs.getString("nomeEv");
                    cbEvento.addItem(auxNome);
                    System.out.println("inseriu...");
                    this.listaEventos.put(auxNome, rs.getInt("codEv"));
//                }
            } 
            if (rs != null) { rs.close(); } 
            conn.disconect();
        } catch (SQLException ex) {
            Logger.getLogger(Patrocinio.class.getName()).log(Level.SEVERE, null, ex);
        }         
    }

}
