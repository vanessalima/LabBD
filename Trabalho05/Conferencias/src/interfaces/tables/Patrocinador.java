/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces.tables;

import conferencias.DBconnection;
import interfaces.AbstractJFrame;
import interfaces.Mensagem;
import java.awt.Color;
import java.sql.SQLException;
import javax.swing.JFrame;

/**
 *
 * @author vanessalima
 */
public class Patrocinador extends AbstractJFrame {
    
    /**
     * Creates new form Patrocinador
     */
    public Patrocinador(JFrame ant) {
        super(ant);
        initComponents();
    }
    
   
    public void configuraViews(){
        if(super.isCadastro()){ // testa se é atualizacao e troca o nome do frame e do botao
            this.setTitle("Cadastro de Patrocinador");
            this.cadastrarButton.setText("Cadastrar");
        } else {
            this.setTitle("Atualização de Patrocinador");
            this.cadastrarButton.setText("Atualizar");
            this.infoLabel.setText("*Campos que não podem ser alterados");
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

        jFormattedTextField1 = new javax.swing.JFormattedTextField();
        lCNPJ = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        infoLabel = new javax.swing.JLabel();
        cancelarButton = new javax.swing.JButton();
        cadastrarButton = new javax.swing.JButton();
        tfCNPJ = new javax.swing.JTextField();
        tfRazaoSocial = new javax.swing.JTextField();
        tfTelefone = new javax.swing.JTextField();
        tfEndereco = new javax.swing.JTextField();

        jFormattedTextField1.setText("jFormattedTextField1");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        lCNPJ.setText("CNPJ*");

        jLabel2.setText("Razão Social");

        jLabel3.setText("Telefone");

        jLabel4.setText("Endereço");

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

        tfCNPJ.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tfCNPJActionPerformed(evt);
            }
        });

        tfRazaoSocial.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tfRazaoSocialActionPerformed(evt);
            }
        });

        tfTelefone.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tfTelefoneActionPerformed(evt);
            }
        });

        tfEndereco.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tfEnderecoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(infoLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(cancelarButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(cadastrarButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(lCNPJ))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(tfCNPJ)
                            .addComponent(tfRazaoSocial)))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4))
                        .addGap(33, 33, 33)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(tfEndereco)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(tfTelefone, javax.swing.GroupLayout.DEFAULT_SIZE, 150, Short.MAX_VALUE)
                                .addGap(389, 389, 389)))))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lCNPJ)
                    .addComponent(tfCNPJ, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(tfRazaoSocial, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(tfEndereco, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(tfTelefone, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(infoLabel)
                    .addComponent(cadastrarButton)
                    .addComponent(cancelarButton))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    
    
    private void cancelarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarButtonActionPerformed
        super.onClose();
    }//GEN-LAST:event_cancelarButtonActionPerformed

    private void cadastrarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cadastrarButtonActionPerformed
        DBconnection conn;
        String sql;
        if(isCadastro()){ // testa se é cadastro
            if(tfCNPJ.getText().matches("")){
            infoLabel.setForeground(Color.red);
            lCNPJ.setForeground(Color.red);
            } else {
                if (tfCNPJ.getText().matches("[^0-9]+")){ // Nao testei o lance de der 14 digitos pq nao tenho certeza disso..
                    infoLabel.setText("O CNPJ deve conter apenas números.");
                    infoLabel.setForeground(Color.red);
                    lCNPJ.setForeground(Color.red);
                    return;
                }
                try{
                    conn = new DBconnection();
                    sql = "INSERT INTO patrocinador (cnpjPat, razaoSocialPat, telefonePat, enderecoPat) VALUES("+tfCNPJ.getText()+", '"+tfRazaoSocial.getText()+"', '"+
                            tfTelefone.getText()+"', '"+tfEndereco.getText()+"')";
                    conn.execute(sql);
                    conn.disconect();
                    (new Mensagem(this, null, SUCCESS, CADASTRO)).setEnabled(true);
                }catch(SQLException e){
                    String sujeito = "Patrocinador";
                    switch(e.getErrorCode()){
                        case -1 : // Chave duplicada
                        {
                            (new Mensagem(this, sujeito+" já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
                            break;
                        }
                        case 1 : // Violacao de constraint UNIQUE
                        {
                            (new Mensagem(this, sujeito+" já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
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
        } else { // É Atualizacao!
            
        }
        
    }//GEN-LAST:event_cadastrarButtonActionPerformed

    private void tfCNPJActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tfCNPJActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tfCNPJActionPerformed

    private void tfRazaoSocialActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tfRazaoSocialActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tfRazaoSocialActionPerformed

    private void tfTelefoneActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tfTelefoneActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tfTelefoneActionPerformed

    private void tfEnderecoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tfEnderecoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tfEnderecoActionPerformed

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        // TODO add your handling code here:
        super.onClose();
    }//GEN-LAST:event_formWindowClosing

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cadastrarButton;
    private javax.swing.JButton cancelarButton;
    private javax.swing.JLabel infoLabel;
    private javax.swing.JFormattedTextField jFormattedTextField1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel lCNPJ;
    private javax.swing.JTextField tfCNPJ;
    private javax.swing.JTextField tfEndereco;
    private javax.swing.JTextField tfRazaoSocial;
    private javax.swing.JTextField tfTelefone;
    // End of variables declaration//GEN-END:variables
}
