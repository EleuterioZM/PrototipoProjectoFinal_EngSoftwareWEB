<%-- 
    Document   : FRMCurso
    Created on : 11-May-2024, 16:47:26
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cadastrar Curso</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="../css/Estudantes.css">
</head>
<body>
<div class="container">
    <div class="text">
        Cadastro de Curso
    </div>
    <form action="${pageContext.request.contextPath}/CursoServlet?action=insert" method="post">
        <div class="form-row">
            <div class="input-data">
                <input type="text" name="nome" required>
                <div class="underline"></div>
                <label for="nome">Nome do Curso</label>
            </div>
        </div>
        <div class="form-row submit-btn">
            <div class="input-data">
                <div class="inner"></div>
                <input type="submit" value="Cadastrar">
            </div>
        </div>
    </form>
    <%--<p>${message}</p>
    <a href="${pageContext.request.contextPath}/CursoServlet">Voltar à lista</a>--%>
</div>
</body>
</html>
