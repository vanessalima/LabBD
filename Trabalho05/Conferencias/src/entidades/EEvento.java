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
public class EEvento {
    private String nomeEv;
    private String webSite;
    private String descricao;
    private String codev;

    public EEvento(String nomeEv, String webSite, String descricao, String codev) {
        this.nomeEv = nomeEv;
        this.webSite = webSite;
        this.descricao = descricao;
        this.codev = codev;
    }

    public String getCodev() {
        return codev;
    }

    public void setCodev(String codev) {
        this.codev = codev;
    }
    
    
    public EEvento(String nomeEv) {
        this.nomeEv = nomeEv;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getNomeEv() {
        return nomeEv;
    }

    public void setNomeEv(String nomeEv) {
        this.nomeEv = nomeEv;
    }
    
    
}
