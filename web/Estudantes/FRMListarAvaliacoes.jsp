<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listagem de Avaliações</title>
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
        <h1 class="mt-4">Listagem de Avaliações</h1>
        <div scope="col" class="text-right">
            <a href="FRMAvalicao.jsp" class="btn btn-success">Adicionar Avaliação</a>
         
        </div>
        <table class="table table-striped mt-4 table-dark">
           <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">ID</th>
        <th scope="col">Descrição</th>
        <th scope="col">Peso</th>
        <th scope="col" style="margin-left:45px">Ações</th>
        
    </tr>
</thead>

            <tbody>
                <c:forEach var="avaliacao" items="${listaAvaliacoes}">
                   <tr>
                       <td>#</td>
    <td>${avaliacao.id}</td>
    <td>${avaliacao.descricao}</td>
    <td>${avaliacao.peso}</td>
    <td>
        <a href="AvaliacaoServlet?action=visualizar&id=${avaliacao.id}" class="btn btn-success btn-sm"><i class="fas fa-eye "></i>Visualizar</a>
      <a href="javascript:void(0);" onclick="confirmarEdicao(${avaliacao.id}, '${avaliacao.descricao}', '${avaliacao.peso}')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i>Editar</a>
<a href="javascript:void(0);" onclick="confirmarExclusao(${estudante.nrMatricula}, '${estudante.nome}')" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Excluir</a>

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
function confirmarExclusao(id, descricao) {
    if (confirm("Deseja realmente excluir a avaliação com a descrição \"" + descricao + "\"?")) {
        window.location.href = "AvaliacaoServlet?action=confirmarExclusao&id=" + id;
    }
}
function confirmarEdicao(id) {
    // Redireciona para a página de edição com o ID da avaliação
    window.location.href = "AvaliacaoServlet?action=edit&id=" + id;
}

</script>

</body>
</html>
