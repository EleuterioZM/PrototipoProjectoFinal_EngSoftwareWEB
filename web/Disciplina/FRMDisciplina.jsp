<%-- 
    Document   : FRMDisciplina
    Created on : 11-May-2024, 16:49:33
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cadastrar Disciplina</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="../css/Estudantes.css">
</head>
<body>
<div class="container">
    <div class="text">
        Cadastro de Disciplina
    </div>
    <form action="#">
        <div class="form-row">
            <div class="input-data">
                <input type="text" required>
                <div class="underline"></div>
                <label for="">Nome da Disciplina</label>
            </div>
        </div>
        <div class="form-row">
            <div class="input-data">
                <input type="number" required>
                <div class="underline"></div>
                <label for="">Carga Horária Semanal (CHS)</label>
            </div>
            <div class="input-data">
                <input type="number" required>
                <div class="underline"></div>
                <label for="">Créditos</label>
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

