<%-- 
    Document   : profile
    Created on : 28/05/2020, 12:21:26 AM
    Author     : tutus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body>
        <% if(session.getAttribute("email") != null){ 
        %>
        <section class="fondo" id="fondo">
            <header class="cabecera" id="cabecera">
                <h1>TACO MASTER®</h1>
            </header>
                <nav class="navegacion" id="navegacion">
                    <ul>
                        <li><a href="main.jsp">Pagina principal</a></li>
                        <li><a href="billetera.jsp">TACOin</a></li>
                        <li><a href="carrito.jsp">Mi Carrito</a></li>
                        <li><a href="profile.jsp">Mi perfil</a></li>
                        <form action="LogoutUser">
                            <input type="submit" value="Cerrar sesion">
                        </form>
                    </ul>
                </nav>
                <section class="cuerpo" id="cuerpo">
                    <aside class="lateral_izquierdo" id="lateral_izquierdo">
                        <ul>
                            <p>Perfil</p>
                            <li><a href="profile.jsp">Mi Perfil</a></li>
                            <li><a href="direcciones.jsp">Direcciones Guardadas</a></li>
                            <li><a href="historial.jsp">Historial de Compras</a></li>
                    </ul>
                    </aside>
                    <section class="productos" id="productos">
                        <h1>Informacion Personal</h1>
                        <form action="deleteuser.jsp" method="post">
                            <input type="submit" value="Eliminar tu cuenta">
                        </form>
                        <form action="actualizarpasswordprocess.jsp" method="post">
                            <input type="password" name='pass_a' placeholder="Escribe tu Contraseña">
                            <input type="password" name='pass_n' placeholder="Tu Nueva Contraseña">
                            <input type="submit" value="Modificar tu Contraseña">
                        </form>
                    </section>
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
