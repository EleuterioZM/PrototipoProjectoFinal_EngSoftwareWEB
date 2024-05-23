<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listagem de Cursos</title>
    <!-- Adicione aqui os links para os arquivos CSS do Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Adicione aqui os links para os arquivos CSS de ícones, como Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

   <style>
        body {
            background-color:#b4e4f0; /* Cor de fundo */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Listagem de Cursos</h1>
        <div scope="col" class="text-right">
           
            <a href="${pageContext.request.contextPath}/Curso/FRMCurso.jsp" class="btn btn-success">Adicionar Curso</a>

         
        </div>
        <table class="table table-striped mt-4 table-dark">
           <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">ID</th>
        <th scope="col">Nome do Curso</th>
        <th scope="col">Ações</th>
        
    </tr>
</thead>

            <tbody>
                <c:forEach var="curso" items="${listaCursos}">
                   <tr>
                       <td>#</td>
    <td>${curso.id}</td>
    <td>${curso.nome}</td>
    <td>
        <%--   <a href="javascript:void(0);" onclick="visualizarCurso(${curso.id}, '${curso.nome}')" class="btn btn-success btn-sm"><i class="fas fa-eye "></i>Visualizar</a>--%>
      <a href="javascript:void(0);" onclick="editarCurso(${curso.id}, '${curso.nome}')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i>Editar</a>
<a href="javascript:void(0);" onclick="excluirCurso(${curso.id}, '${curso.nome}')" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Excluir</a>

    </td>
</tr>

                </c:forEach>
            </tbody>
        </table>
        
    </div>
    <!-- Adicione aqui os scripts necessários, como o Bootstrap e o Font Awesome -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
function excluirCurso(id, nome) {
    if (confirm("Deseja realmente excluir o curso \"" + nome + "\"?")) {
        window.location.href = "CursoServlet?action=delete&id=" + id;
    }
}
function editarCurso(id) {
    // Redireciona para a página de edição com o ID do curso
    window.location.href = "CursoServlet?action=edit&id=" + id;
}

function visualizarCurso(id, nome) {
    // Redireciona para a página de visualização com o ID do curso
    window.location.href = "CursoServlet?action=visualizar&id=" + id;
}

</script>

</body>
</html>
