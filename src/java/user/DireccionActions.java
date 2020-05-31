/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author tutus
 */
public class DireccionActions {

    public static int GuardarDireccion(Direccion ex, int id_usu){
        int status = 0;
        try{
            Connection con = UserActions.getConnection();
            Statement st = con.createStatement(),st2 = con.createStatement();
            ResultSet rs, rs2;
                        
            String sql= "insert into MDireccionEntrega set ciudad = ?, "
                    + "colonia = ?, "
                    + "calle = ?, "
                    + "cp = ?, "
                    + "no_int = ?, "
                    + "no_ext = ? ";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ex.getCiudad());
            ps.setString(2, ex.getColonia());
            ps.setString(3, ex.getCalle());
            ps.setInt(4, ex.getCp());
            ps.setInt(5, ex.getNo_int());
            ps.setInt(6, ex.getNo_ext());

            
            status = ps.executeUpdate();

            
            
            String sql3 ="select id_mde from MDireccionEntrega where colonia = '"+ex.getColonia()
                    +"' and ciudad = '"+ex.getCiudad()
                    +"' amd cp = ("+ex.getCp()
                    +") and calle ='"+ex.getCalle()
                    +"' and no_int =("+ex.getNo_int()
                    +") and no_ext = ("+ex.getNo_ext()+")";
            rs = st.executeQuery(sql3);
            int id_direccion = rs.getInt("id_mde");
            
            String sql4 = "insert into edireccioncliente (id_mde,id_mu) values ("+id_direccion+","+id_usu+")";
            st.executeQuery(sql4);

            con.close();
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return status;
    }
    
    public static int LeerDireccion(User e){
        int status = 0;
        try{
            Connection con = UserActions.getConnection();
            String sql= "delete from MDireccionEntrega"
                    + "where email_mu = ? and";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNom_mu());
            ps.setString(2, e.getPass_mu());
            ps.setString(3, e.getEmail_mu());
            
            status = ps.executeUpdate();
            con.close();
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return status;
    }
   
    public static int EliminarDireccion(User e){
        int status = 0;
        try{
            Connection con = UserActions.getConnection();
            String sql= "delete from MDireccionEntrega"
                    + "where email_mu = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNom_mu());
            ps.setString(2, e.getPass_mu());
            ps.setString(3, e.getEmail_mu());
            
            status = ps.executeUpdate();
            con.close();
        }catch(SQLException ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return status;
    }
}
