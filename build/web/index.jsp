<%-- 
    Document   : index
    Created on : 26/05/2020, 12:33:18 AM
    Author     : PorfirioDamián
--%>

<%@page import="user.User"%>
<%@page import="user.UserActions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/master.css">
    <script src="js/master.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taco Master Log</title>
</head>
    <body>
        <section class="fondo" id="fondo">
            <header class="cabecera" id="cabecera">
                <h1>TACO MASTER®</h1>
            </header>
                <nav class="navegacion" id="navegacion">
                    <ul>
                        <li><img src="multimedia/logo.png" heigth="40" width="160"></li>
                        <li><a href="registro.jsp">Registrarse</a></li>
                    </ul>
                </nav>
        </section> 
        <section class="log" id="log">
            <label for="" class="tacos">
                <p>La historia del taco</p>
                <center>Se dice que Moctezuma utilizaba la tortilla como una “cuchara” para sostener la comida, las cuales eran preparadas sobre piedras calientes y decoradas con cochinilla, frijol y chile. Mientras que las mujeres solían enviar la comida, en tortillas, a los hombres que trabajaban largas horas en el campo y así pudieran calentarla y comerla a la media jornada. 

                        Y para la llegada de las carabelas españolas y sus cerdos, según Bernal Díaz del Castillo, los banquetes organizados por Hernán Cortés para sus soldados se basaban en platillos de carne de cerdo con tortillas. De hecho, en Historia Verdadera de la Conquista de la Nueva España, Coyoacán fue testigo de la primera taquiza en la historia. Desde ese entonces, el taco se convirtió en el platillo base que se consumía en todas zonas de la Conquista. </center></h4>
                    <p>Los tacos saben bien rico UwU</p>
            </label>
            <label for="" class="log_in">

                <img class="logo" src="multimedia/logo.png" heigth="50" width="200">
                <h1>Iniciar Sesion</h1>
                <form action="" method="post">
                    
                    <%
                            String email,password;
                            password = request.getParameter("password");
                            email = request.getParameter("correo");
                            System.out.println(email + password);

                            User e = new User();
                            e.setEmail_mu(email);
                            e.setPass_mu(password);
                            
                            int status=0;
                            
                            if (request.getParameter("log")!=null){
                                 status = UserActions.Loguear(e);
                            }

                           
                            

                            if (status > 0 && request.getParameter("log")!=null) {
                                
                                int id = UserActions.getIdByEmail(email);
                                int lvl = UserActions.getNivelByEmail(email);
                                session.setAttribute("id",id);
                                System.out.println("datos sesion login"+session.getAttribute("email")+" "+session.getAttribute("id")+" "+session.getAttribute("nivel"));
                                if (lvl == 1) {
                                    session.setAttribute("nivel", lvl);
                                    
                                    response.sendRedirect("mainadmins.jsp");
                                }else{
                                    session.setAttribute("email", email);
                                    session.setAttribute("numlist",0);
                                    response.sendRedirect("main.jsp");
                                }
                                    
                            }else if (request.getParameter("log")!=null){
                                out.println("<h>Contraseña o correo invalidos</h><br>");
                            }
                    %>
                    <!---Usuario--->
                    <label class="titulos" for="email">Correo</label>
                    <input type="text" name="correo" placeholder="Ingresa el Correo">
                    <!---Contraseña--->
                    <label class="titulos" for="contra">Contraseña</label>
                    <input type="password" name="password" placeholder="Ingresa la contraseña">
        
                    <input type="submit" name="log" value="Iniciar" onclick="log())">
                    <a class="link-a" href="#">¿Olvidaste tu contraseña?</a><br>
                    <a class="link-a" href="#">¿No te has registrado aun?</a>
                </form>

                    

            </label>
            
        </section>
        <footer class="pie_de_pagina" id="pie_de_pagina">
            <h4>Contactanos en</h4>
            <h5>facebook</h5> 
            <h5>twiter</h5>
            <h5>instagram</h5>
        </footer>
    </body>
</html>
