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
        <%  
            if(session.getAttribute("nivel") != null){
        %>
        <section class="fondo" id="fondo">
            <header class="cabecera" id="cabecera">
                <h1>TACO MASTER®</h1>
            </header>
            <nav class="navegacion" id="navegacion">
                <ul>
                    <li><a href="mainadmins.jsp">Productos</a></li>
                    <li><a href="users.jsp">Usuarios</a></li>
                    <li><a href="insertarproducto.jsp">Agregar Productos</a></li>
                    <li>
                        <form action="LogoutUser">
                        <input type="submit" value="Cerrar sesion">
                        </form>
                    </li>
                </ul>
            </nav>
            
            <form >
                <input type="submit" placeholder="Ver los productos">
            </form>
                
            
        </section> 
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
                <tbody>
                <td bgColor="cyan" width="150" align="center" >id
                    
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
                    Connection con = UserActions.getConnection();
                    Statement st = con.createStatement();
                    Statement st2 = con.createStatement();
                    ResultSet rs,rs2;
                    try{
                        String q = "Select * from mtacos";
                        String q2 = "Select * from dtacos";
                        rs = st.executeQuery(q);
                        rs2 = st2.executeQuery(q2);
                        int i=0;
                        while(rs.next() && rs2.next()){
 
                 %>
                 
                 <tr>
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getInt(1) %> 
                     </td>
                     
                     
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
                        <form action="borrarproducto.jsp">
                            <input type="hidden" name="idhide" value="<%=rs.getInt(1)%>">
                            <input type="submit" value="Eliminar">
                        </form>
                     </td>

                 </tr>
                 
                 <% 
                        i+=1;
                        }
                        System.out.println(i);
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
        <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
