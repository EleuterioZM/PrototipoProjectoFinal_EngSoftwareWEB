<%-- 
    Document   : FRMAdminLogin
    Created on : 07-May-2024, 17:51:41
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="css/forms.css" rel="stylesheet">
    <title>Cadastro de Usuarios</title>




</head>

<body>
   
    <div class="bgimage_login admin-bg"></div>

    <form id="formPost" action="insert" method="post" style="height: 35vw; width: 32vw;">

        <h3>L O G I N </h3>
        <label for="username">Username</label>
        <input type="text" name="username" id="username">
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        
        <select class="form-select" id="usertype" name="usertype" style="color: white; background-color: rgba(255, 255, 255, 0.13); border: 1px solid white; border-radius: 5px;">
              <option value="" selected disabled hidden>Tipo de usuario</option>
            <option value="administrador" style="background-color: rgba(0, 128, 0, 0.7); color: white;">Administrador</option>
            <option value="aluno" style=" background-color:  rgba(0, 128, 0, 0.7); color: white;">Aluno</option>
        </select>
   
        <button type="submit" id="btn">Log In</button>
       <p class="text-center mb-0" style="font-size: 12px; margin-top: -45px; margin-left:13vw; text-align: center;">
           Don't have an Account? <a href="FRMCadastro.jsp" style="margin-left: 20px;" class="link">Sign Up</a></p>

    
   
    </form>
    <a href="index.jsp" style="position: fixed; top: 20px; left: 20px; z-index: 9999;">
    <i class="fas fa-arrow-right" style="font-size: 24px; color: white;"></i>
</a>
   

    <script src="https://code.jquery.com/jquery-3.6.2.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   
<script>
    // Verifica se o parâmetro adminClicked está presente na URL
    const urlParams = new URLSearchParams(window.location.search);
    const adminClicked = urlParams.get('adminClicked');
    
    // Log para verificar se o parâmetro adminClicked foi detectado corretamente
    console.log('adminClicked:', adminClicked);
    
    // Se o parâmetro adminClicked estiver presente, muda a imagem de fundo
    if (adminClicked === 'true') {
        console.log('Changing background image...');
        document.querySelector('.bgimage_login.admin-bg').style.backgroundImage = "url('images/aerial-view-business-team.jpg')";
    }
</script>



</body>

</html>