<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Visualizar Avaliação</title>
    <!-- Adicione aqui os links para os arquivos CSS do Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Se você precisa dos estilos, inclua os links CSS aqui -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="../css/Estudantes.css">
</head>
<body>
    <div class="container">
        <div class="text">
        Detalhes da Avaliação
    </div>
        
        <div class="row mt-4">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="descricao">Descrição:</label>
                    <!-- Use scriptlet para acessar os parâmetros passados na URL -->
                    <input type="text" class="form-control" id="descricao" value="<%= request.getParameter("descricao") %>" readonly>
                </div>
                <div class="form-group">
                    <label for="peso">Peso:</label>
                    <!-- Use scriptlet para acessar os parâmetros passados na URL -->
                    <input type="text" class="form-control" id="peso" value="<%= request.getParameter("peso") %>" readonly>
                </div>
                <a href="javascript:history.back()" class="btn btn-primary">Voltar</a>
            </div>
        </div>
    </div>

    <!-- Adicione aqui os scripts necessários, como o Bootstrap e o Font Awesome -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Adicione scripts personalizados aqui, se necessário
    </script>
</body>
</html>
