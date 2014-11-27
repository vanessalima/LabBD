/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 *
 * @author ch
 */
public class EInscrito {
    private String codEv;
    private String nomeEv;
    private String numEd;
    private String idPart;
    private String dataInsc;
    private String nomePe;
    private char tipoApresentador;

    public EInscrito(String codEv, String nomeEv, String numEd, String idPart, String dataInsc, String nomePe, char tipoApresentador) {
        this.codEv = codEv;
        this.nomeEv = nomeEv;
        this.numEd = numEd;
        this.idPart = idPart;
        this.dataInsc = dataInsc;
        this.nomePe = nomePe;
        this.tipoApresentador = tipoApresentador;
    }

    public String getCodEv() {
        return codEv;
    }

    public void setCodEv(String codEv) {
        this.codEv = codEv;
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

    public String getIdPart() {
        return idPart;
    }

    public void setIdPart(String idPart) {
        this.idPart = idPart;
    }

    public String getDataInsc() {
        return dataInsc;
    }

    public void setDataInsc(String dataInsc) {
        this.dataInsc = dataInsc;
    }

    public String getNomePe() {
        return nomePe;
    }

    public void setNomePe(String nomePe) {
        this.nomePe = nomePe;
    }

    public char getTipoApresentador() {
        return tipoApresentador;
    }

    public void setTipoApresentador(char tipoApresentador) {
        this.tipoApresentador = tipoApresentador;
    }
    
    
}
