/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

/**
 *
 * @author vanessalima
 */

public class StartFrame extends javax.swing.JFrame {

    /**
     * Creates new form StartFrame
     */
    public StartFrame() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        openEvento = new javax.swing.JButton();
        openEdicao = new javax.swing.JButton();
        openInscrito = new javax.swing.JButton();
        openPatrocinador = new javax.swing.JButton();
        openArtigo = new javax.swing.JButton();
        openPatrocinio = new javax.swing.JButton();
        openOrganizador = new javax.swing.JButton();
        openAuxilio = new javax.swing.JButton();
        openDespesa = new javax.swing.JButton();
        openApresentacao = new javax.swing.JButton();
        openAvaliaArtigo = new javax.swing.JButton();
        openAvaliaApresentador = new javax.swing.JButton();
        openPessoa = new javax.swing.JButton();
        openRelatorios = new javax.swing.JButton();
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
        openEquipe = new javax.swing.JMenuItem();

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        openEvento.setText("Eventos");
        openEvento.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openEventoActionPerformed(evt);
            }
        });

        openEdicao.setText("Edições");
        openEdicao.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openEdicaoActionPerformed(evt);
            }
        });

        openInscrito.setText("Inscritos");
        openInscrito.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openInscritoActionPerformed(evt);
            }
        });

        openPatrocinador.setText("Patrocinador");
        openPatrocinador.setPreferredSize(new java.awt.Dimension(190, 30));
        openPatrocinador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openPatrocinadorActionPerformed(evt);
            }
        });

        openArtigo.setText("Artigos");
        openArtigo.setPreferredSize(new java.awt.Dimension(190, 30));
        openArtigo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openArtigoActionPerformed(evt);
            }
        });

        openPatrocinio.setText("Patrocínios");
        openPatrocinio.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        openPatrocinio.setMaximumSize(new java.awt.Dimension(190, 30));
        openPatrocinio.setMinimumSize(new java.awt.Dimension(190, 30));
        openPatrocinio.setPreferredSize(new java.awt.Dimension(190, 30));
        openPatrocinio.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openPatrocinioActionPerformed(evt);
            }
        });

        openOrganizador.setText("Organizador");
        openOrganizador.setPreferredSize(new java.awt.Dimension(190, 30));
        openOrganizador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openOrganizadorActionPerformed(evt);
            }
        });

        openAuxilio.setText("Auxílios");
        openAuxilio.setPreferredSize(new java.awt.Dimension(190, 30));
        openAuxilio.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openAuxilioActionPerformed(evt);
            }
        });

        openDespesa.setText("Despesas");
        openDespesa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openDespesaActionPerformed(evt);
            }
        });

        openApresentacao.setText("Apresentação");
        openApresentacao.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openApresentacaoActionPerformed(evt);
            }
        });

        openAvaliaArtigo.setText("Avaliação Artigo");
        openAvaliaArtigo.setPreferredSize(new java.awt.Dimension(190, 30));
        openAvaliaArtigo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openAvaliaArtigoActionPerformed(evt);
            }
        });

        openAvaliaApresentador.setText("Avaliação Apresentador");
        openAvaliaApresentador.setPreferredSize(new java.awt.Dimension(190, 30));
        openAvaliaApresentador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openAvaliaApresentadorActionPerformed(evt);
            }
        });

        openPessoa.setText("Pessoas");
        openPessoa.setPreferredSize(new java.awt.Dimension(190, 30));
        openPessoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openPessoaActionPerformed(evt);
            }
        });

        openRelatorios.setText("Gerar Relatórios");
        openRelatorios.setPreferredSize(new java.awt.Dimension(190, 30));
        openRelatorios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openRelatoriosActionPerformed(evt);
            }
        });

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

        openEquipe.setText("Equipe");
        openEquipe.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openEquipeActionPerformed(evt);
            }
        });
        jMenu2.add(openEquipe);

        jMenuBar1.add(jMenu2);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(openInscrito, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(openEdicao, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(openEvento, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(openPatrocinador, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(openPessoa, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(25, 25, 25)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(openArtigo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(openPatrocinio, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(openOrganizador, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(openAuxilio, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(25, 25, 25)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(openDespesa, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(openApresentacao, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(openAvaliaArtigo, javax.swing.GroupLayout.DEFAULT_SIZE, 192, Short.MAX_VALUE)
                            .addComponent(openAvaliaApresentador, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addComponent(openRelatorios, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(25, 25, 25))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(openEvento, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openPatrocinio, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openDespesa, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(openEdicao, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openArtigo, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openApresentacao, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(openInscrito, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openOrganizador, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openAvaliaArtigo, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(openPatrocinador, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openAuxilio, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openAvaliaApresentador, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(openPessoa, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(openRelatorios, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(34, Short.MAX_VALUE))
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

    private void openInscritoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openInscritoActionPerformed
        (new LoadFrame(this, Config.INSCRITO)).setEnabled(true);
    }//GEN-LAST:event_openInscritoActionPerformed

    private void openPatrocinadorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openPatrocinadorActionPerformed
        (new LoadFrame(this, Config.PATROCINADOR)).setEnabled(true);
    }//GEN-LAST:event_openPatrocinadorActionPerformed

    private void openArtigoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openArtigoActionPerformed
        (new LoadFrame(this, Config.ARTIGO)).setEnabled(true);
    }//GEN-LAST:event_openArtigoActionPerformed

    private void openPatrocinioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openPatrocinioActionPerformed
        (new LoadFrame(this, Config.PATROCINIO)).setEnabled(true);
    }//GEN-LAST:event_openPatrocinioActionPerformed

    private void openOrganizadorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openOrganizadorActionPerformed
        (new LoadFrame(this, Config.ORGANIZADOR)).setEnabled(true);
    }//GEN-LAST:event_openOrganizadorActionPerformed

    private void openAuxilioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openAuxilioActionPerformed
        (new LoadFrame(this, Config.AUXILIO)).setEnabled(true);
    }//GEN-LAST:event_openAuxilioActionPerformed

    private void openDespesaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openDespesaActionPerformed
        (new LoadFrame(this, Config.DESPESA)).setEnabled(true);
    }//GEN-LAST:event_openDespesaActionPerformed

    private void openApresentacaoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openApresentacaoActionPerformed
        (new LoadFrame(this, Config.APRESENTACAO)).setEnabled(true);
    }//GEN-LAST:event_openApresentacaoActionPerformed

    private void openAvaliaArtigoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openAvaliaArtigoActionPerformed
        (new LoadFrame(this, Config.AVALIA_ARTIGO)).setEnabled(true);
    }//GEN-LAST:event_openAvaliaArtigoActionPerformed

    private void openAvaliaApresentadorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openAvaliaApresentadorActionPerformed
        (new LoadFrame(this, Config.AVALIA_APRESENTADOR)).setEnabled(true);
    }//GEN-LAST:event_openAvaliaApresentadorActionPerformed

    private void openEdicaoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openEdicaoActionPerformed
        (new LoadFrame(this, Config.EDICAO)).setEnabled(true);
    }//GEN-LAST:event_openEdicaoActionPerformed

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        // TODO add your handling code here:
        //this.dispose();
    }//GEN-LAST:event_formWindowClosing

    private void openEventoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openEventoActionPerformed
        (new LoadFrame(this, Config.EVENTO)).setEnabled(true);
    }//GEN-LAST:event_openEventoActionPerformed

    private void openPessoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openPessoaActionPerformed
        (new LoadFrame(this, Config.PESSOA)).setEnabled(true);
    }//GEN-LAST:event_openPessoaActionPerformed

    private void openRelatoriosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openRelatoriosActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_openRelatoriosActionPerformed

    private void openEquipeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openEquipeActionPerformed
        (new Equipe(this)).setEnabled(true);
    }//GEN-LAST:event_openEquipeActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(StartFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(StartFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(StartFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(StartFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new StartFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JPopupMenu.Separator jSeparator1;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JButton openApresentacao;
    private javax.swing.JButton openArtigo;
    private javax.swing.JButton openAuxilio;
    private javax.swing.JButton openAvaliaApresentador;
    private javax.swing.JButton openAvaliaArtigo;
    private javax.swing.JButton openDespesa;
    private javax.swing.JButton openEdicao;
    private javax.swing.JMenuItem openEquipe;
    private javax.swing.JButton openEvento;
    private javax.swing.JButton openInscrito;
    private javax.swing.JButton openOrganizador;
    private javax.swing.JButton openPatrocinador;
    private javax.swing.JButton openPatrocinio;
    private javax.swing.JButton openPessoa;
    private javax.swing.JButton openRelatorios;
    // End of variables declaration//GEN-END:variables
}
