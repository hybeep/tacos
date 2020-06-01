package products;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PorfirioDamián
 */
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
        
        String action = (String) request.getAttribute("action");
        switch (action) {
        
            case "Ver Productos":
                
                List<Producto>lista = dao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("mainadmins.jsp").forward(request, response);
                
            break;
            
            default:
                
                request.getRequestDispatcher("mainadmins.jsp").forward(request, response);
                
            break;
        
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}