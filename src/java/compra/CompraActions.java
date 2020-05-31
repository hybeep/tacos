/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compra;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author tutus
 */
public class CompraActions {
    
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
    
    public static float getTacoinsById(int id){
        float status=0;
        ResultSet rs;
        
        try{
            Connection con = CompraActions.getConnection();
            String q = "select * from musuario where id_mu="+id;
            PreparedStatement ps = con.prepareStatement(q);
            rs = ps.executeQuery();  
            if (rs.next()) {
               status = rs.getFloat(11);
            }
            con.close();
        }catch(Exception e){
            System.out.println("Error, Fallo de conexion con la BD");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        
        return status;
    }
}
