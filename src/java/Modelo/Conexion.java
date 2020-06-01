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
        
        try{
        
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tacomaster_db", "root", "root");
        
        }catch(Exception e){
        
            System.out.println("Error al conectar la base de datos Conexion.java");
        
        }
        
        return null;
        
    }
    
}
