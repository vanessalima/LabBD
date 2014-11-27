/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces.tables;

import conferencias.DBconnection;
import entidades.EArtigo;
import interfaces.AbstractJFrame;
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
public class Artigo extends AbstractJFrame {
    private EArtigo artigo;
    HashMap<String, String> listaInscritos;
    /**
     * Creates new form Artigos
     */
    public Artigo(JFrame ant) {
        super(ant);
        initComponents();
        this.mInitialize();
        this.setTitle("Cadastro de Artigos");
        this.cadastrarButton.setText("Cadastrar");
    }
    
    public Artigo(JFrame ant, Object obj){
        super(ant);
        initComponents();
        this.setTitle("Atualização de Artigos");
        this.cadastrarButton.setText("Atualizar");
        this.infoLabel.setText("*Campos que não podem ser alterados");
        this.mInitialize();
        if (obj instanceof EArtigo){
            this.artigo = (EArtigo)obj;
            tfNomeArtigo.setText(this.artigo.getTituloArt());
            tfDataApr.setText(this.artigo.getData());
            tfHora.setText(this.artigo.getHora());
            cbApresentador.getModel().setSelectedItem(this.artigo.getNomePe());
//            cbApresentador.set
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

        lNomeArtigo = new javax.swing.JLabel();
        lDataApresentacao = new javax.swing.JLabel();
        lHoraApresentacao = new javax.swing.JLabel();
        tfNomeArtigo = new javax.swing.JTextField();
        tfDataApr = new javax.swing.JFormattedTextField();
        tfHora = new javax.swing.JFormattedTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        cancelarButton = new javax.swing.JButton();
        cadastrarButton = new javax.swing.JButton();
        lApresentador = new javax.swing.JLabel();
        cbApresentador = new javax.swing.JComboBox();
        infoLabel = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        lNomeArtigo.setText("Nome do artigo*");

        lDataApresentacao.setText("Data da apresentação");

        lHoraApresentacao.setText("Hora da apresentação");

        try {
            tfDataApr.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.MaskFormatter("##/##/####")));
        } catch (java.text.ParseException ex) {
            ex.printStackTrace();
        }

        try {
            tfHora.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.MaskFormatter("##:##")));
        } catch (java.text.ParseException ex) {
            ex.printStackTrace();
        }
        tfHora.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tfHoraActionPerformed(evt);
            }
        });

        jLabel2.setFont(new java.awt.Font("Ubuntu", 2, 14)); // NOI18N
        jLabel2.setText("formato: MM/DD/YYYY");

        jLabel3.setFont(new java.awt.Font("Ubuntu", 2, 14)); // NOI18N
        jLabel3.setText("formato: HH:mm");

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

        lApresentador.setText("Apresentador");

        infoLabel.setFont(new java.awt.Font("Ubuntu", 2, 15)); // NOI18N
        infoLabel.setText("* Campos obrigatórios");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(infoLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(cancelarButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(cadastrarButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(lHoraApresentacao)
                        .addGap(18, 18, 18)
                        .addComponent(tfHora, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 155, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 282, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lDataApresentacao)
                            .addComponent(lApresentador)
                            .addComponent(lNomeArtigo))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(tfNomeArtigo)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(tfDataApr, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 155, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addComponent(cbApresentador, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lNomeArtigo)
                    .addComponent(tfNomeArtigo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lApresentador)
                    .addComponent(cbApresentador, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lDataApresentacao)
                    .addComponent(tfDataApr, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(lHoraApresentacao)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(tfHora, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel3)))
                .addGap(37, 37, 37)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cancelarButton)
                    .addComponent(cadastrarButton)
                    .addComponent(infoLabel))
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
        if(this.cadastrarButton.getText().matches("Cadastrar")){
            if(tfNomeArtigo.getText().matches("")){
                infoLabel.setForeground(Color.red);
                lNomeArtigo.setForeground(Color.red);
            } else {
                // Tratamento de datas:
                String sqlDataApr=null;
                String sqlHora=null;
                String sqlFinal = "null, null, null";
                if (!tfDataApr.getText().matches("  /  /    ")){
                    sqlDataApr = "to_date('"+tfDataApr.getText()+"', 'DD/MM/YYYY')";
                }
                if (!tfHora.getText().matches("  :  ")){
                    //	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS')
                    sqlHora = "to_timestamp('"+tfDataApr.getText()+", "+tfHora.getText()+":00', 'DD/MM/YYYY, HH24:MI:SS')";
                }
                if(!cbApresentador.getSelectedItem().toString().matches("-")){
                    sqlFinal = this.listaInscritos.get(cbApresentador.getSelectedItem().toString());
                    System.out.println("sqlFInal: "+sqlFinal);
                }
                try{
                    conn = new DBconnection();
                    //TODO: testar:
                    sql = "INSERT INTO artigo (idArt, tituloArt, dataApresArt, horaApresArt, codEv, numEd, idApr) VALUES ("+
                    "SEQ_IDART_ARTIGO.NEXTVAL, '"+tfNomeArtigo.getText()+"', "+
                    sqlDataApr+", "+sqlHora+", "+sqlFinal+")";
                    System.out.println("SQL: "+sql);
                    conn.execute(sql);
                    conn.disconect();
                    (new Mensagem(this, this.anterior, null, SUCCESS, CADASTRO)).setEnabled(true);
                }catch(SQLException e){
                    switch(e.getErrorCode()){
                        case -1 : // Chave duplicada
                        {
                            (new Mensagem(this, this.anterior, "Evento já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
                            break;
                        }
                        case 1 : // Violacao de constraint UNIQUE
                        {
                            (new Mensagem(this, this.anterior, "Evento já cadastrado no sistema.", FAIL, CADASTRO)).setEnabled(true);
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
                            (new Mensagem(this, this.anterior, e.getMessage(), FAIL, CADASTRO)).setEnabled(true);
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
                String sqlDataApr=null;
                String sqlHora=null;
                String sqlFinal = "null, null, null";
                if (!tfDataApr.getText().matches("  /  /    ")){
                    sqlDataApr = "to_date('"+tfDataApr.getText()+"', 'DD/MM/YYYY')";
                }
                if (!tfHora.getText().matches("  :  ")){
                    //	TO_TIMESTAMP('02/09/2014, 10:30:00','DD/MM/YYYY, HH24:MI:SS')
                    sqlHora = "to_timestamp('"+tfDataApr.getText()+", "+tfHora.getText()+":00', 'DD/MM/YYYY, HH24:MI:SS')";
                }
                if(!cbApresentador.getSelectedItem().toString().matches("-")){
                    sqlFinal = this.listaInscritos.get(cbApresentador.getSelectedItem().toString());
                }

//                sql = "UPDATE ARTIGO SET descricaoEd = '"+taDescricao.getText().trim()+"', taxaEd = "+
//                taxaEv+", localEd = '"+tfLocal.getText()+"', dataFimEd = "+
//                sqlDataFim+", dataInicioEd = "+sqlDataInicio+
//                " WHERE idArt = "+this.e.getCodEv();
                //                sql = "UPDATE EDICAO SET LOCALED = '', TAXAED = 122, DATAINICIOED = null, DESCRICAOED = '', DATAFIMED = null WHERE CODEV = 23 AND NUMED = 1";
//                System.out.println("SQL: "+sql);
//                conn.executeCommand(sql);
                conn.disconect();
                (new Mensagem(this, this.anterior, null, SUCCESS, ATUALIZACAO)).setEnabled(true);
            }catch(SQLException e){
                switch(e.getErrorCode()){
                    case 911: // Erro de sintaxe! q feio ...
                    {
                        System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
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

    private void tfHoraActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tfHoraActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tfHoraActionPerformed

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        // TODO add your handling code here:
        this.onClose();
    }//GEN-LAST:event_formWindowClosing

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cadastrarButton;
    private javax.swing.JButton cancelarButton;
    private javax.swing.JComboBox cbApresentador;
    private javax.swing.JLabel infoLabel;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel lApresentador;
    private javax.swing.JLabel lDataApresentacao;
    private javax.swing.JLabel lHoraApresentacao;
    private javax.swing.JLabel lNomeArtigo;
    private javax.swing.JFormattedTextField tfDataApr;
    private javax.swing.JFormattedTextField tfHora;
    private javax.swing.JTextField tfNomeArtigo;
    // End of variables declaration//GEN-END:variables
    
    private void mInitialize() {
        if(this.cadastrarButton.getText().matches("Cadastrar")){
            cbApresentador.addItem("-");
        }
        // New nas listas
        this.listaInscritos = new HashMap<String, String>();
        
        // popula os comboboxes de Evento e Patrocinador:
        DBconnection conn = new DBconnection();
        ResultSet rs = null;
        String sql;
        String auxNome=null;
        
        
        try { 
                sql = "SELECT codEv, numEd, idPart, nomePe FROM inscrito I, pessoa P WHERE I.idPart = P.idPe and P.tipoParticipante = '1'";
                rs = conn.query(sql);
                while(rs != null && rs.next()){
                    auxNome = rs.getString("nomePe");
                    cbApresentador.addItem(auxNome);
//                    System.out.println("inseriu...");
                    this.listaInscritos.put(auxNome, new String(rs.getInt("codEv")+", "+rs.getInt("numEd")+", "+rs.getInt("idPart")));
            } 
            if (rs != null) { rs.close(); } 
            conn.disconect();
        } catch (SQLException ex) {
            Logger.getLogger(Patrocinio.class.getName()).log(Level.SEVERE, null, ex);
        }         
    }
}
