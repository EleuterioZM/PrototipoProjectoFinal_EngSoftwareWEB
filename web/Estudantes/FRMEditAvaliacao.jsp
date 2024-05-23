<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Editar Avaliação</title>
    <!-- Se você precisa dos estilos, inclua os links CSS aqui -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="../css/Estudantes.css">
</head>
<body>

<div class="container">
    <div class="text">
        Edição de Avaliação
    </div>
    <form action="/Projecto_EngSoftware/AvaliacaoServlet?action=update" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <div class="form-row">
            <div class="input-data">
                <input type="text" required name="descricao" value="${param.descricao}">
                <div class="underline"></div>
                <label for="">Descrição</label>
            </div>
            <div class="input-data">
                <input type="number" step="0.01" name="peso" required value="${param.peso}">
                <div class="underline"></div>
                <label for="">Peso</label>
            </div>
        </div>
        <div class="form-row submit-btn">
            <div class="input-data">
                <div class="inner"></div>
                <input type="submit" value="Salvar Alterações">
            </div>
        </div>
    </form>
</div>

</body>
</html>
