package user;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.Arrays;

public class UserActions {
    
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
    
    public static int Loguear(User e){
        int status = 0;
        try{
            Connection con = UserActions.getConnection();

            String q = "select * from musuario "
                    + "where email_mu = ? and pass_mu = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getEmail_mu());
            ps.setString(2, e.getPass_mu());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = 1;
            }
            
            con.close();
       
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        System.out.println(status);
        return status;
    }
    
    public static int Registrar(User e){
        
        int status = 0;
        
        try{
            
            Connection con = UserActions.getConnection();
            String q = "insert into musuario (nivel_mu ,nom_mu, appat_mu, apmat_mu, birth_mu, tel_mu, cel_mu, email_mu, pass_mu, tacoins_mu)"
                    + " values (2,?, ?, ?, ?, ?, ?, ?, ?,2000)";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getNom_mu());
            ps.setString(2, e.getAppat_mu());
            ps.setString(3, e.getApmat_mu());
            ps.setDate(4, e.getBirth_mu());
            ps.setString(5, e.getTel_mu());
            ps.setString(6, e.getCel_mu());
            ps.setString(7, e.getEmail_mu());
            ps.setString(8, e.getPass_mu());
            
            status = ps.executeUpdate();
            con.close();
            
            
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        return status;
    }
    
    public static int EliminarCuenta(String email){
        int status = 0;
        try{
            Connection con = UserActions.getConnection();
            String q ="delete from musuario where email_mu ='"+email+"'";
            PreparedStatement ps = con.prepareStatement(q);
            status = ps.executeUpdate();
            con.close();
        
        }catch (SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return status;
    }
    
    public static int ActualizarNombre(User e){
        int status = 0;
        try{
            Connection con = UserActions.getConnection();
            String sql= "update musuario set nom_mu = ? "
                    + "where email_mu = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNom_mu());
            ps.setString(2, e.getEmail_mu());
            
            status = ps.executeUpdate();
            con.close();
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        return status;
    }
    
    public static int ActualizarPassword(User e){
        int status = 0;
        try{
            Connection con = UserActions.getConnection();
            String sql= "update musuario set pass_mu = ? "
                    + "where email_mu = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getPass_mu());
            ps.setString(2, e.getEmail_mu());
            
            status = ps.executeUpdate();
            con.close();
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        System.out.println("status en actualizar password" + status);
        return status;
    }
    
    public static int getIdByEmail(String email){
        int id = 0;
        try{
            Connection con = UserActions.getConnection();
            String sql= "select * from musuario where email_mu='"+email+"'";
            
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                id = rs.getInt(1);
             }
            
            rs.close();
            st.close();
            con.close();
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return id;
    }
    
    public static int getNivelByEmail(String email){
        int id = 0;
        try{
            Connection con = UserActions.getConnection();
            String sql= "select * from musuario where email_mu='"+email+"'";
            
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                id = rs.getInt(2);
             }
            
            rs.close();
            st.close();
            con.close();
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return id;
    }
}