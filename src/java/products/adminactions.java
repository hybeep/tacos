/**
 *
 * @author tutus
 */
package products;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import products.Producto;


public class adminactions {
   
    public static Connection getConnection(){
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
        return con;
    }
   
    public static int AgregarProd(Producto e){
        int status = 0;
        try{
            Connection con = adminactions.getConnection();
           
            String q = "insert into mtacos (nom_prod) values ('"+e.getNom_prod()+"')";
            String q2 = "insert into dtacos (precio_taco,stock_taco,img_taco) value("+e.getPrecio() +","+e.getStock()+",x'"+e.getImg()+"')";
           
            PreparedStatement ps = con.prepareStatement(q);
           
            status = ps.executeUpdate();
            con.close();
       
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
       
        }
        System.out.println(status);
        return status;
    }
}