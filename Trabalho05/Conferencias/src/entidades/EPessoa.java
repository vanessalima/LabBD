/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 * Template da classe pessoa para carregar informações de linhas da tabela
 * @author Carlos Humberto dos Santos Baqueta, Marina Coimbra, Vanessa Apolinário de Lima
 */
public class EPessoa {
    private String idPe;
    private String nome;
    private String email;
    private String instituicao;
    private String telefone;
    private String nacionalidade;
    private String endereco;

    public EPessoa(String idPe, String nome, String email, String instituicao, String telefone, String nacionalidade, String endereco) {
        this.idPe = idPe;
        this.nome = nome;
        this.email = email;
        this.instituicao = instituicao;
        this.telefone = telefone;
        this.nacionalidade = nacionalidade;
        this.endereco = endereco;
    }

    public String getIdPe() {
        return idPe;
    }

    public void setIdPe(String idPe) {
        this.idPe = idPe;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getInstituicao() {
        return instituicao;
    }

    public void setInstituicao(String instituicao) {
        this.instituicao = instituicao;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getNacionalidade() {
        return nacionalidade;
    }

    public void setNacionalidade(String nacionalidade) {
        this.nacionalidade = nacionalidade;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    
    
    
}
