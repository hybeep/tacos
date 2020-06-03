package products;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author PorfirioDamián
 */
@MultipartConfig
public class Controler extends HttpServlet {
    
      ProductoDAO dao = new ProductoDAO();
        Producto p = new Producto();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controler</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controler at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
        
        String accion = (String) request.getParameter("action");
        System.out.println("accion"+accion);
        switch (accion) {
        
            case "Ver Productos":
                
                List<Producto>lista = dao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("mainadmins.jsp").forward(request, response);
                
            break;
            
            case "Agregar Productos":
                
                request.getRequestDispatcher("insertarproducto.jsp").forward(request, response);
                
            break;
            
            case "Guardar":
                
                String nom = request.getParameter("txtNombre");
                float pre = Float.parseFloat(request.getParameter("dfPrecio"));
                int sto = Integer.parseInt(request.getParameter("dfStock"));
                String desc = request.getParameter("txtDesc");
                Part part= request.getPart("fileImg");
                InputStream inputstream = part.getInputStream(); 
                p.setNom_prod(nom);
                p.setPrecio(pre);
                p.setStock(sto);
                p.setDescripcion_prod(desc);
                p.setImg(inputstream);
                dao.agregar(p);
                request.getRequestDispatcher("mainadmins.jsp").forward(request, response);
                
            break;
            
            default:
                
                request.getRequestDispatcher("mainadmins.jsp").forward(request, response);
                
            break;
        
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}