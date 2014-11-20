/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import interfaces.tables.*;
import javax.swing.JFrame;

/**
 *
 * @author vanessalima
 */
public class LoadFrame extends AbstractJFrame {

    private int table;
    private AbstractJFrame form;
    
    /**
     * Creates new form LoadFrame
     */
    public LoadFrame(JFrame ant, int table) {
        super(ant);
        this.table = table;
        
        // select form class
        this.selectJFrame();
        
        initComponents();
        this.setVisible(true);
    }

    private void selectJFrame() {
        switch(this.table) {
            case Config.APRESENTACAO:
                this.form = new Apresentacao(this);
                break;
            case Config.ARTIGO:
                this.form = new Artigo(this);
                break;
            case Config.AUXILIO:
                this.form = new Auxilio(this);
                break;
            case Config.AVALIA_APRESENTADOR:
                this.form = new AvaliaApresentador(this);
                break;
            case Config.AVALIA_ARTIGO:
                this.form = new AvaliaArtigo(this);
                break;
            case Config.DESPESA:
                this.form = new Despesa(this);
                break;
            case Config.EDICAO:
                this.form = new Edicao(this);
                break;
            case Config.EVENTO:
                this.form = new Evento(this);
                break;
            case Config.INSCRITO:
                this.form = new Inscrito(this);
                break;
            case Config.ORGANIZADOR:
                this.form = new Organizador(this);
                break;
            case Config.PATROCINADOR:
                this.form = new Patrocinador(this);
                break;
            case Config.PATROCINIO:
                this.form = new Patrocinio(this);
                break;
            case Config.PESSOA:
                this.form = new Pessoa(this);
                break;
            default:
                System.out.println("ERROR!!!");
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

        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        jMenuItem5 = new javax.swing.JMenuItem();
        jMenuItem1 = new javax.swing.JMenuItem();
        jSeparator1 = new javax.swing.JPopupMenu.Separator();
        jMenuItem6 = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem7 = new javax.swing.JMenuItem();
        jScrollPane1 = new javax.swing.JScrollPane();
        tableAll = new javax.swing.JTable();
        removerButton = new javax.swing.JButton();
        addButton = new javax.swing.JButton();
        tableFields = new javax.swing.JComboBox();
        numberFiltro = new javax.swing.JComboBox();
        textfiltro = new javax.swing.JTextField();
        addFiltro = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        tableFiltros = new javax.swing.JTable();
        removerTodos = new javax.swing.JButton();
        removerFiltro = new javax.swing.JButton();
        selectFiltros = new javax.swing.JButton();
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

        jMenu1.setText("Opções");

        jMenuItem2.setText("Cadastrar");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem2);

        jMenuItem3.setText("Pesquisar");
        jMenu1.add(jMenuItem3);

        jMenuItem4.setText("Atualizar");
        jMenu1.add(jMenuItem4);

        jMenuItem5.setText("Remover");
        jMenu1.add(jMenuItem5);

        jMenuItem1.setText("Gerar Relatórios");
        jMenu1.add(jMenuItem1);
        jMenu1.add(jSeparator1);

        jMenuItem6.setText("Sair");
        jMenuItem6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem6ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem6);

        jMenuBar1.add(jMenu1);

        jMenu2.setText("Sobre");

        jMenuItem7.setText("Equipe");
        jMenu2.add(jMenuItem7);

        jMenuBar1.add(jMenu2);

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        tableAll.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(tableAll);

        removerButton.setText("Remover");
        removerButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                removerButtonActionPerformed(evt);
            }
        });

        addButton.setText("Adicionar");
        addButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addButtonActionPerformed(evt);
            }
        });

        tableFields.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        numberFiltro.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        addFiltro.setText("Novo Filtro");
        addFiltro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addFiltroActionPerformed(evt);
            }
        });

        tableFiltros.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane2.setViewportView(tableFiltros);

        removerTodos.setText("Remover Todos");
        removerTodos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                removerTodosActionPerformed(evt);
            }
        });

        removerFiltro.setText("Remover Seleção");
        removerFiltro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                removerFiltroActionPerformed(evt);
            }
        });

        selectFiltros.setText("Consultar");
        selectFiltros.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                selectFiltrosActionPerformed(evt);
            }
        });

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

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2)
                    .addComponent(jScrollPane1)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(tableFields, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(numberFiltro, javax.swing.GroupLayout.PREFERRED_SIZE, 104, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(textfiltro, javax.swing.GroupLayout.PREFERRED_SIZE, 290, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(addFiltro, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(removerButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(addButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(selectFiltros, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(removerTodos, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(removerFiltro, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 244, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(removerButton)
                    .addComponent(addButton))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(tableFields, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(numberFiltro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(textfiltro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(addFiltro))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 171, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(removerTodos)
                    .addComponent(removerFiltro)
                    .addComponent(selectFiltros))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem6ActionPerformed
        // TODO add your handling code here:
        //this.dispose();
    }//GEN-LAST:event_jMenuItem6ActionPerformed

    private void jMenuItem8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem8ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jMenuItem8ActionPerformed

    private void sairAppActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sairAppActionPerformed
        this.onDispose();
    }//GEN-LAST:event_sairAppActionPerformed

    private void removerButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_removerButtonActionPerformed
        
    }//GEN-LAST:event_removerButtonActionPerformed

    private void addButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addButtonActionPerformed
        this.form.teste();
        this.form.setVisible(true);
        
        // Close the screen before
        //this.setEnabled(false);
        //this.setVisible(false);
    }//GEN-LAST:event_addButtonActionPerformed

    private void addFiltroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addFiltroActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_addFiltroActionPerformed

    private void removerTodosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_removerTodosActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_removerTodosActionPerformed

    private void removerFiltroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_removerFiltroActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_removerFiltroActionPerformed

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        this.onClose(evt);
    }//GEN-LAST:event_formWindowClosing

    private void selectFiltrosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_selectFiltrosActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_selectFiltrosActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton addButton;
    private javax.swing.JButton addFiltro;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem10;
    private javax.swing.JMenuItem jMenuItem11;
    private javax.swing.JMenuItem jMenuItem12;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JMenuItem jMenuItem7;
    private javax.swing.JMenuItem jMenuItem8;
    private javax.swing.JMenuItem jMenuItem9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JPopupMenu.Separator jSeparator1;
    private javax.swing.JPopupMenu.Separator jSeparator2;
    private javax.swing.JComboBox numberFiltro;
    private javax.swing.JMenuItem openEquipe;
    private javax.swing.JButton removerButton;
    private javax.swing.JButton removerFiltro;
    private javax.swing.JButton removerTodos;
    private javax.swing.JMenuItem sairApp;
    private javax.swing.JButton selectFiltros;
    private javax.swing.JTable tableAll;
    private javax.swing.JComboBox tableFields;
    private javax.swing.JTable tableFiltros;
    private javax.swing.JTextField textfiltro;
    // End of variables declaration//GEN-END:variables
}
