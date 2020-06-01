<%-- 
    Document   : main.jsp
    Created on : 26/05/2020, 12:35:05 AM
    Author     : PorfirioDamián
--%>

<%@page import="user.UserActions"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    <script>
        function unableButton(no) {
            var form = "form"+no;
            var add = "add"+no;
            document.getElementById(add).disabled = true; 
            if(document.getElementById(add).disabled === true){
                document.getElementById(form).submit();
            }
        }
    </script>
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
                    <h3>La historia de los tacos</h3>
                    <h4>La historia de los tacos
                        <center>Se dice que Moctezuma utilizaba la tortilla como una “cuchara” para sostener la comida, las cuales eran preparadas sobre piedras calientes y decoradas con cochinilla, frijol y chile. Mientras que las mujeres solían enviar la comida, en tortillas, a los hombres que trabajaban largas horas en el campo y así pudieran calentarla y comerla a la media jornada. 

                        Y para la llegada de las carabelas españolas y sus cerdos, según Bernal Díaz del Castillo, los banquetes organizados por Hernán Cortés para sus soldados se basaban en platillos de carne de cerdo con tortillas. De hecho, en Historia Verdadera de la Conquista de la Nueva España, Coyoacán fue testigo de la primera taquiza en la historia. Desde ese entonces, el taco se convirtió en el platillo base que se consumía en todas zonas de la Conquista. </center></h4>
                    <p>Los tacos saben bien rico UwU</p>
                </aside>

                <div align="center" width="200%" >
                    <h1>Taco Master</h1>
            <br>
            <h2>
                Consulta
            </h2>
            <br>
            <div align="left" width="200%" >
            </div>
            <br>
            <table border="1" borderColor="black">
            <tbody>
               
                <th  width="290" align="center" >Nombre del Producto
                    
                </th>
                <th  width="290" align="center" >Precio
                    
                </th>
                <th  width="290" align="center" >Stock
                    
                </th>
                <th  width="230" align="center" >img
                    
                </th>
                <th  width="290" align="center" >Descripción
                    
                </th>
                <th  width="290" align="center" >Agregar

                </th>
                
                <% 
                    Connection con = UserActions.getConnection();
                    Statement st = con.createStatement();
                    Statement st2 = con.createStatement();
                    ResultSet rs,rs2;
                    try{
                        String q = "Select * from mtacos";
                        String q2 = "Select * from dtacos";
                        rs = st.executeQuery(q);
                        rs2 = st2.executeQuery(q2);
                        int i =1;
                        while(rs.next() && rs2.next()){
                            String form = "form"+i;
                            String id = "id"+i;
                            String add = "add"+i;
 
                 %>
                 
                 <tr>
                     <td valign="top" width="80" height="19" ><%=rs.getString(2) %> 
                     </td>
                     
                     <td valign="top" width="80" height="19" ><%=rs2.getFloat(2) %> 
                     </td>
                     
                     <td valign="top" width="80" height="19" ><%=rs2.getInt(3) %> 
                     </td>
                     
                     <td valign="top" width="80" height="19" ><%=rs2.getBlob(4) %> 
                     </td>
                     
                     <td valign="top" width="80" height="19" ><%=rs2.getString(7) %> 
                     </td>
                     
                     <td valign="top" width="80" height="19" >
                        <form id="<%=form%>" action="agregarcarrito.jsp">
                            <input type="hidden" name="<%=id%>" id="<%=id%>" value="<%=rs.getInt(1)%>">
                            <input type="hidden" name="i" id="<%=i%>" value="<%=i%>">
                            <input type="button" value="Agregar al carrito" id="<%=add%>" onclick="unableButton(<%=i%>) " >
                        </form>
                     </td>

                 </tr>
                 
                 <% 
                     i++;
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