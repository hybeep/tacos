<%--
    Document   : historial
    Created on : 28/05/2020, 03:04:26 PM
    Author     : tutus & PorfirioDamián
--%>

<%@page import="user.DireccionActions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.Direccion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserActions"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial</title>
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
                        <li>
                            <form action="LogoutUser">
                                <input type="submit" value="Cerrar sesion">
                            </form>
                        </li>
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
                           
                        <table border="1" borderColor="black">
                                <tbody>
                                <th width="150" align="center" >Cantidad comprada

                                </th>
                                <th width="290" align="center" >Subtotal

                                </th>
                                <th width="290" align="center" >Total

                                </th>
                                <th width="290" align="center" >Fecha
                                <%
                                    String id_mu = (String) session.getAttribute("id");
                                    Connection con = UserActions.getConnection();
                                    Statement st = con.createStatement();
                                    ResultSet rs,rs2;
                                    try{
                                        int i = 0;
                                        String q = "Select * from mcarritotaco where id_mu = "+id_mu;
                                        rs = st.executeQuery(q);
                                        while(rs.next()){

                                       
                                 %>

                                 <tr>
                                     

                                     <td valign="top" width="80" height="19" ><%=rs.getInt(2) %>

                                     </td>
                                     <td valign="top" width="80" height="19" ><%=rs.getFloat(3) %>

                                     </td>
                                     <td valign="top" width="80" height="19" ><%=rs.getFloat(4) %>

                                     </td>
                                    <td valign="top" width="80" height="19" ><%=rs.getDate(5) %>

                                 </tr>


                                <%        
                                        }

                                            rs.close();
                                            st.close();
                                            con.close();

                                    }catch(Exception e){
                                        System.out.println("Error, Fallo de conexion con la BD");
                                        System.out.println(e.getMessage());
                                        System.out.println(e.getStackTrace());
                                    }

                                %>

                                </tbody>

                            </table>


                        </div>
                       
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