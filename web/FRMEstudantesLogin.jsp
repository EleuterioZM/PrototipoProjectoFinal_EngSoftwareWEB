<%-- 
    Document   : FRMEstudantesLogin
    Created on : 07-May-2024, 16:52:29
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
   
    <div class="bgimage_login"></div>

    <form id="formPost" action="insert" method="post" style="height: 29vw; width: 32vw;">

        <h3>L O G I N</h3>
        <label for="username">Username</label>
        <input type="text" name="username" id="username">
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        <button type="submit" id="btn">Log In</button>
        <p class="text-center mb-0" style="font-size: 12px; margin-top: -45px; margin-left:13vw; text-align: center;">
            Don't have an Account? <a href="FRMCadastrarEstudantes.jsp" link" style="margin-left: 20px;">Sign Up</a></p>


    </form>

    <script src="https://code.jquery.com/jquery-3.6.2.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>