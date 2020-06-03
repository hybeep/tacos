package products;

import Modelo.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PorfirioDamián
 */

public class ProductoDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps,ps2;
    ResultSet rs,rs2;
    
    public List listar(){
        
        List<Producto>lista = new ArrayList<>();
        String sql = "select * from dtacos"; 
        String sql2 = "select * from mtacos";
        
        try{
        
        con = cn.getConexion();
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        ps2 = con.prepareStatement(sql2);
        rs2 = ps2.executeQuery();
        
        while(rs.next() && rs2.next()){
        
            Producto p = new Producto();
            p.setId_dprod(rs.getInt(1));
            p.setId_mprod(rs2.getInt(1));
            p.setNom_prod(rs2.getString(2));
            p.setDescripcion_prod(rs.getString("descripcion"));
            p.setPrecio(rs.getFloat("precio_taco"));
            p.setStock(rs.getInt("stock_taco"));
            p.setImg(rs.getBinaryStream("img_taco"));
            lista.add(p);
        }
        
           
        }catch(SQLException e){
        
            System.out.println("Error listar"+e);
        
        }
        return lista;
    
    }
    
    public void listarImg(int id, HttpServletResponse response) throws IOException{
        
        String sql="select * from dtacos where id_taco="+id;
        InputStream inputstream = null;
        OutputStream outputstream = null;
        BufferedInputStream bufferedinputstream = null;
        BufferedOutputStream bufferedoutputstream = null;
        response.setContentType("image/*");
        
        try{
        
            outputstream = response.getOutputStream();
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if(rs.next()){
            
                inputstream = rs.getBinaryStream("img_taco");
            
            }
            
            bufferedinputstream = new BufferedInputStream(inputstream);
            bufferedoutputstream = new BufferedOutputStream(outputstream);
            int i = 0;
            
            while((i = bufferedinputstream.read()) != -1){
            
                bufferedoutputstream.write(i);
            
            }
        
        }catch(SQLException e){
        
            System.out.println("Error listarImg"+e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
    }
    
    public void agregar(Producto p){

        String sql = "insert into mtacos (nom_prod) value (?)";
        String sql2 = "insert into dtacos (img_taco,precio_taco,stock_taco,descripcion) values (?,?,?,?)";

        try{
            Connection con = cn.getConexion();
            
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNom_prod());
            
            ps2 = con.prepareStatement(sql2);
            ps2.setBlob(1, p.getImg());
            ps2.setFloat(2, p.getPrecio());
            ps2.setInt(3, p.getStock());
            ps2.setString(4, p.getDescripcion_prod());
            
            ps.executeUpdate();
            ps2.executeUpdate();
            con.close();
       
        }catch(SQLException ed){
            
            System.out.println("Error agregar");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
       
        }
    
    }
    
}