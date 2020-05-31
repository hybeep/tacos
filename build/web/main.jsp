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
                        <h1>Taco Master</h1>
                        <div align="center" width="200%" >
            <br>
            <h2>
                Consulta
            </h2>
            <br>
            <div align="left" width="200%" >
            </div>
            <br>
            <table border="1" borderColor="black">
                    
                </td>
                <td bgColor="cyan" width="290" align="center" >Nombre del Producto
                    
                </td>
                <td bgColor="cyan" width="290" align="center" >Precio
                    
                </td>
                <td bgColor="cyan" width="290" align="center" >Stock
                    
                </td>
                <td bgColor="cyan" width="230" align="center" >img
                    
                </td>
                <td bgColor="cyan" width="290" align="center" >Descripción
                    
                </td>
                <td bgColor="cyan" width="290" align="center" >Agregar

                </td>
                
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
                        while(rs.next() && rs2.next()){
 
                 %>
                 
                 <tr>
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(2) %> 
                     </td>
                     
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getFloat(2) %> 
                     </td>
                     
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getInt(3) %> 
                     </td>
                     
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getBlob(4) %> 
                     </td>
                     
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getString(7) %> 
                     </td>
                     
                     <td bgColor="lightgreen" valign="top" width="80" height="19" >
                        <form action="agregarcarrito.jsp">
                            <input type="hidden" name="idprod" value="<%=rs.getInt(1)%>">
                            <input type="submit" value="Agregar al carrito">
                        </form>
                     </td>

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
