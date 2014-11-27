/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 * Template da classe artigo para carregar informações de linhas da tabela
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class EArtigo {
    private String idArt;
    private String tituloArt;
    private String data;
    private String hora;
    private String codEv;
    private String numEd;
    private String idPart;
    private String nomePe;

    public EArtigo(String idArt, String tituloArt, String data, String hora, String codEv, String numEd, String idPart, String nomePe) {
        this.idArt = idArt;
        this.tituloArt = tituloArt;
        this.data = data;
        this.hora = hora;
        this.codEv = codEv;
        this.numEd = numEd;
        this.idPart = idPart;
        this.nomePe = nomePe;
    }

    public String getNomePe() {
        return nomePe;
    }

    public void setNomePe(String nomePe) {
        this.nomePe = nomePe;
    }

    public String getIdArt() {
        return idArt;
    }

    public void setIdArt(String idArt) {
        this.idArt = idArt;
    }

    public String getTituloArt() {
        return tituloArt;
    }

    public void setTituloArt(String tituloArt) {
        this.tituloArt = tituloArt;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
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

    public String getIdPart() {
        return idPart;
    }

    public void setIdPart(String idPart) {
        this.idPart = idPart;
    }
    
    
}
