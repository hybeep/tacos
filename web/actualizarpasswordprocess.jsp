<%-- 
    Document   : actualizarpasswordprocess
    Created on : 28/05/2020, 02:34:15 PM
    Author     : tutus
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="user.UserActions"%>
<%@page import="user.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String email, password_actual, password_nueva;
            email = (String) session.getAttribute("email");
            password_actual = request.getParameter("pass_a");
            password_nueva = request.getParameter("pass_n");
            System.out.println("email"+email+"password"+password_actual+"nueva"+password_nueva);
            
            String url, userName, password;
            url="jdbc:mysql://127.0.0.1:3306/tacomaster_db?verifyServerCertificate=false&useSSL=true";
            userName="root";
            password="root";
            Connection con = null;
            try{
                Class.forName("com.mysql.jdbc.Driver"); 
                con = DriverManager.getConnection(url,userName,password);
                System.out.println("Se conecto a la BD");
            }catch(Exception e){
                System.out.println("No se conecto a la BD");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
            
            String q = "select * from musuario "
                    + "where email_mu = ? and pass_mu = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, email);
            ps.setString(2, password_actual);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User e = new User();
                e.setEmail_mu(email);
                e.setPass_mu(password_nueva);
                int status = UserActions.ActualizarPassword(e);

                if (status > 0) {
                    response.sendRedirect("profile.jsp");
                }else{
                    out.println("<h>Error al modificar su contraseña</h>"
                            + "<p>vuelva a intentarlo en su <a href=='profile.jsp'>perfil</a><p>");
                }
            }
            con.close();
        %>