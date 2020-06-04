<%-- 
    Document   : loginprocess
    Created on : 3/06/2020, 06:29:01 PM
    Author     : tutus
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="user.UserActions"%>
<%@page import="user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String email,password;
        password = request.getParameter("password");
        email = request.getParameter("correo");
        System.out.println(email + password);
        
            User e = new User();
            e.setEmail_mu(email);
            e.setPass_mu(password);

            int status=0;

            status = UserActions.Loguear(e);

            if (status > 0 ) {

                int id = UserActions.getIdByEmail(email);
                int lvl = UserActions.getNivelByEmail(email);
                session.setAttribute("id",id);
                System.out.println("datos sesion login"+session.getAttribute("email")+" "+session.getAttribute("id")+" "+session.getAttribute("nivel"));
                if (lvl == 1) {
                    session.setAttribute("nivel", lvl);
                    response.sendRedirect("mainadmins.jsp");
                }else{
                    session.setAttribute("email", email);
                    session.setAttribute("numlist",0);
                    response.sendRedirect("main.jsp");
                }

            }
%>
<html>
    <head>
        <title>error</title>
    </head>
    <body>
        <h1>Es probable que no estes registrado, <a href="registro.jsp">Registrate</a></h1>
    </body>
</html>

