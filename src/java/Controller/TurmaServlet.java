package Controller;

import DAO.TurmaDAO;
import Model.Turma;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TurmaServlet", urlPatterns = {"/TurmaServlet"})
public class TurmaServlet extends HttpServlet {

    private TurmaDAO turmaDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        turmaDAO = new TurmaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    showAddForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteTurma(request, response);
                    break;
                case "confirmDelete":
                    confirmDeleteTurma(request, response);
                    break;
                default:
                    listTurmas(request, response);
                    break;
            }
        } else {
            listTurmas(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "insert":
                    insertTurma(request, response);
                    break;
                case "update":
                    updateTurma(request, response);
                    break;
                default:
                    doGet(request, response);
                    break;
            }
        } else {
            doGet(request, response);
        }
    }

    private void listTurmas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Turma> listaTurmas = turmaDAO.listarTurmas();
        request.setAttribute("listaTurmas", listaTurmas);
        request.getRequestDispatcher("/Turma/FRMListarTurmas.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Turma/FRMTurma.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            Turma turma = turmaDAO.buscarPorId(id);
            if (turma != null) {
                // Redireciona para a página de edição com os parâmetros na URL
                String url = "/Turma/FRMEditarTurma.jsp?id=" + turma.getId() + "&nome=" + turma.getNome();
                response.sendRedirect(request.getContextPath() + url);
            } else {
                response.sendRedirect(request.getContextPath() + "/TurmaServlet");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/TurmaServlet");
        }
    }

    private void insertTurma(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        Turma novaTurma = new Turma();
        novaTurma.setNome(nome);
        turmaDAO.salvar(novaTurma);
        response.sendRedirect("TurmaServlet");
    }

    private void updateTurma(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        Turma turma = new Turma();
        turma.setId(id);
        turma.setNome(nome);
        turmaDAO.atualizar(turma);
        response.sendRedirect("TurmaServlet");
    }

    private void deleteTurma(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Turma turma = turmaDAO.buscarPorId(id);
        if (turma != null) {
            try {
                turmaDAO.excluir(turma);
                request.setAttribute("message", "Turma excluída com sucesso!");
            } catch (Exception e) {
                request.setAttribute("message", "Erro ao excluir turma: " + e.getMessage());
            }
        } else {
            request.setAttribute("message", "Turma não encontrada.");
        }
        // Redirecionar para a página de listagem de turmas
        response.sendRedirect("TurmaServlet");
    }

    private void confirmDeleteTurma(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Turma turma = turmaDAO.buscarPorId(id);
        if (turma != null) {
            turmaDAO.excluir(turma);
        }
        response.sendRedirect("TurmaServlet");
    }
}
