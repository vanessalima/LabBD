/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import conferencias.DBconnection;
import static interfaces.Config.CADASTRO;
import static interfaces.Config.FAIL;
import static interfaces.Config.RELATORIO;
import static interfaces.Config.SUCCESS;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;

/**
 * Interface de geração de relatórios em texto de acordo com um evento
 * e podendo ter ou não um edição determinada para o relatório
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class RelatorioPat extends AbstractJFrame {

    /**
     * Creates new form Relatorio
     */
    Hashtable<String, ArrayList> listaEventos = new Hashtable<>(); // hash contendo o par evento e suas edições
    Hashtable<String, Integer> eventoNum = new Hashtable<>(); //hash contendo o nome do evento e seu codev

    public RelatorioPat(AbstractJFrame ant) {
        super(ant);
        // Cria os comboBox da interface e popula com os eventos
        createHashEventos();
        initComponents();
        Set lista_keys = listaEventos.keySet();
        jComboBox2.removeAllItems();
        String first = lista_keys.toArray()[0].toString();
        ArrayList temp = listaEventos.get(first);
        for(int i = 0; i < temp.size(); i++){
            jComboBox2.addItem(temp.get(i));
        }
    }
    
    /**
     * Cria o par evento edição para serem selecionados pelos combo box
     */
    private void createHashEventos(){
        DBconnection dbconn = new DBconnection();
        // seleciona os pares
        String sql = "SELECT EVENTO.CODEV, NOMEEV, NUMED FROM EVENTO, EDICAO WHERE EDICAO.CODEV = EVENTO.CODEV";
        ResultSet res;
        
        try {
            res = dbconn.query(sql);
            while(res.next()) {
                // adiciona os pares em seus respectivos hashmaps
                    if(!this.listaEventos.containsKey(res.getString("NOMEEV"))){
                         this.listaEventos.put(res.getString("NOMEEV"), new ArrayList());
                         this.listaEventos.get(res.getString("NOMEEV")).add("ALL");
                    }
                    if(!this.eventoNum.containsKey(res.getString("NOMEEV"))){
                        this.eventoNum.put(res.getString("NOMEEV"), new Integer(res.getString("CODEV")));
                    }
                    this.listaEventos.get(res.getString("NOMEEV")).add(res.getString("NUMED"));
                }
            dbconn.disconect();
        }
        catch(SQLException e) {
            switch(e.getErrorCode()){
                    case 911: // Erro de sintaxe! q feio ...
                    {
                        System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                        break;
                    }
                    default:
                    {
                        System.out.println("ERROR CODE: "+e.getErrorCode());
                        break;
                    }
            }
            
        }
    }
    
    /**
     * Realiza o procedimento relatorio_evento localizado no pacote relatorio_pat
     * O resultado é gravado na tabela result_pat
     * Esse procedimento cria o relatório e salva na tabela.
     * @param codev: é o numero do evento desejado
     * @param numed: número da edição ou -1 para todas as edições
     */
    private void gerarRelatorio(Integer codev, Integer numed){
        DBconnection dbconn = new DBconnection();
        boolean flag = true;
        String sql;
        System.out.println(numed);
        if(numed == -1){ // todas as edições
           sql = "begin relatorio_pat.relatorio_evento("+ codev.toString()+ ",NULL); end;";
           System.out.println(sql);
        }
        else{ // uma edição específica
            sql = "begin relatorio_pat.relatorio_evento("+ codev.toString()+ "," + numed.toString()+"); end;";
            System.out.println(sql);
        }
        
        try {
            flag = dbconn.execute(sql);
            dbconn.disconect();
        }
        catch(SQLException e) {
            switch(e.getErrorCode()){
                    case 911: // Erro de sintaxe! q feio ...
                    {
                        System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                        break;
                    }
                    default:
                    {
                        System.out.println("ERROR CODE: "+e.getErrorCode());
                        break;
                    }
            }
            
        }
        
            // função para ler os componentes da tabela
            getTableResults();
    }
    
    /**
     * Lê a tabela gerada por gerarRelatorio() e imprime no textarea.
     */
    private void getTableResults(){
        DBconnection dbconn = new DBconnection();
        String sql = "SELECT text from result_pat ORDER BY ID";
        ResultSet res;
        // zera a textarea
        jTextArea1.setText(null); 
        try {
            res = dbconn.query(sql);
            while(res.next()) {
                // imprime na textarea as linhas da tabela contendo o output do relatorio
                System.out.println(res.getString("text"));
                jTextArea1.append(res.getString("text") + "\n");
            }
            dbconn.disconect();
            dbconn = new DBconnection();
            dbconn.execute("delete result_pat");
            dbconn.disconect();
        }
        catch(SQLException e) {
            switch(e.getErrorCode()){
                    case 911: // Erro de sintaxe! q feio ...
                    {
                        System.out.println("Erro de sintaxe do comando sql. Obs.: Talvez você tenha se esquecido de tirar o ; do final. :P ");
                        break;
                    }
                    default:
                    {
                        System.out.println("ERROR CODE: "+e.getErrorCode());
                        break;
                    }
            }
            
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

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jComboBox1 = new javax.swing.JComboBox(listaEventos.keySet().toArray());
        jComboBox2 = new javax.swing.JComboBox();
        gerar = new javax.swing.JButton();
        exportar = new javax.swing.JButton();
        cancelar = new javax.swing.JButton();
        jMenuBar2 = new javax.swing.JMenuBar();
        jMenu3 = new javax.swing.JMenu();
        jSeparator2 = new javax.swing.JPopupMenu.Separator();
        sairApp = new javax.swing.JMenuItem();
        jMenu4 = new javax.swing.JMenu();
        openEquipe = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        jLabel1.setText("Relatório de Auxílios e Despesas por Evento");

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        gerar.setText("Gerar");
        gerar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                gerarActionPerformed(evt);
            }
        });

        exportar.setText("Exportar");
        exportar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                exportarActionPerformed(evt);
            }
        });

        cancelar.setText("Cancelar");
        cancelar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                cancelarMouseClicked(evt);
            }
        });

        jMenu3.setText("Opções");
        jMenu3.add(jSeparator2);

        sairApp.setText("Sair");
        sairApp.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sairAppActionPerformed(evt);
            }
        });
        jMenu3.add(sairApp);

        jMenuBar2.add(jMenu3);

        jMenu4.setText("Sobre");

        openEquipe.setText("Equipe");
        jMenu4.add(openEquipe);

        jMenuBar2.add(jMenu4);

        setJMenuBar(jMenuBar2);

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jScrollPane1)
                    .add(layout.createSequentialGroup()
                        .add(jComboBox1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 160, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(jComboBox2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 160, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 57, Short.MAX_VALUE)
                        .add(gerar)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(exportar)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(cancelar)))
                .addContainerGap())
            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                .add(0, 0, Short.MAX_VALUE)
                .add(jLabel1)
                .add(193, 193, 193))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jLabel1)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 388, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 16, Short.MAX_VALUE)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(gerar)
                        .add(cancelar)
                        .add(exportar))
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(jComboBox1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .add(jComboBox2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * Ação executada pelo botão de gerar relatório.
     * @param evt 
     */
    private void gerarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_gerarActionPerformed
        Integer numed;
        //coleta os valores do combo box
        if(jComboBox2.getSelectedItem().toString().equals("ALL") ){
            numed = -1;
        }
        else{
            numed = new Integer(jComboBox2.getSelectedItem().toString());
        }
        gerarRelatorio(eventoNum.get(jComboBox1.getSelectedItem().toString()), numed);
    }//GEN-LAST:event_gerarActionPerformed

    private void cancelarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cancelarMouseClicked
        super.onClose();
    }//GEN-LAST:event_cancelarMouseClicked

    /**
     * jComboBox1ActionPerformed
     * Quando o valor do combobox de evento é trocado, a lista do combobox de respectivas edições
     * é trocado também.
     * @param evt 
     */
    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
        String new_key = jComboBox1.getSelectedItem().toString();
        ArrayList temp = listaEventos.get(new_key);
        jComboBox2.removeAllItems();
        for(int i = 0; i < temp.size(); i++){
            jComboBox2.addItem(temp.get(i));
        }
    }//GEN-LAST:event_jComboBox1ActionPerformed

    /**
     * Exporta o relatório em .txt
     * @param evt 
     */
    private void exportarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_exportarActionPerformed
        String relatorio = jTextArea1.getText();
        if (relatorio.length() < 1){
            // relatório nao gerado
            (new Mensagem(this, this.anterior, "Por favor pressione o botão Gerar.", FAIL, RELATORIO)).setEnabled(true);
            return;
        }
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy-HH-mm-ss");
        Date date = new Date();
        // criar o arquivo
        try (FileWriter arq = new FileWriter("RelatórioPat-"+dateFormat.format(date).toString()+".txt")) {
            arq.write(relatorio);
            arq.close();
            // sucesso
            (new Mensagem(this, this.anterior, null, SUCCESS, RELATORIO)).setEnabled(true);
        }
        catch (IOException ex) {
            // erro de arquivo
            (new Mensagem(this, this.anterior, "O arquivo não pode ser criado", FAIL, RELATORIO)).setEnabled(true);
            Logger.getLogger(SelectCubePatrocinio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_exportarActionPerformed

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        super.onClose();
    }//GEN-LAST:event_formWindowClosing

    private void sairAppActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sairAppActionPerformed
        super.onDispose();
    }//GEN-LAST:event_sairAppActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cancelar;
    private javax.swing.JButton exportar;
    private javax.swing.JButton gerar;
    private javax.swing.JComboBox jComboBox1;
    private javax.swing.JComboBox jComboBox2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JPopupMenu.Separator jSeparator2;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JMenuItem openEquipe;
    private javax.swing.JMenuItem sairApp;
    // End of variables declaration//GEN-END:variables

    private Object makeObj(JFrame ant) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
