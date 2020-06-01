package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author PorfirioDamián
 */

public class Conexion {
    
    Connection con;
    
    public Connection getConexion(){
        
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
    
}
