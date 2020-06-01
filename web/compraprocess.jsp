

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="user.UserActions"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>TacoMaster</h1>
        <h2>Productos:</h2>
<%
    String prodlist = (String) session.getAttribute("prodlist");
    int id_mu = (Integer)session.getAttribute("id");
    
    LocalDateTime locaDate = LocalDateTime.now();
    int hours  = locaDate.getHour();
    int minutes = locaDate.getMinute();
    int seconds = locaDate.getSecond();
    Calendar c = Calendar.getInstance();
    int dia = c.get(Calendar.DATE);
    int mes = c.get(Calendar.MONTH);
    int annio = c.get(Calendar.YEAR);
    
    String[] prods = prodlist.split(",");
    String[] lista=new String[prods.length];
    if (prodlist != null) {
        Connection con = UserActions.getConnection();
        ResultSet rs;
        int i = 0;
        while (i < prods.length) {
            String q = "select * from mtacos where id_mtacos="+prods[i];
            PreparedStatement ps = con.prepareStatement(q);
            rs = ps.executeQuery();  
            while (rs.next()){
                lista [i] = rs.getString(2);
            %>
            <p>&nbsp &nbsp &nbsp &nbsp *<%=lista[i]%> </p>
            
           <% }
            i++;
        }%>
        <h2>Total a pagar:</h2>
        <%float[] precio = new float[prods.length];
        i=0;
        while (i < prods.length) {
            String q = "select * from dtacos where id_taco="+prods[i];
            PreparedStatement ps = con.prepareStatement(q);
            rs = ps.executeQuery();  
            while (rs.next()){
                precio [i] = rs.getFloat(2);
                System.out.println("array perecio"+precio);
            %>
            <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp *$<%=precio[i]%> </p>
           <% }
            i++;
        }
        int suma=0;
        for (int j = 0; j < precio.length; j++) {
            suma += precio[j];
        }
        double iva = suma*.16;
        double totalp = suma+iva;
        %>
<p>---------------------------</p>
<p>Subtotal:&nbsp &nbsp &nbsp &nbsp$<%=suma%></p>
<p>IVA: &nbsp &nbsp &nbsp &nbsp &nbsp $<%=iva%>
<p>---------------------------</p>
<p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbspTotal:<%=totalp%></p>
<%
con.close();
    }
%> 
<h2>Fecha de la compra:</h2> <p>&nbsp &nbsp<%=annio%>/<%=mes%>/<%=dia%> &nbsp &nbsp <%=hours%>:<%=minutes%>:<%=seconds%></p>

</html>
