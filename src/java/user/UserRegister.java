package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserRegister extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         try (PrintWriter out = response.getWriter()) {
        String nombre, paterno, materno, cumpleanos, telefono, celular, correo, contrasena;
            nombre = request.getParameter("nombre");
            paterno = request.getParameter("paterno");
            materno = request.getParameter("materno");
            contrasena = request.getParameter("contrasena");
            correo = request.getParameter("correo");
            cumpleanos = request.getParameter("cumpleanos");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // your template here 
            java.util.Date dateStr = formatter.parse(cumpleanos); 
            java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());
            telefono = request.getParameter("telefono");
            celular = request.getParameter("celular");
            
             System.out.println(nombre+ paterno+ materno+ cumpleanos+ telefono+ celular+ correo+ contrasena);
            
            User e = new User();
            e.setNom_mu(nombre);
            e.setPass_mu(contrasena);
            e.setEmail_mu(correo);
            e.setAppat_mu(paterno);
            e.setApmat_mu(materno);
            e.setBirth_mu(dateDB);
            e.setTel_mu(telefono);
            e.setCel_mu(celular);
            int estado = UserActions.Registrar(e);
            
            if(estado > 0){
                int id = UserActions.getIdByEmail(correo);
                HttpSession session=request.getSession();  
                session.setAttribute("id",id);
                session.setAttribute("email",correo);
                response.sendRedirect("main.jsp");
            }else{
                System.out.println("Error al registrar");
            }
        } catch (ParseException ex) {
            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}