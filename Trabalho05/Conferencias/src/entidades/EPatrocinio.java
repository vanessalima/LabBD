/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 * Template da classe patrocinio para carregar informações de linhas da tabela
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class EPatrocinio {
    private String cnpj;
    private String codEv;
    private String numEd;
    private String dataPat;
    private String valorPat;

    public EPatrocinio(String cnpj, String codEv, String numEd, String dataPat, String valorPat) {
        this.cnpj = cnpj;
        this.codEv = codEv;
        this.numEd = numEd;
        this.dataPat = dataPat;
        this.valorPat = valorPat;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getCodEv() {
        return codEv;
    }

    public void setCodEv(String codEv) {
        this.codEv = codEv;
    }

    public String getNumEd() {
        return numEd;
    }

    public void setNumEd(String numEd) {
        this.numEd = numEd;
    }

    public String getDataPat() {
        return dataPat;
    }

    public void setDataPat(String dataPat) {
        this.dataPat = dataPat;
    }

    public String getValorPat() {
        return valorPat;
    }

    public void setValorPat(String valorPat) {
        this.valorPat = valorPat;
    }
    
    
}
