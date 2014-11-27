/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import conferencias.DBconnection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Template da classe edição para carregar informações de linhas da tabela
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class EEdicao {
    private String evento;
    private String codEv;

    private String numEd;
    private String local;
    private String taxa;
    private String descricao;
    private String dataInicio;
    private String dataFim;

    public EEdicao(String codEv, String numEd, String local, String taxa, String descricao, String dataInicio, String dataFim) {
        this.codEv = codEv;
        this.numEd = numEd;
        this.local = local;
        this.taxa = taxa;
        this.descricao = descricao;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.evento = this.getNomeEvento(codEv);
    }

    public String getCodEv() {
        return codEv;
    }

    public void setCodEv(String codEv) {
        this.codEv = codEv;
    }

    public String getEvento() {
        return evento;
    }

    public void setEvento(String evento) {
        this.evento = evento;
    }

    public String getNumEd() {
        return numEd;
    }

    public void setNumEd(String numEd) {
        this.numEd = numEd;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getTaxa() {
        return taxa;
    }

    public void setTaxa(String taxa) {
        this.taxa = taxa;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(String dataInicio) {
        this.dataInicio = dataInicio;
    }

    public String getDataFim() {
        return dataFim;
    }

    public void setDataFim(String dataFim) {
        this.dataFim = dataFim;
    }

    private String getNomeEvento(String codEv) {
        try{
            DBconnection conn = new DBconnection();
            String sql = "SELECT nomeEv from evento WHERE codEv = "+codEv;
            ResultSet rs = conn.query(sql);
            String nome = "";
            while(rs != null && rs.next()){
                nome = rs.getString("nomeEv");
            }
            conn.disconect();
            return nome;
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
        return null;
    }
    
    
}
