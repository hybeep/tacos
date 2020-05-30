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

    public static int GuardarDireccion(Direccion ex, User e){
        int status = 0;
        try{
            Connection con = UserActions.getConnection();
            Statement st = con.createStatement(),st2 = con.createStatement();
            ResultSet rs, rs2;
            int id_usuario = 0,id_direccion;
                        
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
            ps.setString(7, e.getEmail_mu());
            
            status = ps.executeUpdate();


            String sql2 ="select id_mu from musuario where email_mu like '"+e.getEmail_mu()+"'";
            rs = st.executeQuery(sql2);
            id_usuario = rs.getInt("id_mu");
            
            String sql3 ="select id_mu from MDireccionEntrega where colonia like '"+ex.getColonia()+"'";
            rs = st.executeQuery(sql3);
            id_direccion = rs.getInt("id_mde");
            
            String sql4 = "insert into edireccioncliente (id_mde,id_mu) values ("+id_direccion+","+id_usuario+")";
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
