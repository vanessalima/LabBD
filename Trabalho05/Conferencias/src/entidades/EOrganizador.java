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
public class EOrganizador {
    private String idOrg;
    private String cargoOrg;
    private String codEv;
    private String numEd;
    private String nomePe;
    private String nomeEv;

    public EOrganizador(String idOrg, String cargoOrg, String codEv, String numEd, String nomePe, String nomeEv) {
        this.idOrg = idOrg;
        this.cargoOrg = cargoOrg;
        this.codEv = codEv;
        this.numEd = numEd;
        this.nomePe = nomePe;
        this.nomeEv = nomeEv;
    }

    public String getIdOrg() {
        return idOrg;
    }

    public void setIdOrg(String idOrg) {
        this.idOrg = idOrg;
    }

    public String getCargoOrg() {
        return cargoOrg;
    }

    public void setCargoOrg(String cargoOrg) {
        this.cargoOrg = cargoOrg;
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

    public String getNomePe() {
        return nomePe;
    }

    public void setNomePe(String nomePe) {
        this.nomePe = nomePe;
    }

    public String getNomeEv() {
        return nomeEv;
    }

    public void setNomeEv(String nomeEv) {
        this.nomeEv = nomeEv;
    }
    
    
}
