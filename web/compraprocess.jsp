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
        <title>Ticket</title>
    </head>
    <body>
<%  
    //session
    int id_mu = (Integer)session.getAttribute("id");
    String prodlist = (String) session.getAttribute("prodlist");
   
    //tacoins
    Connection con = UserActions.getConnection();
    String q0 = "select * from musuario where id_mu="+id_mu;
    PreparedStatement ps0 = con.prepareStatement(q0);
    ResultSet rs0;
    rs0 = ps0.executeQuery();  
    double tacoins = 0;
    while (rs0.next()){
        tacoins= rs0.getDouble(11);
    }
   
    //fecha
    LocalDateTime locaDate = LocalDateTime.now();
    int hours  = locaDate.getHour();
    int minutes = locaDate.getMinute();
    int seconds = locaDate.getSecond();
    Calendar c = Calendar.getInstance();
    int dia = c.get(Calendar.DATE);
    int mes = c.get(Calendar.MONTH);
    int annio = c.get(Calendar.YEAR);
   
    //lista de productos ,precios, stock y tacoins
    String[] prods = prodlist.split(",");
    String[] lista=new String[prods.length];
    String[] cantidad=new String[prods.length];
    float[] precio = new float[prods.length];
    int[] stock = new int[prods.length];
   
    double totalp = 0;
   
    if (prodlist != null) {
        //nombre de los productos
        ResultSet rs;
        int i = 0;
        while (i < prods.length) {
            String q = "select * from mtacos where id_mtacos="+prods[i];
            PreparedStatement ps = con.prepareStatement(q);
            rs = ps.executeQuery();  
            while (rs.next()){
                lista [i] = rs.getString(2);
            }
            i++;
        }
       
        //cantidad por producto
        for (int e = 0; e < prods.length; e++) {
            cantidad[e] = request.getParameter("numero"+e);
        }
       
        //precio por taco
        i=0;
        while (i < prods.length) {
            String q = "select * from dtacos where id_taco="+prods[i];
            PreparedStatement ps = con.prepareStatement(q);
            rs = ps.executeQuery();  
            while (rs.next()){
                precio [i] = rs.getFloat(2);
            }
            i++;
        }
       
        //stock
        for (int p = 0; p < prods.length; p++) {
            String sql2 = "select * from dtacos where id_taco ="+prods[p];
            PreparedStatement ps4 = con.prepareStatement(sql2);
            ResultSet rs4;
            rs4 = ps4.executeQuery();
            while (rs4.next()){
                stock[p]  = rs4.getInt(3);
            }
        }
    }
   
        if (tacoins < totalp) {
              response.sendRedirect("billetera.jsp");
        }else{
            boolean ok = true;
           
            for (int i = 0; i < prods.length ; i++) {
                if(stock[i] < Integer.parseInt(cantidad[i])) {
                    ok = false;
                    break;
                }
            }
           
            if(ok){
                //actualiza tacoins
                tacoins -= totalp;
                String sql = "update musuario set tacoins_mu = "+tacoins+"where id_mu="+id_mu;
                PreparedStatement pst = con.prepareStatement(sql);
                pst.executeUpdate();
               
                //actualiza stock
                for (int i = 0; i < prods.length; i++) {
                    int nstock = stock[i] - Integer.parseInt(cantidad[i]);
                    String sql2 = "update dtacos set stock_taco = " + nstock + " where id_taco=" + prods[i];
                    PreparedStatement ps2 = con.prepareStatement(sql2);
                    ps2.executeUpdate();
                }
               
                //complementos seleccionados
                int z = Integer.parseInt(request.getParameter("z"));
                String complementos[] = new String[z];
                for (int r = 0; r < z; r++) {
                    if (request.getParameter("complementos_form"+r) != null){
                        complementos[r] = request.getParameter("nom_cc"+r);
                    }else{
                        complementos[r] = "0";
                    }
                }
               
                //suma precio cantidad
                int cantidadi = 0;
                float suma=0;
                for (int j = 0; j < precio.length; j++) {
                    suma += precio[j] * Integer.parseInt(cantidad[j]);
                }
                for (int i = 0; i < cantidad.length; i++) {
                    cantidadi += Integer.parseInt(cantidad[i]);
                }
                double iva = suma*.16;
                totalp = suma + iva;
                String fecha = annio+"/"+mes+"/"+dia+" "+hours+":"+minutes+":"+seconds;
               
                %>
                <h1>TacoMaster</h1>
                <h3>Fecha de la compra:</h3> <h4>&nbsp &nbsp<%=fecha%></h4>
                <h3>productos:</h3>
                <%
                //muestra los productos, precio y cantidad
                for (int i = 0; i < prods.length; i++) {
                %>
                <h3><%=cantidad[i]%> de <%=lista[i]%> : <%= precio[i]%>x<%=cantidad[i]%> = $<%= precio[i] * Integer.parseInt(cantidad[i]) %>   </h3>
                <%    
                }
                %>
                <p>---------------------------------</p>
                <h3>Subtotal &nbsp;&nbsp;&nbsp;&nbsp; <b>$<%=suma%></b></h3>
                <h3>IVA: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>$<%=iva%></b> </h3>
                <p>---------------------------------</p>
                <h3>Total: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>$<%=totalp%></b> </h3><br><br>
                <h3>complementos:</h3>
                <%
                for (int i = 0; i < complementos.length; i++) {
                    if (complementos[i] != "0") {
                   
                %>
                <h3>*<%=complementos[i]%></h3>
                <%
                    }
                }

            String sqle2 = "insert into mcarritotaco (id_mu,cant_mct,subtotal_mct,total_mct,fecha)"
                        + " values ("+id_mu+","+cantidadi+","+suma+","+totalp+","+fecha+")";
            PreparedStatement pse2 = con.prepareStatement(sqle2);

            pse2.executeUpdate();
            con.close();
               

                con.close();
            }else{
                response.sendRedirect("carrito.jsp");
            }
        }
%>
</html>