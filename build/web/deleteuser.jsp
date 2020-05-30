<%-- 
    Document   : deleteuser
    Created on : 28/05/2020, 02:53:37 PM
    Author     : tutus
--%>

<%@page import="user.UserActions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = (String) session.getAttribute("email");
    int status=UserActions.EliminarCuenta(email);
    if (status > 0) {
        session.invalidate();
        response.sendRedirect("main.jsp"); 
    }else{
        out.println("<h>Error al eliminar su cuenta</h>");
    }
    
%>