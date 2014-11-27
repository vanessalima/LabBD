/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 * Template da classe patrocinador para carregar informações de linhas da tabela
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class EPatrocinador {
    private String cnpj;
    private String razaoSocial;
    private String endereco;
    private String telefone;

    public EPatrocinador(String cnpj, String razaoSocial, String endereco, String telefone) {
        this.cnpj = cnpj;
        this.razaoSocial = razaoSocial;
        this.endereco = endereco;
        this.telefone = telefone;
        System.out.println("CNPJ: "+this.cnpj);
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    
}
