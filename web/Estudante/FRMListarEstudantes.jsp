<%@page import="Model.Estudante"%>
<%@page import="DAO.EstudanteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listagem de Estudantes</title>
    <!-- Adicione aqui os links para os arquivos CSS do Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Adicione aqui os links para os arquivos CSS de ícones, como Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #b4e4f0; /* Cor de fundo */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Listagem de Estudantes</h1>
        <div class="text-right mb-4">
            <a href="${pageContext.request.contextPath}/Estudante/FRMEstudante.jsp" class="btn btn-success">Adicionar Estudante</a>
        </div>
        <table class="table table-striped mt-4 table-dark">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Número de Matrícula</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Apelido</th>
                    <th scope="col">Endereço</th>
                    <th scope="col">Contacto</th>
                    <th scope="col">Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    EstudanteDAO estudanteDAO = new EstudanteDAO();
                    for (Estudante estudante : estudanteDAO.listarEstudantes()) {
                        count++;
                %>
                <tr>
                    <td><%= count %></td>
                    <td><%= estudante.getNrMatricula() %></td>
                    <td><%= estudante.getNome() %></td>
                    <td><%= estudante.getApelido() %></td>
                    <td><%= estudante.getEndereco() %></td>
                    <td><%= estudante.getContacto() %></td>
                    <td>
                        <a href="javascript:void(0);" onclick="visualizarEstudante(<%= estudante.getNrMatricula() %>)" class="btn btn-success btn-sm"><i class="fas fa-eye"></i></a>
                        <a href="javascript:void(0);" onclick="editarEstudante(<%= estudante.getNrMatricula() %>)" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                        <a href="javascript:void(0);" onclick="excluirEstudante(<%= estudante.getNrMatricula() %>, '<%= estudante.getNome() %>')" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <!-- Adicione aqui os scripts necessários, como o Bootstrap e o Font Awesome -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
      function visualizarEstudante(nrMatricula) {
    window.location.href = "${pageContext.request.contextPath}/EstudanteServlet?action=view&id=" + nrMatricula;
}

        function editarEstudante(nrMatricula) {
            window.location.href = "${pageContext.request.contextPath}/EstudanteServlet?action=edit&nrMatricula=" + nrMatricula;
        }
        function excluirEstudante(nrMatricula, nome) {
            if (confirm("Deseja realmente excluir o estudante \"" + nome + "\"?")) {
                window.location.href = "${pageContext.request.contextPath}/EstudanteServlet?action=delete&nrMatricula=" + nrMatricula;
            }
        }
    </script>
</body>
</html>
