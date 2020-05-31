<%-- 
    Document   : main.jsp
    Created on : 26/05/2020, 12:35:05 AM
    Author     : PorfirioDamián
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="css/master.css">
        <script></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <% if(session.getAttribute("email") != null){ 
        %>
        <section class="fondo" id="fondo">
            <section class="cabeza">
                <header class="cabecera" id="cabecera">
                    <h1>TACO MASTER®</h1>
                </header>
                    <nav class="navegacion" id="navegacion">
                        <ul>
                            <li><a href="main.jsp">Pagina principal</a></li>
                            <li><a href="billetera.jsp">TACOin</a></li>
                            <li><a href="carrito.jsp">Mi Carrito</a></li>
                            <li><a href="profile.jsp">Mi perfil</a></li>
                            <li>
                                <form action="LogoutUser">
                                    <input type="submit" value="Cerrar sesion">
                                </form>
                            </li>
                        </ul>
                    </nav>
                </section>
            
                <section class="cuerpo" id="cuerpo">
                    <aside class="lateral_izquierdo" id="lateral_izquierdo">
                        <h4>La historia de los tacos
                            <center>Se dice que Moctezuma utilizaba la tortilla como una “cuchara” para sostener la comida, las cuales eran preparadas sobre piedras calientes y decoradas con cochinilla, frijol y chile. Mientras que las mujeres solían enviar la comida, en tortillas, a los hombres que trabajaban largas horas en el campo y así pudieran calentarla y comerla a la media jornada. 

Y para la llegada de las carabelas españolas y sus cerdos, según Bernal Díaz del Castillo, los banquetes organizados por Hernán Cortés para sus soldados se basaban en platillos de carne de cerdo con tortillas. De hecho, en Historia Verdadera de la Conquista de la Nueva España, Coyoacán fue testigo de la primera taquiza en la historia. Desde ese entonces, el taco se convirtió en el platillo base que se consumía en todas zonas de la Conquista. </center></h4>
                        <p>Los tacos saben bien rico UwU</p>
                    </aside>
                    <section class="productos" id="productos">
                        <h1>Taco Master</h1>
                    </section>
                    <aside class="lateral_derecho" id="lateral_derecho">
                        <h4>Aqui no se que poner</h4>
                    </aside>
                </section>
                <footer class="pie_de_pagina" id="pie_de_pagina">
                    <h4>Contactanos en</h4>
                    <h5>facebook</h5> 
                    <h5>twiter</h5>
                    <h5>instagram</h5>
                </footer>
        </section> 
        <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
