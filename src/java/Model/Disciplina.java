package Model;
// Generated 06-May-2024 15:40:28 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Disciplina generated by hbm2java
 */
public class Disciplina  implements java.io.Serializable {


     private Integer id;
     private String nome;
     private Integer chs;
     private Integer credito;
     private Set avaliacaos = new HashSet(0);

    public Disciplina() {
    }

    public Disciplina(String nome, Integer chs, Integer credito, Set avaliacaos) {
       this.nome = nome;
       this.chs = chs;
       this.credito = credito;
       this.avaliacaos = avaliacaos;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    public Integer getChs() {
        return this.chs;
    }
    
    public void setChs(Integer chs) {
        this.chs = chs;
    }
    public Integer getCredito() {
        return this.credito;
    }
    
    public void setCredito(Integer credito) {
        this.credito = credito;
    }
    public Set getAvaliacaos() {
        return this.avaliacaos;
    }
    
    public void setAvaliacaos(Set avaliacaos) {
        this.avaliacaos = avaliacaos;
    }




}


