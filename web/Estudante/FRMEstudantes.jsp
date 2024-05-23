<%-- 
    Document   : FRMEstudantes
    Created on : 11-May-2024, 16:52:47
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cadastrar Estudante</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="../css/Estudantes.css">
</head>
<body>
<div class="container">
    <div class="text">
        Cadastro de Estudante
    </div>
    <form action="/Projecto_EngSoftware/EstudanteServlet?action=add" method="post">
    <div class="form-row">
        <div class="input-data">
            <input type="text" name="nome" required>
            <div class="underline"></div>
            <label for="nome">Nome</label>
        </div>
        <div class="input-data">
            <input type="text" name="apelido" required>
            <div class="underline"></div>
            <label for="apelido">Apelido</label>
        </div>
    </div>
    <div class="form-row">
        <div class="input-data">
            <input type="text" name="endereco" required>
            <div class="underline"></div>
            <label for="endereco">Endereço</label>
        </div>
        <div class="input-data">
            <input type="text" name="contacto" required>
            <div class="underline"></div>
            <label for="contacto">Contacto</label>
        </div>
    </div>
    <div class="form-row submit-btn">
        <div class="input-data">
            <div class="inner"></div>
            <input type="submit" value="Cadastrar">
        </div>
    </div>
</form>

</div>
</body>
</html>

