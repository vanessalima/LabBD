/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 * Template da classe despesa para carregar informações de linhas da tabela
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class EDespesa {
    private String nomeEv;
    private String codEv;
    private String numEd;
    private String codDesp;
    private String cnpjPat;
    private String codEvPat;
    private String numEdPat;
    private String dataDesp;
    private String valorDesp;
    private String descricaoDesp;
    private String razaoSocial;

    public EDespesa(String nomeEv, String codEv, String numEd, String codDesp, String cnpjPat, String codEvPat, String numEdPat, String dataDesp, String valorDesp, String descricaoDesp, String razaoSocial) {
        this.nomeEv = nomeEv;
        this.codEv = codEv;
        this.numEd = numEd;
        this.codDesp = codDesp;
        this.cnpjPat = cnpjPat;
        this.codEvPat = codEvPat;
        this.numEdPat = numEdPat;
        this.dataDesp = dataDesp;
        this.valorDesp = valorDesp;
        this.descricaoDesp = descricaoDesp;
        this.razaoSocial = razaoSocial;
    }

    public String getCodEv() {
        return codEv;
    }

    public void setCodEv(String codEv) {
        this.codEv = codEv;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getNomeEv() {
        return nomeEv;
    }

    public void setNomeEv(String nomeEv) {
        this.nomeEv = nomeEv;
    }

    public String getNumEd() {
        return numEd;
    }

    public void setNumEd(String numEd) {
        this.numEd = numEd;
    }

    public String getCodDesp() {
        return codDesp;
    }

    public void setCodDesp(String codDesp) {
        this.codDesp = codDesp;
    }

    public String getCnpjPat() {
        return cnpjPat;
    }

    public void setCnpjPat(String cnpjPat) {
        this.cnpjPat = cnpjPat;
    }

    public String getCodEvPat() {
        return codEvPat;
    }

    public void setCodEvPat(String codEvPat) {
        this.codEvPat = codEvPat;
    }

    public String getNumEdPat() {
        return numEdPat;
    }

    public void setNumEdPat(String numEdPat) {
        this.numEdPat = numEdPat;
    }

    public String getDataDesp() {
        return dataDesp;
    }

    public void setDataDesp(String dataDesp) {
        this.dataDesp = dataDesp;
    }

    public String getValorDesp() {
        return valorDesp;
    }

    public void setValorDesp(String valorDesp) {
        this.valorDesp = valorDesp;
    }

    public String getDescricaoDesp() {
        return descricaoDesp;
    }

    public void setDescricaoDesp(String descricaoDesp) {
        this.descricaoDesp = descricaoDesp;
    }
    
    
}
