/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import conferencias.DBconnection;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;

/**
 *
 * @author Rina
 */
public class Relatorios extends AbstractJFrame {

    /**
     * Creates new form Relatorios
     */
    ArrayList<String> header = new ArrayList<>();
    Object[][] tableRows;
    
    public Relatorios(JFrame ant) {
        super(ant);
        getHeaders(); 
        this.tableRows = getContent(); 
        for( int i = 0; i < this.header.size(); i++ ){
            System.out.println(this.header.get(i));
        }
        for( int i = 0; i < this.header.size(); i++ ){
            for (int j = 0; j < tableRows[i].length; j++)
                System.out.println(this.tableRows[i][j]);
        }
        initComponents();
        
    }
    
    private void getHeaders(){
        this.header.add("Nome Evento");
        this.header.add("Numero da Edicao");
        this.header.add("Patrocinador");
        this.header.add("Valor do Patrocinio");
    }
    
    private Object[][] getContent(){
        ArrayList<ArrayList<String>> content = new ArrayList<ArrayList<String>>();
        DBconnection conn = new DBconnection();
        String sql = "SELECT  E.NOMEEV as \"Nome Evento\", Pat.NUMED as \"Numero da Edicao\", P.RAZAOSOCIALPAT as \"Patrocinador\", to_char( sum(Pat.VALORPAT), '$999,999.00') as \"Valor do Patrocinio\"\n" +
                        "FROM Patrocinador P, Patrocinio Pat, Evento E\n" +
                        "WHERE P.CNPJPAT = Pat.CNPJPAT\n" +
                        "  AND E.CODEV = Pat.CODEV\n" +
                        "GROUP BY CUBE (E.NOMEEV,Pat.NUMED, P.RAZAOSOCIALPAT)";
        ResultSet res;
        int k = 0;
        
        try {
            res = conn.query(sql);
            while(res.next()) {
                    content.add(new ArrayList<String>() {});
                    for (int j = 0; j < header.size(); j++){
                        System.out.println(header.get(j));
                        System.out.println(res.getString(header.get(j)));
                        content.get(k).add(res.getString(header.get(j)));
                    }
                    k++;
                }
            
                Object[][] b = new Object[content.size()][header.size()];
                for(int i = 0; i < content.size(); i++){
                        b[i] = content.get(i).toArray();
                }
                
                 conn.disconect();
                 
                 return b;
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
        return null;
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
        gerar = new javax.swing.JButton();
        cancelar = new javax.swing.JButton();
        exportar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jMenuBar2 = new javax.swing.JMenuBar();
        jMenu3 = new javax.swing.JMenu();
        jMenuItem8 = new javax.swing.JMenuItem();
        jMenuItem9 = new javax.swing.JMenuItem();
        jMenuItem10 = new javax.swing.JMenuItem();
        jMenuItem11 = new javax.swing.JMenuItem();
        jMenuItem12 = new javax.swing.JMenuItem();
        jSeparator2 = new javax.swing.JPopupMenu.Separator();
        sairApp = new javax.swing.JMenuItem();
        jMenu4 = new javax.swing.JMenu();
        openEquipe = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Relatório de Patrocínios");

        gerar.setText("Gerar");
        gerar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                gerarActionPerformed(evt);
            }
        });

        cancelar.setText("Cancelar");
        cancelar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                cancelarMouseClicked(evt);
            }
        });

        exportar.setText("Exportar");

        jTable1.setModel(new myTableModel(
            this.tableRows,
            this.header.toArray()
        ));
        jTable1.getTableHeader().setReorderingAllowed(false);
        jScrollPane2.setViewportView(jTable1);

        jMenu3.setText("Opções");

        jMenuItem8.setText("Cadastrar");
        jMenuItem8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem8ActionPerformed(evt);
            }
        });
        jMenu3.add(jMenuItem8);

        jMenuItem9.setText("Pesquisar");
        jMenu3.add(jMenuItem9);

        jMenuItem10.setText("Atualizar");
        jMenu3.add(jMenuItem10);

        jMenuItem11.setText("Remover");
        jMenu3.add(jMenuItem11);

        jMenuItem12.setText("Gerar Relatórios");
        jMenu3.add(jMenuItem12);
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
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(layout.createSequentialGroup()
                        .add(188, 328, Short.MAX_VALUE)
                        .add(gerar)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(exportar)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(cancelar))
                    .add(layout.createSequentialGroup()
                        .addContainerGap()
                        .add(jScrollPane2)))
                .addContainerGap())
            .add(layout.createSequentialGroup()
                .add(233, 233, 233)
                .add(jLabel1)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(12, 12, 12)
                .add(jLabel1)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jScrollPane2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 444, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(gerar)
                    .add(cancelar)
                    .add(exportar))
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jMenuItem8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem8ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jMenuItem8ActionPerformed

    private void sairAppActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sairAppActionPerformed
        super.onClose();
    }//GEN-LAST:event_sairAppActionPerformed

    private void gerarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_gerarActionPerformed
        jTable1.getTableHeader();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy-HH-mm-ss");
        Date date = new Date();
        try (FileWriter arq = new FileWriter("Relatório-"+dateFormat.format(date).toString()+".txt")) {
                arq.write("lalala");
                arq.close();
        }
        catch (IOException ex) {
            Logger.getLogger(Relatorios.class.getName()).log(Level.SEVERE, null, ex);
        }          
    }//GEN-LAST:event_gerarActionPerformed

    private void cancelarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cancelarMouseClicked
        super.onClose();
    }//GEN-LAST:event_cancelarMouseClicked

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cancelar;
    private javax.swing.JButton exportar;
    private javax.swing.JButton gerar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuItem jMenuItem10;
    private javax.swing.JMenuItem jMenuItem11;
    private javax.swing.JMenuItem jMenuItem12;
    private javax.swing.JMenuItem jMenuItem8;
    private javax.swing.JMenuItem jMenuItem9;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JPopupMenu.Separator jSeparator2;
    private javax.swing.JTable jTable1;
    private javax.swing.JMenuItem openEquipe;
    private javax.swing.JMenuItem sairApp;
    // End of variables declaration//GEN-END:variables
}