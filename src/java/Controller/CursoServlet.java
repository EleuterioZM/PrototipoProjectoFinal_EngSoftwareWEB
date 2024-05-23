package Controller;

import DAO.CursoDAO;
import Model.Curso;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CursoServlet", urlPatterns = {"/CursoServlet"})
public class CursoServlet extends HttpServlet {

    private CursoDAO cursoDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        cursoDAO = new CursoDAO();
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
                    deleteCurso(request, response);
                    break;
                case "confirmDelete":
                    confirmDeleteCurso(request, response);
                    break;
                default:
                    listCursos(request, response);
                    break;
            }
        } else {
            listCursos(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "insert":
                    insertCurso(request, response);
                    break;
                case "update":
                    updateCurso(request, response);
                    break;
                default:
                    doGet(request, response);
                    break;
            }
        } else {
            doGet(request, response);
        }
    }

    private void listCursos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Curso> listaCursos = cursoDAO.listarCursos();
        request.setAttribute("listaCursos", listaCursos);
        request.getRequestDispatcher("/Curso/FRMListarCursos.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Curso/FRMCurso.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            Curso curso = cursoDAO.buscarPorId(id);
            if (curso != null) {
                // Redireciona para a página de edição com os parâmetros na URL
                String url = "/Curso/FRMEditarCurso.jsp?id=" + curso.getId() + "&nome=" + curso.getNome();
                response.sendRedirect(request.getContextPath() + url);
            } else {
                response.sendRedirect(request.getContextPath() + "/CursoServlet");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/CursoServlet");
        }
    }

    private void insertCurso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        Curso novoCurso = new Curso();
        novoCurso.setNome(nome);
        cursoDAO.salvar(novoCurso);
        response.sendRedirect("CursoServlet");
    }

    private void updateCurso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        Curso curso = new Curso();
        curso.setId(id);
        curso.setNome(nome);
        cursoDAO.atualizar(curso);
        response.sendRedirect("CursoServlet");
    }

    private void deleteCurso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Curso curso = cursoDAO.buscarPorId(id);
        if (curso != null) {
            try {
                cursoDAO.excluir(curso);
                request.setAttribute("message", "Curso excluído com sucesso!");
            } catch (Exception e) {
                request.setAttribute("message", "Erro ao excluir curso: " + e.getMessage());
            }
        } else {
            request.setAttribute("message", "Curso não encontrado.");
        }
        // Redirecionar para a página de listagem de cursos
        response.sendRedirect("CursoServlet");
    }

    private void confirmDeleteCurso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Curso curso = cursoDAO.buscarPorId(id);
        if (curso != null) {
            cursoDAO.excluir(curso);
        }
        response.sendRedirect("CursoServlet");
    }
}
