package DAO;

import Model.Estudante;
import Utilitarios.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class EstudanteDAO {
    private Session sessao;
    private Transaction transacao;

    public void salvar(Estudante estudante) {
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            sessao.save(estudante);
            transacao.commit();
        } catch (Exception e) {
            if (transacao != null) {
                transacao.rollback();
            }
            e.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
    }

    public void atualizar(Estudante estudante) {
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            sessao.update(estudante);
            transacao.commit();
        } catch (Exception e) {
            if (transacao != null) {
                transacao.rollback();
            }
            e.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
    }

    public void excluir(Estudante estudante) {
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            sessao.delete(estudante);
            transacao.commit();
        } catch (Exception e) {
            if (transacao != null) {
                transacao.rollback();
            }
            e.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
    }

    public Estudante buscarPorId(int nrMatricula) {
        Estudante estudante = null;
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            estudante = (Estudante) sessao.get(Estudante.class, nrMatricula);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return estudante;
    }
    
    public List<Estudante> listarEstudantes() {
        List<Estudante> listaEstudantes = new ArrayList<>();
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            listaEstudantes = sessao.createQuery("FROM Estudante").list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return listaEstudantes;
    }
}
