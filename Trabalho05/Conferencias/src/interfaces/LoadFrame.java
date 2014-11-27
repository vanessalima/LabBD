/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import entidades.*;
import entidades.EPatrocinador;
import interfaces.tables.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Frame para geração de mensagens ao usuário
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class LoadFrame extends AbstractJFrame {

    private int table;
    private AbstractJFrame form;
    private Object[][] tablePopulation;
    private ArrayList<ArrayList<Object>> filters;
    
    /**
     * Cria uma interface geral para carregar os dados de qualquer
     * tabela da base de dados
     * @param ant ponteiro para a interface anterior
     * @param table número da tabela segundo o Config
     * @throws SQLException 
     */
    public LoadFrame(AbstractJFrame ant, int table) throws SQLException {
        super(ant);
        this.table = table;
        Arrays.toString(this.getAttr().toArray());
        // select form class
//        this.selectJFrame();
        // Inicializa os campos da tabela
        this.loadInitialTable(this.getTableName(this.table));
        // popula a tabela com os devidos valores
        this.tablePopulation = this.populateTable(this.getTableName(this.table));
        // Inicializa a lista de filtros
        this.filters = new ArrayList<ArrayList<Object>>();
        initComponents();
        this.setVisible(true);
//        tableAll.setModel(new myTableModel(this.tablePopulation, (String[]) this.getAttr().toArray()));
    }
    
    /**
     * Recarrega os valores da tabela após uma operação
     * de inserção ou atualização
     */
    public void reloadTable() {
        this.setVisible(true);
        this.setEnabled(true);
        this.tablePopulation = this.populateTable(this.getTableName(this.table));
        tableAll.setModel(new myTableModel(
            this.tablePopulation,
            this.getAttr().toArray()
        ));
    }
    
    // TODO : MUDAR TODOS OS CONSTRUTORES DOS FRAMES ABAIXO QUE TIVEREM CADASTRO E ATUALIZACAO PARA RECEBEREM UM BOOLEANO, ALEM DO THIS,
    // QUE INDICARA SE É CADASTRO OU ATUALIZACAO
    private void selectJFrame(boolean flagCadastro, Object obj) {
        switch(this.table) {
            case Config.APRESENTACAO:
                this.form = new Apresentacao(this);
                break;
            case Config.ARTIGO:
                if(flagCadastro){ this.form = new Artigo(this); }
                else {
                    this.form = new Artigo(this, obj);
                }
                break;
            case Config.AUXILIO:
                this.form = new Auxilio(this);
                break;
            case Config.DESPESA:
                // TODO : FAZER
                if(flagCadastro){ this.form = new Despesa(this); }
                else{
                    this.form = new Despesa(this, obj);
                }
                break;
            case Config.EDICAO:
                if(flagCadastro){ this.form = new Edicao(this); }
                else{
                    this.form = new Edicao(this, obj);
                }
                break;
            case Config.EVENTO:
                if(flagCadastro){ this.form = new Evento(this); }
                else {
                    this.form = new Evento(this, obj);
                }
                break;
            case Config.INSCRITO:
                 if(flagCadastro){ this.form = new Inscrito(this); }
                 else {
                     this.form = new Inscrito(this, obj);
                 }
                break;
            case Config.ORGANIZADOR:
                if(flagCadastro) { this.form = new Organizador(this); }
                else{
                    this.form = new Organizador(this, obj);
                }
                break;
            case Config.PATROCINADOR:
                if(flagCadastro) { this.form = new Patrocinador(this); }
                else {
                    this.form = new Patrocinador(this, obj);
                }
                break;
            case Config.PATROCINIO:
                if (flagCadastro) { this.form = new Patrocinio(this); }
                else{
                    this.form = new Patrocinio(this, obj);
                }
                break;
            case Config.PESSOA:
                if (flagCadastro) { this.form = new Pessoa(this); }
                else {
                    this.form = new Pessoa(anterior, obj);
                }
                break;
            default:
                System.out.println("ERROR!!!");
        }
    }
    
    private String getTableName(int num){      
        switch(num){
            case 1:
                return "artigo";
            case 2:
                return "auxilio";
            case 5:
                return "despesa";
            case 6:
                return "edicao";
            case 7:
                return "evento";
            case 8:
                return "inscrito";
            case 9:
                return "organiza";
            case 10:
                return "patrocinador";
            case 11:
                return "patrocinio";
            case 12:
                return "pessoa";      
        }
        return null;   
    }
    
    /**
     * Retorna as opções de filtros para o campo selecionado
     * @return vetor de string com as opções de filtros
     */
    public String[] getFiltersListByType() {
        return this.getFieldType(this.getTableName(this.table), String.valueOf(this.tableFields.getSelectedItem()));
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
        atualizarButton = new javax.swing.JButton();
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

        tableAll.setModel(new myTableModel(
            this.tablePopulation,
            this.getAttr().toArray()
        ));
        tableAll.setToolTipText("");
        tableAll.getTableHeader().setReorderingAllowed(false);
        tableAll.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tableAllMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tableAll);
        tableAll.getColumnModel().getSelectionModel().setSelectionMode(javax.swing.ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);

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

        tableFields.setModel(new javax.swing.DefaultComboBoxModel(this.getAttr().toArray()));
        tableFields.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tableFieldsActionPerformed(evt);
            }
        });

        numberFiltro.setModel(new javax.swing.DefaultComboBoxModel(this.getFiltersListByType()));

        addFiltro.setText("Novo Filtro");
        addFiltro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addFiltroActionPerformed(evt);
            }
        });

        tableFiltros.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Campo de Busca", "Operador", "Valor da Busca"
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

        atualizarButton.setText("Atualizar");
        atualizarButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                atualizarButtonActionPerformed(evt);
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
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 806, Short.MAX_VALUE)
                    .addComponent(jScrollPane1)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(tableFields, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(numberFiltro, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(textfiltro)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(addFiltro, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(atualizarButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
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
                    .addComponent(addButton)
                    .addComponent(atualizarButton))
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
                .addContainerGap(20, Short.MAX_VALUE))
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

    /**
     * Fecha a janela e retorna a tela inicial com todas as tabelas
     * @param evt 
     */
    private void sairAppActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sairAppActionPerformed
        this.onDispose();
    }//GEN-LAST:event_sairAppActionPerformed

    /**
     * Deleta o campo selecionado e recarrega a tabela para excluir o valor
     * @param evt 
     */
    private void removerButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_removerButtonActionPerformed
        String tablename = this.getTableName(this.table);
        this.removeRow(tablename,
                       this.tablePopulation[this.tableAll.getSelectedRow()] );
        
        this.tablePopulation = this.populateTable(tablename);
        tableAll.setModel(new myTableModel(
            this.tablePopulation,
            this.getAttr().toArray()
        ));
        
    }//GEN-LAST:event_removerButtonActionPerformed

    /**
     * Abre a interface de cadastro da devida tabela
     * @param evt 
     */
    private void addButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addButtonActionPerformed
//        this.form.setCadastro();
//        this.form.configuraViews(); // Escrever os títulos, labels adequadamente
        this.selectJFrame(true, null);
        this.form.setVisible(true);
        // Close the screen before
        //this.setEnabled(false);
        //this.setVisible(false);
    }//GEN-LAST:event_addButtonActionPerformed

    /**
     * Recarrega os valores da tabela de filtros de acordo com 
     * o array filters
     */
    protected void reloadFiltersTable() {
        Object[][] f = new Object[this.filters.size()][3];
        for(int i = 0; i < this.filters.size(); i++){
            f[i] = this.filters.get(i).toArray();
        }
        
        // reload table content
        this.tableFiltros.setModel(new myTableModel(
            f,
            new String [] {
                "Campo de Busca", "Operador", "Valor da Busca"
            }
        ));
    }
    
    /**
     * Adiciona um novo filtro na tabela e na lista filters
     * @param evt 
     */
    private void addFiltroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addFiltroActionPerformed
        ArrayList<Object> line = new ArrayList<Object>();
        line.add(String.valueOf(this.tableFields.getSelectedItem()));
        line.add(String.valueOf(this.numberFiltro.getSelectedItem()));
        line.add(this.textfiltro.getText());
        
        this.textfiltro.setText("");
        
        this.filters.add(line);
        this.reloadFiltersTable();
    }//GEN-LAST:event_addFiltroActionPerformed

    /**
     * Remove todos os filtros selecionados da tabela 
     * e limpa o resultado da busca na tabela principal
     * @param evt 
     */
    private void removerTodosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_removerTodosActionPerformed
        this.filters.clear();
        this.reloadFiltersTable();
        
        this.tablePopulation = this.populateTable(this.getTableName(this.table));
        tableAll.setModel(new myTableModel(
            this.tablePopulation,
            this.getAttr().toArray()
        ));
    }//GEN-LAST:event_removerTodosActionPerformed

    /**
     * Remove um filtro selecionado da tabela de filtros e do 
     * array filters
     * @param evt 
     */
    private void removerFiltroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_removerFiltroActionPerformed
        if(this.tableFiltros.getSelectedRow() != -1) {
            this.filters.remove(this.tableFiltros.getSelectedRow());
            this.reloadFiltersTable();
        }
    }//GEN-LAST:event_removerFiltroActionPerformed

    /**
     * Fecha a janela e retorna a jabela principal com todas as tabelas
     * @param evt 
     */
    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        this.onClose(evt);
    }//GEN-LAST:event_formWindowClosing

    /**
     * Realiza a busca com os filtros que estão na tabela,
     * caso não haja nenhum filtro, retorna a busca geral da tabela
     * @param evt 
     */
    private void selectFiltrosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_selectFiltrosActionPerformed
        this.tablePopulation = this.getSearch(this.getTableName(this.table), this.filters);
        tableAll.setModel(new myTableModel(
            this.tablePopulation,
            this.getAttr().toArray()
        ));
    }//GEN-LAST:event_selectFiltrosActionPerformed

    /**
     * Aceita double click em item da tabela principal para realizar atualização
     * do cadastro da devida tabela
     * @param evt 
     */
    private void tableAllMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tableAllMouseClicked
        // TODO add your handling code here:
        if (evt.getClickCount() == 2){ // Checa se é duplo click
            Object o = null;
            int linha = this.tableAll.getSelectedRow();
            
            
            
//            System.out.println(" VALORES: "+this.tableAll.getValueAt(linha, 1).toString()+", "+
//                                String.valueOf(this.tableAll.getValueAt(linha, 3))+", "+
//                                String.valueOf(this.tableAll.getValueAt(linha, 2).toString()));
            
            if(this.table == Config.EVENTO){ // Cria entidade Evento
                String website = null;
                String descricao = null;
                if(this.tableAll.getValueAt(linha, 3) != null){
                    website = this.tableAll.getValueAt(linha, 3).toString();
                }
                if(this.tableAll.getValueAt(linha, 2) != null){
                    descricao = this.tableAll.getValueAt(linha, 2).toString();
                }
                o = new EEvento(this.tableAll.getValueAt(linha, 1).toString(),
                                website, descricao,
                                this.tableAll.getValueAt(linha, 0).toString());
            } else if(this.table == Config.EDICAO){
                String local = null;
                String taxa = null;
                String descricao = null;
                String dataInicio = null;
                String dataFim = null;
                String auxDataHora[] = null;
                String auxData[] = null;
                if(this.tableAll.getValueAt(linha, 4) != null){
                    local = this.tableAll.getValueAt(linha, 4).toString();
                }
                if(this.tableAll.getValueAt(linha, 5) != null){
                    taxa = this.tableAll.getValueAt(linha, 5).toString();
                }
                if(this.tableAll.getValueAt(linha, 8) != null){
                    descricao = this.tableAll.getValueAt(linha, 8).toString();
                }
                if(this.tableAll.getValueAt(linha, 2) != null){
                    auxDataHora = this.tableAll.getValueAt(linha, 2).toString().split(" ");
                    auxData = auxDataHora[0].split("-");
                    dataInicio = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                if(this.tableAll.getValueAt(linha, 3) != null){
                    auxDataHora = this.tableAll.getValueAt(linha, 3).toString().split(" ");
                    auxData = auxDataHora[0].split("-");
                    dataFim = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                System.out.println("dataInicio: "+dataInicio+", dataFim: "+dataFim);
                o = new EEdicao(this.tableAll.getValueAt(linha, 0).toString(),
                        this.tableAll.getValueAt(linha, 1).toString(),
                        local, taxa, descricao, dataInicio, dataFim);
            }if (this.table == Config.PATROCINADOR){
                String razaoSocial=null;
                String telefone=null;
                String endereco=null;
                if(this.tableAll.getValueAt(linha, 1) != null){
                    razaoSocial = this.tableAll.getValueAt(linha, 1).toString();
                }
                if(this.tableAll.getValueAt(linha, 2) != null){
                    telefone = this.tableAll.getValueAt(linha, 2).toString();
                }
                if(this.tableAll.getValueAt(linha, 3) != null){
                    endereco = this.tableAll.getValueAt(linha, 3).toString();
                }
                o = new EPatrocinador(this.tableAll.getValueAt(linha, 0).toString(), 
                        razaoSocial, endereco, telefone);
            }if (this.table == Config.PESSOA){
                String telefone=null;
                String nacionalidade=null;
                String endereco = null;
                if(this.tableAll.getValueAt(linha, 4) != null){
                    telefone = this.tableAll.getValueAt(linha, 4).toString();
                }
                if(this.tableAll.getValueAt(linha, 5) != null){
                    nacionalidade = this.tableAll.getValueAt(linha, 5).toString();
                }
                if(this.tableAll.getValueAt(linha, 6) != null){
                    endereco = this.tableAll.getValueAt(linha, 6).toString();
                }
                o = new EPessoa(this.tableAll.getValueAt(linha, 0).toString(), 
                        this.tableAll.getValueAt(linha,1).toString(), 
                        this.tableAll.getValueAt(linha, 2).toString(), 
                        this.tableAll.getValueAt(linha, 3).toString(), telefone, nacionalidade, endereco);
            }if (this.table == Config.PATROCINIO){
                String dataPat = null;
                String valorPat = null;
                String auxDataHora[] = null;
                String auxData[] = null;
                if(this.tableAll.getValueAt(linha, 3) != null){
                    auxDataHora = this.tableAll.getValueAt(linha, 3).toString().split(" ");
                    auxData = auxDataHora[0].split("-");
                    dataPat = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                if(this.tableAll.getValueAt(linha, 4) != null){
                    valorPat = this.tableAll.getValueAt(linha, 4).toString();
                }
                o = new EPatrocinio(this.tableAll.getValueAt(linha, 0).toString(),
                        this.tableAll.getValueAt(linha, 1).toString(), 
                        this.tableAll.getValueAt(linha, 2).toString(), 
                        dataPat, valorPat);
            }else if (this.table == Config.ORGANIZADOR){
                String cargo = null;
                if(this.tableAll.getValueAt(linha, 3) != null){
                    cargo = this.tableAll.getValueAt(linha, 3).toString();
                }
        // (String idOrg, String cargoOrg, String codEv, String numEd, String nomePe, String nomeEv)         
                o = new EOrganizador(this.tableAll.getValueAt(linha, 0).toString(), 
                        cargo, 
                        this.tableAll.getValueAt(linha, 1).toString(), 
                        this.tableAll.getValueAt(linha, 2).toString(), 
                        this.tableAll.getValueAt(linha, 4).toString(), 
                        this.tableAll.getValueAt(linha, 5).toString());
            }else if(this.table == Config.ARTIGO){
                String auxDataHora[];
                String auxData[];
                String data = null;
                String hora = null;
                if(this.tableAll.getValueAt(linha, 2) != null){
                    auxData = this.tableAll.getValueAt(linha, 2).toString().split("-");
                    data = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                if(this.tableAll.getValueAt(linha, 3) != null){
                    auxData = this.tableAll.getValueAt(linha, 3).toString().split(":");
                    hora = auxData[0]+":"+auxData[1];
                }
    //(String idArt, String tituloArt, String data, String hora, String codEv, String numEd, String idPart, String nomePe)
                o = new EArtigo(this.tableAll.getValueAt(linha, 0).toString(), 
                        this.tableAll.getValueAt(linha, 1).toString(),
                        data, hora, 
                        this.tableAll.getValueAt(linha, 4).toString(), 
                        this.tableAll.getValueAt(linha, 5).toString(),
                        this.tableAll.getValueAt(linha, 6).toString(),
                        this.tableAll.getValueAt(linha, 8).toString());
            } else if(this.table == Config.DESPESA) {
                String auxDataHora[];
                String auxData[];
                String data = null;
                String hora = null;
                if(this.tableAll.getValueAt(linha, 2) != null){
                    auxData = this.tableAll.getValueAt(linha, 2).toString().split("-");
                    data = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
            }

            this.selectJFrame(false, o);
            this.form.setVisible(true);
            
            // Chamar código de edicao da tupla:
            
//            System.out.println(" --- > DoubleClick !");
        }
    }//GEN-LAST:event_tableAllMouseClicked

    /**
     * Carrega os valores do filtro no campo de seleção quando um 
     * campo de busca é selecionado
     * @param evt 
     */
    private void tableFieldsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tableFieldsActionPerformed
        // TODO add your handling code here:
        System.out.println(String.valueOf(this.tableFields.getSelectedItem()));
        numberFiltro.setModel(new javax.swing.DefaultComboBoxModel(this.getFiltersListByType()));
    }//GEN-LAST:event_tableFieldsActionPerformed

    /**
     * Abre interface de atualização do cadastro selecionado na tabela principal
     * @param evt 
     */
    private void atualizarButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_atualizarButtonActionPerformed
            Object o = null;
            int linha = this.tableAll.getSelectedRow();
            
//            System.out.println(" VALORES: "+this.tableAll.getValueAt(linha, 1).toString()+", "+
//                                String.valueOf(this.tableAll.getValueAt(linha, 3))+", "+
//                                String.valueOf(this.tableAll.getValueAt(linha, 2).toString()));
            
            if(this.table == Config.EVENTO){ // Cria entidade Evento
                String website = null;
                String descricao = null;
                if(this.tableAll.getValueAt(linha, 3) != null){
                    website = this.tableAll.getValueAt(linha, 3).toString();
                }
                if(this.tableAll.getValueAt(linha, 2) != null){
                    descricao = this.tableAll.getValueAt(linha, 2).toString();
                }
                o = new EEvento(this.tableAll.getValueAt(linha, 1).toString(),
                                website, descricao,
                                this.tableAll.getValueAt(linha, 0).toString());
            } else if(this.table == Config.EDICAO){
                String local = null;
                String taxa = null;
                String descricao = null;
                String dataInicio = null;
                String dataFim = null;
                String auxDataHora[] = null;
                String auxData[] = null;
                if(this.tableAll.getValueAt(linha, 4) != null){
                    local = this.tableAll.getValueAt(linha, 4).toString();
                }
                if(this.tableAll.getValueAt(linha, 5) != null){
                    taxa = this.tableAll.getValueAt(linha, 5).toString();
                }
                if(this.tableAll.getValueAt(linha, 8) != null){
                    descricao = this.tableAll.getValueAt(linha, 8).toString();
                }
                if(this.tableAll.getValueAt(linha, 2) != null){
                    auxDataHora = this.tableAll.getValueAt(linha, 2).toString().split(" ");
                    auxData = auxDataHora[0].split("-");
                    dataInicio = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                if(this.tableAll.getValueAt(linha, 3) != null){
                    auxDataHora = this.tableAll.getValueAt(linha, 3).toString().split(" ");
                    auxData = auxDataHora[0].split("-");
                    dataFim = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                System.out.println("dataInicio: "+dataInicio+", dataFim: "+dataFim);
                o = new EEdicao(this.tableAll.getValueAt(linha, 0).toString(),
                        this.tableAll.getValueAt(linha, 1).toString(),
                        local, taxa, descricao, dataInicio, dataFim);
            }if (this.table == Config.PATROCINADOR){
                String razaoSocial=null;
                String telefone=null;
                String endereco=null;
                if(this.tableAll.getValueAt(linha, 1) != null){
                    razaoSocial = this.tableAll.getValueAt(linha, 1).toString();
                }
                if(this.tableAll.getValueAt(linha, 2) != null){
                    telefone = this.tableAll.getValueAt(linha, 2).toString();
                }
                if(this.tableAll.getValueAt(linha, 3) != null){
                    endereco = this.tableAll.getValueAt(linha, 3).toString();
                }
                o = new EPatrocinador(this.tableAll.getValueAt(linha, 0).toString(), 
                        razaoSocial, endereco, telefone);
            }if (this.table == Config.PESSOA){
                String telefone=null;
                String nacionalidade=null;
                String endereco = null;
                if(this.tableAll.getValueAt(linha, 4) != null){
                    telefone = this.tableAll.getValueAt(linha, 4).toString();
                }
                if(this.tableAll.getValueAt(linha, 5) != null){
                    nacionalidade = this.tableAll.getValueAt(linha, 5).toString();
                }
                if(this.tableAll.getValueAt(linha, 6) != null){
                    endereco = this.tableAll.getValueAt(linha, 6).toString();
                }
                o = new EPessoa(this.tableAll.getValueAt(linha, 0).toString(), 
                        this.tableAll.getValueAt(linha,1).toString(), 
                        this.tableAll.getValueAt(linha, 2).toString(), 
                        this.tableAll.getValueAt(linha, 3).toString(), telefone, nacionalidade, endereco);
            }if (this.table == Config.PATROCINIO){
                String dataPat = null;
                String valorPat = null;
                String auxDataHora[] = null;
                String auxData[] = null;
                if(this.tableAll.getValueAt(linha, 3) != null){
                    auxDataHora = this.tableAll.getValueAt(linha, 3).toString().split(" ");
                    auxData = auxDataHora[0].split("-");
                    dataPat = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                if(this.tableAll.getValueAt(linha, 4) != null){
                    valorPat = this.tableAll.getValueAt(linha, 4).toString();
                }
                o = new EPatrocinio(this.tableAll.getValueAt(linha, 0).toString(),
                        this.tableAll.getValueAt(linha, 1).toString(), 
                        this.tableAll.getValueAt(linha, 2).toString(), 
                        dataPat, valorPat);
            }else if (this.table == Config.ORGANIZADOR){
                String telefone=null;
                String nacionalidade=null;
                String endereco = null;
                if(this.tableAll.getValueAt(linha, 4) != null){
                    telefone = this.tableAll.getValueAt(linha, 4).toString();
                }
                if(this.tableAll.getValueAt(linha, 5) != null){
                    nacionalidade = this.tableAll.getValueAt(linha, 5).toString();
                }
                if(this.tableAll.getValueAt(linha, 6) != null){
                    endereco = this.tableAll.getValueAt(linha, 6).toString();
                }
                o = new EPessoa(this.tableAll.getValueAt(linha, 0).toString(), 
                        this.tableAll.getValueAt(linha,1).toString(), 
                        this.tableAll.getValueAt(linha, 2).toString(), 
                        this.tableAll.getValueAt(linha, 3).toString(), telefone, nacionalidade, endereco);
            }else if(this.table == Config.ARTIGO){
                String auxDataHora[];
                String auxData[];
                String data = null;
                String hora = null;
                if(this.tableAll.getValueAt(linha, 2) != null){
                    auxData = this.tableAll.getValueAt(linha, 2).toString().split("-");
                    data = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                if(this.tableAll.getValueAt(linha, 3) != null){
                    auxData = this.tableAll.getValueAt(linha, 3).toString().split(":");
                    hora = auxData[0]+":"+auxData[1];
                }
    //(String idArt, String tituloArt, String data, String hora, String codEv, String numEd, String idPart, String nomePe)
                o = new EArtigo(this.tableAll.getValueAt(linha, 0).toString(), 
                        this.tableAll.getValueAt(linha, 1).toString(),
                        data, hora, 
                        this.tableAll.getValueAt(linha, 4).toString(), 
                        this.tableAll.getValueAt(linha, 5).toString(),
                        this.tableAll.getValueAt(linha, 6).toString(),
                        this.tableAll.getValueAt(linha, 8).toString());
            } else if(this.table == Config.DESPESA) {
                String auxData[];
                String data = null;
                System.out.println(this.tableAll.getValueAt(linha, 6));
                if(this.tableAll.getValueAt(linha, 6) != null){
                    auxData = this.tableAll.getValueAt(linha, 6).toString().split(" ");
                    auxData = auxData[0].split("-");
                    data = auxData[2]+"/"+auxData[1]+"/"+auxData[0];
                }
                o = new EDespesa(this.tableAll.getValueAt(linha, 9).toString(),
                                 this.tableAll.getValueAt(linha, 0).toString(),
                                 this.tableAll.getValueAt(linha, 1).toString(), 
                                 this.tableAll.getValueAt(linha, 2).toString(), 
                                 this.tableAll.getValueAt(linha, 3).toString(), 
                                 this.tableAll.getValueAt(linha, 4).toString(), 
                                 this.tableAll.getValueAt(linha, 5).toString(),
                                 data, 
                                 this.tableAll.getValueAt(linha, 7).toString(), 
                                 this.tableAll.getValueAt(linha, 8).toString(),
                                 this.tableAll.getValueAt(linha, 10).toString());
            }

            this.selectJFrame(false, o);
            this.form.setVisible(true);
            
    }//GEN-LAST:event_atualizarButtonActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton addButton;
    private javax.swing.JButton addFiltro;
    private javax.swing.JButton atualizarButton;
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
