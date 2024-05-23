<%-- 
    Document   : index
    Created on : 07-May-2024, 12:33:39
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Sistema de Gestão de Matrícula</title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
         <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    </head>

    <body>
        <div class="hero_area">
            <!-- header section strats -->
            <header class="header_section">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container">
                        <a class="navbar-brand" href="index.html">
                            <span>
                              <span class="material-icons-outlined">school</span>   Sistema de Gestão de Estudantes
                            </span>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  ">
                                <li class="nav-item active">
                                    <a class="nav-link" href="index.html">Página Inicial <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="cursos.html"> Cursos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="alunos.html">Alunos </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="matriculas.html"> Matrículas </a>
                                </li>
                            </ul>
                            <div class="user_option">
                                <a href="">
                                    <span>
                                        Login
                                    </span>
                                </a>
                                <form class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0">
                                    <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
                                </form>
                            </div>
                        </div>
                        <div>
                            <div class="custom_menu-btn ">
                                <button>
                                    <span class=" s-1">

                                    </span>
                                    <span class="s-2">

                                    </span>
                                    <span class="s-3">

                                    </span>
                                </button>
                            </div>
                        </div>

                    </nav>
                </div>
            </header>
            <!-- end header section -->
            <!-- slider section -->
            <section class="slider_section ">
                <div class="carousel_btn-container">
                    <!-- Remova os ícones de navegação -->
                </div>
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <!-- Remova os indicadores de slide -->
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-5 offset-md-1">
                                        <div class="detail-box">
                                            <h1>
                                                Matricule-se Agora
                                            </h1>
                                            <p>
                                                Encontre os melhores cursos e matricule-se hoje mesmo.
                                            </p>
                                            <div class="btn-box">
                                                <a href="FRMCadastro.jsp" class="btn-1">
                                                    Estudantes
                                                </a>

                                                <a href="FRMLogin.jsp?adminClicked=true" id="adminBtn" class="btn-2">
                                                    Administradores
                                                </a>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="offset-md-1 col-md-4 img-container">
                                        <div class="img-box" style="margin-left: 4.5vw; width: 600px; height: 500px; margin-top: 15px;">
                                            <img src="images/joyful-black-author-works-writing-new-book-readers.png" width="auto" height="auto" alt="">

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Adicione mais slides conforme necessário -->
                    </div>

                </div>

            </section>
            <!-- end slider section -->
        </div>


        <!-- experience section -->

        <section class="experience_section layout_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="img-box">
                            <img src="images/experience-img.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="detail-box">
                            <div class="heading_container">
                                <h2>
                                    Os Melhores Cursos Disponíveis
                                </h2>
                            </div>
                            <p>
                                Explore nossa ampla seleção de cursos e comece a aprender hoje mesmo.
                            </p>
                            <div class="btn-box">
                                <a href="" class="btn-1">
                                    Ver Todos os Cursos
                                </a>
                                <a href="" class="btn-2">
                                    Matricular-se
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>


        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/custom.js"></script>


    </body>
</body>

</html>

