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

    public EEvento(String nomeEv, String webSite, String descricao) {
        this.nomeEv = nomeEv;
        this.webSite = webSite;
        this.descricao = descricao;
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
