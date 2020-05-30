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
                    ResultSet rs,rs2;
                    try{
                        session.getAttribute("id");

                        int i = 1;
                        String q = "Select * from mtacos";
                        rs = st.executeQuery(q);
                        String q2 = "Select * from dtacos";
                        rs2 = st.executeQuery(q2);
                     
                        while(rs.next()){
 
                            if(i == (i/2)*2){
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
                        <form action="">
                            <input type="submit" value="Eliminar">
                        </form>
                     </td>

                 </tr>
                 
                 <% 
                        }else{%>
                         
                        
                   <tr>
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(1) %> 
                         
                     </td>
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(3) %> 
                         
                     </td>
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(4) %> 
                         
                     </td>
                    <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(5) %> 
                         
                     </td>
                    <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(7) %> 
                         
                     </td>
                    <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(10) %> 
                         
                     </td>

                 </tr>
                        
                <%         }
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
        <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
