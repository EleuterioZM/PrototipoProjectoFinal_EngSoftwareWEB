package Controller;

import DAO.EstudanteDAO;
import Model.Estudante;
import static com.mysql.cj.conf.PropertyKey.logger;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstudanteServlet", urlPatterns = {"/EstudanteServlet"})
public class EstudanteServlet extends HttpServlet {

    private EstudanteDAO estudanteDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        estudanteDAO = new EstudanteDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    addEstudante(request, response);
                    break;
                case "edit":
                    editEstudante(request, response);
                    break;
                case "delete":
                    deleteEstudante(request, response);
                    break;

                case "search":
                    searchEstudante(request, response);
                    break;
                case "confirmDelete":
                    confirmDeleteEstudante(request, response);
                    break;
                case "view":
                    viewEstudante(request, response);
                    break;
                default:
                    listEstudantes(request, response);
                    break;
            }
        } else {
            listEstudantes(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("update".equals(action)) {
            updateEstudante(request, response);
        } else {
            doGet(request, response);
        }
    }

    private void addEstudante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obter parâmetros do formulário
        String nome = request.getParameter("nome");
        String apelido = request.getParameter("apelido");
        String endereco = request.getParameter("endereco");
        String contacto = request.getParameter("contacto");

        // Criar objeto Estudante com os parâmetros
        Estudante estudante = new Estudante();
        estudante.setNome(nome);
        estudante.setApelido(apelido);
        estudante.setEndereco(endereco);
        estudante.setContacto(contacto);

        // Chamar método do DAO para adicionar estudante
        try {
            estudanteDAO.salvar(estudante);
            request.setAttribute("message", "Estudante cadastrado com sucesso!");
        } catch (Exception e) {
            request.setAttribute("message", "Erro ao cadastrar estudante: " + e.getMessage());
        }

        // Redirecionar para página de listagem de estudantes
        response.sendRedirect(request.getContextPath() + "/EstudanteServlet");
    }

    private void editEstudante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obter ID do estudante a ser editado
        int id = Integer.parseInt(request.getParameter("id"));
        // Chamar método do DAO para obter o estudante pelo ID
        Estudante estudante = estudanteDAO.buscarPorId(id);
        if (estudante != null) {
            // Encaminhar para página de edição com dados do estudante
            request.setAttribute("estudante", estudante);
            request.getRequestDispatcher("/editarEstudante.jsp").forward(request, response);
        } else {
            // Redirecionar para página de listagem de estudantes se o estudante não for encontrado
            response.sendRedirect(request.getContextPath() + "/EstudanteServlet");
        }
    }

    private void deleteEstudante(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String nrMatriculaStr = request.getParameter("nrMatricula");
    if (nrMatriculaStr != null && !nrMatriculaStr.isEmpty()) {
        int nrMatricula = Integer.parseInt(nrMatriculaStr);
        Estudante estudante = estudanteDAO.buscarPorId(nrMatricula);
        if (estudante != null) {
            try {
                estudanteDAO.excluir(estudante);
                request.setAttribute("message", "Estudante excluído com sucesso!");
               
            } catch (Exception e) {
                request.setAttribute("message", "Erro ao excluir estudante: " + e.getMessage());
               
            }
        } else {
            request.setAttribute("message", "Estudante não encontrado.");
           
        }
    } else {
        request.setAttribute("message", "Número de matrícula inválido.");
      
    }
    response.sendRedirect(request.getContextPath() + "/EstudanteServlet");
}

private void confirmDeleteEstudante(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Obter número de matrícula do estudante a ser excluído
    int nrMatricula = Integer.parseInt(request.getParameter("nrMatricula"));
    // Chamar método do DAO para excluir o estudante pelo número de matrícula
    Estudante estudante = estudanteDAO.buscarPorId(nrMatricula);
    if (estudante != null) {
        try {
            estudanteDAO.excluir(estudante);
            request.setAttribute("message", "Estudante excluído com sucesso!");
        } catch (Exception e) {
            request.setAttribute("message", "Erro ao excluir estudante: " + e.getMessage());
        }
    } else {
        request.setAttribute("message", "Estudante não encontrado.");
    }
    // Redirecionar para página de listagem de estudantes
    response.sendRedirect(request.getContextPath() + "/EstudanteServlet");
}


    private void searchEstudante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nrMatriculaStr = request.getParameter("nrMatricula");
        if (nrMatriculaStr != null && !nrMatriculaStr.isEmpty()) {
            int nrMatricula = Integer.parseInt(nrMatriculaStr);
            Estudante estudante = estudanteDAO.buscarPorId(nrMatricula);
            if (estudante != null) {
                // Estudante encontrado, definir como atributo do pedido
                request.setAttribute("estudante", estudante);
            } else {
                // Nenhum estudante encontrado com o número de matrícula fornecido
                request.setAttribute("mensagem", "Nenhum estudante encontrado com o número de matrícula fornecido.");
            }
        } else {
            // Número de matrícula não fornecido
            request.setAttribute("mensagem", "Número de matrícula não fornecido.");
        }
        // Encaminhar para a página adequada para renderizar a resposta
        request.getRequestDispatcher("/resultadoPesquisaEstudante.jsp").forward(request, response);
    }

    private void viewEstudante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obter ID do estudante a ser visualizado
        int id = Integer.parseInt(request.getParameter("id"));
        // Chamar método do DAO para obter o estudante pelo ID
        Estudante estudante = estudanteDAO.buscarPorId(id);
        if (estudante != null) {
            // Encaminhar para página de visualização com dados do estudante
            request.setAttribute("estudante", estudante);
            request.getRequestDispatcher("/Estudante/visualizarEstudante.jsp").forward(request, response);
        } else {
            // Redirecionar para página de listagem de estudantes se o estudante não for encontrado
            response.sendRedirect(request.getContextPath() + "/EstudanteServlet");
        }
    }

    private void listEstudantes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obter lista de estudantes do banco de dados
        List<Estudante> estudantes = estudanteDAO.listarEstudantes();

        // Definir a lista como um atributo na requisição
        request.setAttribute("listaEstudantes", estudantes);

        // Configuração da paginação
        int totalEstudantes = estudantes.size();
        int estudantesPorPagina = 6; // Número de estudantes por página
        int totalPaginas = (int) Math.ceil((double) totalEstudantes / estudantesPorPagina);
        request.setAttribute("totalPaginas", totalPaginas);

        // Parâmetros para controle de página
        String paginaStr = request.getParameter("pagina");
        int paginaAtual = 1; // Página inicial
        if (paginaStr != null && !paginaStr.isEmpty()) {
            paginaAtual = Integer.parseInt(paginaStr);
        }
        int indiceInicial = (paginaAtual - 1) * estudantesPorPagina;
        int indiceFinal = Math.min(indiceInicial + estudantesPorPagina, totalEstudantes);

        // Sublista de estudantes para a página atual
        List<Estudante> estudantesPagina = estudantes.subList(indiceInicial, indiceFinal);

        // Definir a lista de estudantes da página como um atributo na requisição
        request.setAttribute("listaEstudantesPagina", estudantesPagina);

        // Encaminhar para a página JSP de listagem de estudantes
        request.getRequestDispatcher("/Estudante/FRMListarEstudantes.jsp").forward(request, response);
    }

    private void updateEstudante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obter parâmetros do formulário
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String apelido = request.getParameter("apelido");
        String endereco = request.getParameter("endereco");
        String contacto = request.getParameter("contacto");

        // Chamar método do DAO para obter o estudante pelo ID
        Estudante estudante = estudanteDAO.buscarPorId(id);
        if (estudante != null) {
            // Atualizar dados do estudante
            estudante.setNome(nome);
            estudante.setApelido(apelido);
            estudante.setEndereco(endereco);
            estudante.setContacto(contacto);
            // Chamar método do DAO para atualizar estudante
            try {
                estudanteDAO.atualizar(estudante);
                request.setAttribute("message", "Estudante atualizado com sucesso!");
            } catch (Exception e) {
                request.setAttribute("message", "Erro ao atualizar estudante: " + e.getMessage());
            }
        } else {
            request.setAttribute("message", "Estudante não encontrado.");
        }
        // Redirecionar para página de listagem de estudantes
        response.sendRedirect(request.getContextPath() + "/EstudanteServlet");
    }
}
