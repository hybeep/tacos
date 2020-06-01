<%-- 
    Document   : agregarcarrito
    Created on : 31/05/2020, 10:29:12 AM
    Author     : tutus
--%>

<%@page import="java.util.Arrays"%>
<%@page import="user.UserActions"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int no = Integer.parseInt(request.getParameter("i"));
    String idpr = "idprod"+no; 
    int id=Integer.parseInt(request.getParameter(idpr));
    String prodlist = (String) session.getAttribute("prodlist");
    String prods[] = prodlist.split(",");
    session.removeAttribute("prodlist");
    for (int i = 0; i < prods.length; i++) {
        if (Integer.parseInt(prods[i]) == id) {
            prods[i]="0";
        }
    }
    prodlist = "";
    for (int i = 0; i < prods.length; i++) {
        if(i < prods.length-1){
            prodlist += Integer.parseInt(prods[i]) + ",";
        }else if(i == prods.length-1){
            prodlist += Integer.parseInt(prods[i]);
        }
        System.out.println("este es prodlist original y con for"+prodlist);
    }
    
    session.setAttribute("prodlist",prodlist);
    response.sendRedirect("carrito.jsp");
%>

