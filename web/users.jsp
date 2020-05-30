<%-- 
    Document   : users.jsp
    Created on : 30/05/2020, 12:20:45 PM
    Author     : PorfirioDamián
--%>
<%@page import="user.UserActions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/master.css">
        <script></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <section class="fondo" id="fondo">
            <header class="cabecera" id="cabecera">
                <h1>TACO MASTER®</h1>
            </header>
                <nav class="navegacion" id="navegacion">
                    <ul>
                        <li><a href="mainadmins.jsp">Menú</a></li>
                        <li><a href="users.jsp">Usuarios</a></li>
                    </ul>
                </nav>
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
                <td bgColor="cyan" width="290" align="center" >Nombre
                    
                </td>
                <td bgColor="cyan" width="290" align="center" >Apellido Paterno
                    
                </td>
                <td bgColor="cyan" width="290" align="center" >Apellido Materno
                    
                </td>
                <td bgColor="cyan" width="230" align="center" >Correo
                    
                </td>
                <td bgColor="cyan" width="290" align="center" >Celular
                    
                </td>
                
                <% 
                    Connection con = UserActions.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs;
                    try{
                        session.getAttribute("id");

                        int i = 1;
                        String q = "Select * from musuario where nivel_mu = 2 order by nom_mu ASC";
                        rs = st.executeQuery(q);
                        
                     
                        while(rs.next()){
 
                            if(i == (i/2)*2){
                 %>
                 
                 <tr>
                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getInt(1) %> 
                         
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
    </body>
</html>
