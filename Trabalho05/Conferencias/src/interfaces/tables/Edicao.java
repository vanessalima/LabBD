/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces.tables;

import conferencias.DBconnection;
import entidades.EEdicao;
import interfaces.AbstractJFrame;
import interfaces.Mensagem;
import static interfaces.Config.CADASTRO;
import static interfaces.Config.FAIL;
import static interfaces.Config.SUCCESS;
import interfaces.LoadFrame;
import java.awt.Color;
import java.awt.event.WindowEvent;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;

/**
 *
 * @author ch
 */
public class Edicao extends AbstractJFrame {

    Hashtable<String, Integer> listaEventos;
    EEdicao e;
    /**
     * Creates new form CadastrarEdicao
     */
    public Edicao(JFrame frame) {
        super(frame);
        initComponents();  
        this.setTitle("Cadastro de Edição");
        this.cadastrarButton.setText("Cadastrar");
        this.listaEventos = new Hashtable<>();
        this.cbEventos.addItem("-");
        //Requisita os Eventos cadastrados no bco e os insere no combobox e popula listaventos
        this.getEventos();
    }

    public Edicao(JFrame frame, Object obj) {
        super(frame);
        initComponents();
        this.setTitle("Atualização de Edição");
        this.cadastrarButton.setText("Atualizar");
        this.infoLabel.setText("*Campos que não podem ser alterados");
        this.cbEventos.setEditable(false);
        this.tfNumEd.setEditable(false);
        if(obj instanceof EEdicao){
            this.e = (EEdicao) obj;
            
            // TODO: 
            // Popula views:
            this.cbEventos.removeAllItems();
            this.cbEventos.addItem(e.getEvento());
            this.tfNumEd.setText(e.getNumEd());
            this.tfLocal.setText(e.getLocal());
            this.tfTaxa.setText(e.getTaxa());
            this.tfDataInicio.setText(e.getDataInicio());
            this.tfDataFim.setText(e.getDataFim());
            this.taDescricao.setText(e.getDescricao());
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

        jButton1 = new javax.swing.JButton();
        lSelEv = new javax.swing.JLabel();
        cbEventos = new javax.swing.JComboBox();
        tfDataInicio = new javax.swing.JFormattedTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        tfDataFim = new javax.swing.JFormattedTextField();
        jLabel5 = new javax.swing.JLabel();
        lNumEd = new javax.swing.JLabel();
        infoLabel = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        tfLocal = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        tfNumEd = new javax.swing.JFormattedTextField();
        jLabel9 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        taDescricao = new javax.swing.JTextArea();
        cancelarButton = new javax.swing.JButton();
        cadastrarButton = new javax.swing.JButton();
        tfTaxa = new javax.swing.JTextField();

        jButton1.setText("jButton1");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Cadastro de edição");
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        lSelEv.setText("Selecione um evento*");

        try {
            tfDataInicio.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.MaskFormatter("##/##/####")));
        } catch (java.text.ParseException ex) {
            ex.printStackTrace();
        }

        jLabel2.setFont(new java.awt.Font("Ubuntu", 2, 14)); // NOI18N
        jLabel2.setText("formato: MM/DD/YYYY");

        jLabel3.setText("Data início");

        jLabel4.setText("Data fim");

        try {
            tfDataFim.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.MaskFormatter("##/##/####")));
        } catch (java.text.ParseException ex) {
            ex.printStackTrace();
        }

        jLabel5.setFont(new java.awt.Font("Ubuntu", 2, 14)); // NOI18N
        jLabel5.setText("formato: MM/DD/YYYY");

        lNumEd.setText("Número da edição*");

        infoLabel.setFont(new java.awt.Font("Ubuntu", 2, 15)); // NOI18N
        infoLabel.setText("* Campos obrigatórios");

        jLabel7.setText("Local");

        jLabel8.setText("Taxa da edição");

        tfNumEd.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("######"))));

        jLabel9.setText("Descrição");

        taDescricao.setColumns(20);
        taDescricao.setRows(5);
        jScrollPane1.setViewportView(taDescricao);

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
            .add(layout.createSequentialGroup()
                .addContainerGap(20, Short.MAX_VALUE)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(layout.createSequentialGroup()
                        .add(infoLabel)
                        .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .add(layout.createSequentialGroup()
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                                    .add(lSelEv, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 164, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                    .add(lNumEd)
                                    .add(jLabel8)
                                    .add(jLabel7))
                                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED))
                            .add(layout.createSequentialGroup()
                                .add(jLabel9)
                                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                                .add(layout.createSequentialGroup()
                                    .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 440, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                    .add(18, 18, 18)
                                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                                        .add(layout.createSequentialGroup()
                                            .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                                                .add(layout.createSequentialGroup()
                                                    .add(87, 87, 87)
                                                    .add(tfDataFim, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 108, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                                                .add(jLabel4))
                                            .add(29, 29, 29)
                                            .add(jLabel5, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 155, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                                        .add(layout.createSequentialGroup()
                                            .add(jLabel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 75, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                            .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                            .add(tfDataInicio, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 108, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                            .add(29, 29, 29)
                                            .add(jLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 155, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))))
                                .add(cbEventos, 0, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .add(tfLocal)
                                .add(tfNumEd, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 106, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                                    .add(cancelarButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 130, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                    .add(18, 18, 18)
                                    .add(cadastrarButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 130, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                            .add(tfTaxa, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 106, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                        .add(20, 20, 20))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(lSelEv)
                    .add(cbEventos, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(lNumEd)
                    .add(tfNumEd, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel7)
                    .add(tfLocal, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(layout.createSequentialGroup()
                        .add(18, 18, 18)
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                            .add(jLabel8)
                            .add(tfTaxa, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                        .add(18, 18, 18)
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                                .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                                        .add(tfDataInicio, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                        .add(jLabel2)
                                        .add(jLabel3))
                                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                                        .add(jLabel4)
                                        .add(tfDataFim, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                        .add(jLabel5)))
                                .add(org.jdesktop.layout.GroupLayout.TRAILING, jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 72, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                            .add(jLabel9))
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 49, Short.MAX_VALUE)
                        .add(infoLabel))
                    .add(layout.createSequentialGroup()
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                            .add(cancelarButton)
                            .add(cadastrarButton))))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        this.onClose(evt);
    }//GEN-LAST:event_formWindowClosing

    private void cancelarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarButtonActionPerformed
        super.onClose();
    }//GEN-LAST:event_cancelarButtonActionPerformed

    private void cadastrarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cadastrarButtonActionPerformed
        DBconnection conn;
        String sql;
        if(this.cadastrarButton.getText().matches("Cadastrar")){
            System.out.println(" NUMED: "+tfNumEd.getText());
            if(cbEventos.getSelectedItem().toString().matches("-") || tfNumEd.getText().replace(" ", "").isEmpty()){
                infoLabel.setForeground(Color.red);
                lSelEv.setForeground(Color.red);
                lNumEd.setForeground(Color.red);
            } else {
                // Tratamento de datas:
                String sqlDataInicio;
                String sqlDataFim;
                if (tfDataInicio.getText().matches("  /  /    ")){
                    sqlDataInicio = null;
                } else {
                    sqlDataInicio = "to_date('"+tfDataInicio.getText()+"', 'DD/MM/YYYY')";
                }

                if (tfDataFim.getText().matches("  /  /    ")){
                    sqlDataFim = null;
                } else {
                    sqlDataFim = "to_date('"+tfDataFim.getText()+"', 'DD/MM/YYYY')";
                }
                // Tratamento qdo nao há taxa informada
                String taxaEv; 
                if(tfTaxa.getText().isEmpty()){
                    taxaEv = null;
                } else {
                    taxaEv = tfTaxa.getText();
                }
                try{
                    conn = new DBconnection();
                    //TODO: testar:
                    sql = "INSERT INTO edicao(codEv, numEd, dataInicioEd, dataFimEd, localEd, taxaEd, descricaoEd) VALUES ("+
                            this.listaEventos.get(cbEventos.getSelectedItem().toString())+", "+
                            tfNumEd.getText()+","+sqlDataInicio+", "+sqlDataFim+", '"+tfLocal.getText()+"', "+
                            taxaEv+", '"+taDescricao.getText()+"')";
                    conn.execute(sql);
                    conn.disconect();
                    (new Mensagem(this, null, SUCCESS, CADASTRO)).setEnabled(true);
                }catch(SQLException e){
                    switch(e.getErrorCode()){
                        case -1 : // Chave duplicada
                        {                              
                            (new Mensagem(this, "Evento já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
                            break; 
                        }
                        case 1 : // Violacao de constraint UNIQUE
                        {                              
                            (new Mensagem(this, "Evento já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
                            break;
                        }
                        case 911: // Erro de sintaxe! q feio ...
                        {
                            System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                            break;
                        }
                        case 936: // Falta parâmetro obrigatório no sql enviado ao servidor
                        {
                            System.out.println("Falta parâmetro obrigatório no sql enviado ao servidor!");
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
        } else { // Atualizacao
            try{
                conn = new DBconnection();
                //TODO: testar:
                String sqlDataInicio;
                String sqlDataFim;
                String sqlTaxa;
                if (tfDataInicio.getText().matches("  /  /    ")){
                    sqlDataInicio = null;
                } else {
                    sqlDataInicio = "to_date('"+tfDataInicio.getText()+"', 'DD/MM/YYYY')";
                }

                if (tfDataFim.getText().matches("  /  /    ")){
                    sqlDataFim = null;
                } else {
                    sqlDataFim = "to_date('"+tfDataFim.getText()+"', 'DD/MM/YYYY')";
                }
                String taxaEv; 
                if(tfTaxa.getText().isEmpty()){
                    taxaEv = null;
                } else {
                    taxaEv = tfTaxa.getText();
                }
                sql = "UPDATE EDICAO SET descricaoEd = '"+taDescricao.getText().trim()+"', taxaEd = "+
                        taxaEv+", localEd = '"+tfLocal.getText()+"', dataFimEd = "+
                        sqlDataFim+", dataInicioEd = "+sqlDataInicio+
                        " WHERE codEv = "+this.e.getCodEv()+" AND numEd = "+this.e.getNumEd();
//                sql = "UPDATE EDICAO SET LOCALED = '', TAXAED = 122, DATAINICIOED = null, DESCRICAOED = '', DATAFIMED = null WHERE CODEV = 23 AND NUMED = 1";
                System.out.println("SQL: "+sql);
                conn.executeCommand(sql);
                conn.disconect();
                (new Mensagem(this.anterior, null, SUCCESS, ATUALIZACAO)).setEnabled(true);
            }catch(SQLException e){
                switch(e.getErrorCode()){
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
    }//GEN-LAST:event_cadastrarButtonActionPerformed

    /**
     * @param args the command line arguments
     */
//    public static void main(String args[]) {
//        /* Set the Nimbus look and feel */
//        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
//        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
//         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
//         *
//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(CadastrarEdicao.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(CadastrarEdicao.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(CadastrarEdicao.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(CadastrarEdicao.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//        //</editor-fold>
//
//        /* Create and display the form */
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            public void run() {
//                new CadastrarEdicao().setVisible(true);
//                
//            }
//        });
//    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cadastrarButton;
    private javax.swing.JButton cancelarButton;
    private javax.swing.JComboBox cbEventos;
    private javax.swing.JLabel infoLabel;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lNumEd;
    private javax.swing.JLabel lSelEv;
    private javax.swing.JTextArea taDescricao;
    private javax.swing.JFormattedTextField tfDataFim;
    private javax.swing.JFormattedTextField tfDataInicio;
    private javax.swing.JTextField tfLocal;
    private javax.swing.JFormattedTextField tfNumEd;
    private javax.swing.JTextField tfTaxa;
    // End of variables declaration//GEN-END:variables

    
    private void getEventos() {
        try{
            DBconnection conn = new DBconnection();
            String sql = "SELECT codEv, nomeEv from evento";
            ResultSet rs = conn.query(sql);
            String nome = "";
            while(rs != null && rs.next()){
                nome = rs.getString("nomeEv");
                cbEventos.addItem(nome);
                this.listaEventos.put(nome, rs.getInt("codEv"));
            }
            conn.disconect();
        }catch(SQLException e){
            switch(e.getErrorCode()){
                case 100: // Data not found
                {
                    System.out.println("DATA_NOT_FOUND");
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
