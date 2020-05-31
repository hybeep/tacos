<%-- 
    Document   : direcciones
    Created on : 28/05/2020, 03:04:26 PM
    Author     : tutus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="user.UserActions"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                <td bgColor="cyan" width="290" align="center" >Eliminar

                </td>
                    <%
                    String prodlist = (String) session.getAttribute("prodlist");
                    String[] prods = prodlist.split(",");
                    Connection con = UserActions.getConnection();
                    Statement st = con.createStatement();
                    Statement st2 = con.createStatement();
                    ResultSet rs,rs2;
                    try{
                        for (int i = 0; i < prods.length ; i++) {
                            String q = "Select * from mtacos where id_mtacos="+prods[i];
                            String q2 = "Select * from dtacos where id_taco="+prods[i];
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
                        <form action="eliminarcarrito.jsp">
                            <input type="hidden" name="idprod" value="<%=rs.getInt(1)%>">
                            <input type="submit" value="Eliminar del carrito">
                        </form>
                     </td>

                 </tr>
            
                 <%
                     }
                    }
                        st.close();
                        con.close();
                    }catch(Exception e){
                        System.out.println("Error, Fallo de conexion con la BD");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                    }
                 %>
                    </table>
                 </section>
                <footer class="pie_de_pagina" id="pie_de_pagina">
                    <h4>Contactanos en</h4>
                    <h5>facebook</h5> 
                    <h5>twiter</h5>
                    <h5>instagram</h5>
                </footer>
        <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
