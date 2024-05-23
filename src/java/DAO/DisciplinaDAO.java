package DAO;

import Model.Disciplina;
import Utilitarios.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class DisciplinaDAO {
    private Session sessao;
    private Transaction transacao;

    public void salvar(Disciplina disciplina) {
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            sessao.save(disciplina);
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

    public void atualizar(Disciplina disciplina) {
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            sessao.update(disciplina);
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

    public void excluir(Disciplina disciplina) {
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            sessao.delete(disciplina);
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

    public Disciplina buscarPorId(int id) {
        Disciplina disciplina = null;
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            disciplina = (Disciplina) sessao.get(Disciplina.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return disciplina;
    }
    
    public List<Disciplina> listarDisciplinas() {
        List<Disciplina> listaDisciplinas = new ArrayList<>();
        try {
            sessao = HibernateUtil.getSessionFactory().openSession();
            listaDisciplinas = sessao.createQuery("FROM Disciplina").list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return listaDisciplinas;
    }
}
