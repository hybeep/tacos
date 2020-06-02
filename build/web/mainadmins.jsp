<%-- 
    Document   : main.jsp
    Created on : 29/05/2020, 05:27:57 PM
    Author     : tutus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserActions"%>
<%@page language="java" import="java.sql.*"%>
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
        <% if(session.getAttribute("nivel") != null){
        %>
        <section class="fondo" id="fondo">
            <section class="cabeza">
                <header class="cabecera" id="cabecera">
                    <h1>TACO MASTER®</h1>
                </header>
                <nav class="navegacion" id="navegacion">
                    <ul>
                        <li><a href="mainadmins.jsp">Productos</a></li>
                        <li><a href="users.jsp">Usuarios</a></li>

                        <li>
                            <form action="LogoutUser">
                                <input type="submit" value="Cerrar sesion">
                            </form>
                        </li>
                    </ul>
                </nav>
            </section>
            <section class="cuerpo" id="cuerpo">
                <center>
                    <div>
                        <form action="Controler" method="POST">
                            <input type="submit" name="action" value="Ver Productos">
                            <!---<li><a href="insertarproducto.jsp">Agregar Productos</a></li>--->
                            <input type="submit" name="action" value="Agregar Productos">
                        </form>
                        <hr>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>IMG</th>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Precio</th>
                                    <th>Stock</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="i" begin="0" end="${lista.size()}">
                                    <tr><c:out value="${lista.get(i).getPrecio()}"/>
                                        <p name="id" value="${lista.get(i).getId_dprod()}" style="display: none;"></p>
                                        <td>${lista.get(i).getId_dprod()}</td>
                                        <td><img src="ControlerImg?id=${lista.get(i).getId_dprod()}" width="150" height="100"></td>
                                        <td>${lista.get(i).getNom_prod()}</td>
                                        <td>${lista.get(i).getDescripcion_prod()}</td>
                                        <td>${lista.get(i).getPrecio()}</td>
                                        <td>${lista.get(i).getStock()}</td>
                                        <td>
                                            <form action="Controler" method="POST">
                                                <input type="hidden" name="idhide" value="${lista.get(i).getId_dprod()}">
                                                <input type="hidden" name="idmhide" value="${lista.get(i).getId_mprod()}">
                                                <input type="submit" value="Eliminar">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </center>
            </section>
            <section class="abajo" id="abajo">
                <footer class="pie_de_pagina" id="pie_de_pagina">
                    <h4>Contactanos en</h4>
                    <h5>facebook</h5> 
                    <h5>twiter</h5>
                    <h5>instagram</h5>
                </footer>
            </section>
        </section>
         <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
