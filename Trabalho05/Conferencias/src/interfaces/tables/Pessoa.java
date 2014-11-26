/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces.tables;

import conferencias.DBconnection;
import entidades.EPessoa;
import interfaces.AbstractJFrame;
import static interfaces.Config.ATUALIZACAO;
import static interfaces.Config.SUCCESS;
import interfaces.Mensagem;
import java.awt.Color;
import java.sql.SQLException;
import javax.swing.JFrame;

/**
 *
 * @author Rina
 */

public class Pessoa extends AbstractJFrame {
    
    private EPessoa p;
    
    // Construtor para Cadastro
    public Pessoa(JFrame ant) { 
        super(ant);
        initComponents();
        this.setTitle("Cadastro de Pessoa");
        this.cadastrarButton.setText("Cadastrar");
    }
    
    // Construtor para atualizacao
    public Pessoa(JFrame ant, Object obj){
        super(ant);
        initComponents();
        this.setTitle("Atualização de Pessoa");
        this.cadastrarButton.setText("Atualizar");
        tfEmail.setEditable(false);
//        tfInstituicao.setEditable(false);
//        tfNome.setEditable(false);
        if(obj instanceof EPessoa){
            this.p = (EPessoa)obj;
            tfEmail.setText(p.getEmail());
            tfEndereco.setText(p.getEndereco());
            tfInstituicao.setText(p.getInstituicao());
            tfNome.setText(p.getNome());
            tfTelefone.setText(p.getTelefone());
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

        jLabel4 = new javax.swing.JLabel();
        lNome = new javax.swing.JLabel();
        lEmail = new javax.swing.JLabel();
        tfNome = new javax.swing.JTextField();
        tfEmail = new javax.swing.JTextField();
        lInstituicao = new javax.swing.JLabel();
        tfInstituicao = new javax.swing.JTextField();
        lTelefone = new javax.swing.JLabel();
        tfTelefone = new javax.swing.JTextField();
        lNacionalidade = new javax.swing.JLabel();
        cbNacionalidade = new javax.swing.JComboBox();
        lEndereco = new javax.swing.JLabel();
        tfEndereco = new javax.swing.JTextField();
        cancelarButton = new javax.swing.JButton();
        cadastrarButton = new javax.swing.JButton();
        infoLabel = new javax.swing.JLabel();

        jLabel4.setText("jLabel4");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Cadastro de pessoa");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        lNome.setText("Nome*");

        lEmail.setText("Email*");

        lInstituicao.setText("Instituição*");

        lTelefone.setText("Telefone");

        lNacionalidade.setText("Nacionalidade");

        cbNacionalidade.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "  ", "Antiguano", "Afegão", "Alemão", "Americano", "Angolano", "Árabe ", "Argélia", "Argentino", "Armeno", "Australiano", "Austríaco", "Bahamense", "Bangladesh", "Barbadiano", "Bechuano", "Belga", "Belizenho", "Boliviano", "Brasileiro", "Britânico", "Camaronense", "Canadense", "Chileno", "Chinês", "Cingalês", "Colombiano", "Comorense", "Coreano", "coreano", "coreano", "Costarriquenho", "Croata", "Cubano", "Dinamarquês", "Dominicana", "Dominicano", "Egípcio", "Emiratense", "Equatoriano", "Escocês", "Eslovaco", "Esloveno", "Espanhol", "Francês", "Galês", "Ganés", "Granadino", "Grego", "Guatemalteco", "Guianense", "Guianês", "Haitiano", "Holandês", "Hondurenho", "Húngaro", "Iemenita", "Indiano", "Indonésio", "Inglês", "Iraniano", "Iraquiano", "Irlandês", "Israelita", "Italiano", "Jamaicano", "Japonês", "Líbio", "Malaio", "Marfinense", "Marroquino", "Mexicano", "Moçambicano", "Neozelandês", "Nepalês", "Nicaraguense", "Nigeriano", "Noruego", "Omanense", "Palestino", "Panamenho", "Paquistanês", "Paraguaio", "Peruano", "Polonês", "Portorriquenho", "Português", "Qatarense", "Queniano", "Romeno", "Ruandês", "Russo", "Salvadorenho", "Santa-lucense", "São-cristovense", "São-vicentino", "Saudita", "Sérvio", "Sírio", "Somali", "Sueco", "Suíço", "Sul-africano", "Surinamês", "Tailandês", "Timorense", "Trindadense", "Turco", "Ucraniano", "Ugandense", "Uruguaio", "Venezuelano", "Vietnamita", "Zimbabuense" }));
        cbNacionalidade.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbNacionalidadeActionPerformed(evt);
            }
        });

        lEndereco.setText("Endereço");

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

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(20, 20, 20)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                    .add(layout.createSequentialGroup()
                        .add(infoLabel)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .add(cancelarButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 130, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .add(18, 18, 18)
                        .add(cadastrarButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 130, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(layout.createSequentialGroup()
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(lNome)
                            .add(lEmail)
                            .add(lInstituicao)
                            .add(lTelefone)
                            .add(lEndereco))
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                            .add(tfEmail)
                            .add(tfNome)
                            .add(tfInstituicao)
                            .add(layout.createSequentialGroup()
                                .add(tfTelefone, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 169, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                .add(18, 18, 18)
                                .add(lNacionalidade)
                                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                .add(cbNacionalidade, 0, 171, Short.MAX_VALUE))
                            .add(tfEndereco))))
                .add(20, 20, 20))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(20, 20, 20)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(lNome)
                    .add(tfNome, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(lEmail)
                    .add(tfEmail, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(lInstituicao)
                    .add(tfInstituicao, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(lTelefone)
                    .add(tfTelefone, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(lNacionalidade)
                    .add(cbNacionalidade, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(lEndereco)
                    .add(tfEndereco, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(20, 20, 20)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(cancelarButton)
                    .add(cadastrarButton)
                    .add(infoLabel))
                .add(20, 20, 20))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        // TODO add your handling code here:
        super.onClose();
    }//GEN-LAST:event_formWindowClosing

    private void cancelarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarButtonActionPerformed
        super.onClose();
    }//GEN-LAST:event_cancelarButtonActionPerformed

    private void cadastrarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cadastrarButtonActionPerformed
        DBconnection conn;
        
        String nacionalidade=null;
        String sql;
        
        if(this.cadastrarButton.getText().matches("Cadastrar")){ // testa se é cadastro
            if(tfNome.getText().matches("") || tfEmail.getText().matches("") || tfInstituicao.getText().matches("")){
                infoLabel.setForeground(Color.red);
                lNome.setForeground(Color.red);
                lEmail.setForeground(Color.red);
                lInstituicao.setForeground(Color.red);
            } else {
                if(!cbNacionalidade.getSelectedItem().toString().matches("\\s+")){
                    nacionalidade = "'"+cbNacionalidade.getSelectedItem().toString()+"'";
                    System.out.println(" >> Nacionalidade = "+nacionalidade);
                }
                try{
                    conn = new DBconnection();
                    //TODO: testar:
                    sql = "INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE) values (SEQ_IDPE_PESSOA.NEXTVAL,'"+
                            tfNome.getText()+"', '"+tfEmail.getText()+"', '"+tfInstituicao.getText()+"', '"+tfTelefone.getText()+"', "+nacionalidade+", '"+tfEndereco.getText()+"')";
                    System.out.println("sql: "+sql);
                    conn.execute(sql);
                    conn.disconect();
                    (new Mensagem(this, null, SUCCESS, CADASTRO)).setEnabled(true);
                }catch(SQLException e){
                    String sujeito = "Email"; // TODO Trocar pelo nome da tabela ou o q for mais adequado
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
                        case 936: // Falta parâmetro obrigatório no sql enviado ao servidor
                        {
                            System.out.println("Falta parâmetro/atributo obrigatório no sql enviado ao servidor!");
                            break;
                        }
                        case 1756: // Falta parâmetro obrigatório no sql enviado ao servidor
                        {
                            System.out.println("Falta aspas em alguma parte do sql.");
                            break;
                        }
                        default:
                        {
                            (new Mensagem(this, e.getMessage(), FAIL, CADASTRO)).setEnabled(true);
                            System.out.println("ERROR CODE: "+e.getErrorCode());
                            e.printStackTrace();
                            break;
                        }
                    }
                }
            }
        } else { // É Atualizacao!
            if(tfNome.getText().matches("") || tfEmail.getText().matches("") || tfInstituicao.getText().matches("")){
               infoLabel.setForeground(Color.red);
               lNome.setForeground(Color.red);
               lEmail.setForeground(Color.red);
               lInstituicao.setForeground(Color.red);
           }else{
                try{
                    conn = new DBconnection();
                    //TODO: testar:
                    sql = "UPDATE PESSOA SET nomePe = '"+tfNome.getText()+"', instituicaoPe = '"+
                            tfInstituicao.getText()+"', telefonePe = '"+tfTelefone.getText()+"', nacionalidadePe = '"+
                            cbNacionalidade.getSelectedItem().toString()+"', enderecoPe = '"+
                            tfEndereco.getText()+"' WHERE idPe = "+this.p.getIdPe();
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
                            (new Mensagem(this, e.getMessage(), FAIL, ATUALIZACAO)).setEnabled(true);
                            System.out.println("ERROR CODE: "+e.getErrorCode());
                            e.printStackTrace();
                            break;
                        }
                    }
                }

            }
        }
    }//GEN-LAST:event_cadastrarButtonActionPerformed

    private void cbNacionalidadeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbNacionalidadeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cbNacionalidadeActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cadastrarButton;
    private javax.swing.JButton cancelarButton;
    private javax.swing.JComboBox cbNacionalidade;
    private javax.swing.JLabel infoLabel;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel lEmail;
    private javax.swing.JLabel lEndereco;
    private javax.swing.JLabel lInstituicao;
    private javax.swing.JLabel lNacionalidade;
    private javax.swing.JLabel lNome;
    private javax.swing.JLabel lTelefone;
    private javax.swing.JTextField tfEmail;
    private javax.swing.JTextField tfEndereco;
    private javax.swing.JTextField tfInstituicao;
    private javax.swing.JTextField tfNome;
    private javax.swing.JTextField tfTelefone;
    // End of variables declaration//GEN-END:variables
}
