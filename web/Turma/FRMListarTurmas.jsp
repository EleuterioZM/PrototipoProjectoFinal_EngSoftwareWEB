<%@page import="Model.Turma"%>
<%@page import="DAO.TurmaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listagem de Turmas</title>
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
        <h1 class="mt-4">Listagem de Turmas</h1>
        <div scope="col" class="text-right">
          <a href="${pageContext.request.contextPath}/Turma/FRMTurma.jsp" class="btn btn-success">Adicionar Turma</a>

        </div>
        <table class="table table-striped mt-4 table-dark">
           <thead>
               <tr>
                   <th scope="col">#</th>
                   <th scope="col">ID</th>
                   <th scope="col">Nome da Turma</th>
                   <th scope="col">Ações</th>
               </tr>
           </thead>
           <tbody>
              <%
                      int count = 0;
                        TurmaDAO turmaDAO = new TurmaDAO();
                        for (Turma turma : turmaDAO.listarTurmas()) {
                         
                          count ++;
                      
                        
                         
                          
                    %>
                    
                   <tr>
                     <td> <%out.print(count);%></td>
                       
                       <td><%=turma.getId()%></td>
                        <td><%=turma.getNome()%></td>
                       <td>
                           <a href="javascript:void(0);" onclick="editarTurma(<%=turma.getId()%>, '<%=turma.getId()%>')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                           <a href="javascript:void(0);" onclick="excluirTurma(<%=turma.getId()%>, '<%=turma.getNome()%>')" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> </a>
                       </td>
                   </tr>
                 <%}%>
           </tbody>
        </table>
    </div>
    <!-- Adicione aqui os scripts necessários, como o Bootstrap e o Font Awesome -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function excluirTurma(id, nome) {
            if (confirm("Deseja realmente excluir a turma \"" + nome + "\"?")) {
                window.location.href = "${pageContext.request.contextPath}/TurmaServlet?action=delete&id=" + id;
            }
        }
        function editarTurma(id) {
            // Redireciona para a página de edição com o ID da turma
            window.location.href = "${pageContext.request.contextPath}/TurmaServlet?action=edit&id=" + id;
        }
    </script>
</body>
</html>
