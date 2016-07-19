package servlet;

import dao.UserDAO;
import org.json.JSONObject;
import util.Hash;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ServletLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        try (PrintWriter out = response.getWriter()) {

            Integer enrollment = Integer.parseInt(request.getParameter("enrollment"));
            String password = request.getParameter("password");
            UserDAO userDAO = new UserDAO();

            if (userDAO.authenticate(enrollment, password)) {
                System.out.println("usuário autenticado");
                request.getSession().setAttribute("user", userDAO.getUserByEnrollment(enrollment)); // Put user in session.
                response.sendRedirect("/secretaria/home.jsp"); // Go to some start page.
            } else {
                System.out.println("usuário noob");
                request.setAttribute("error", "Unknown login, try again"); // Set error msg for ${error}
                request.getRequestDispatcher("/sign-in.jsp").forward(request, response); // Go back to login page.
            }

            out.flush();

            /*
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserDAO userDao = new UserDAO();
            JSONObject JSON = new JSONObject();
            Hash hash = new Hash();
            JSON.put("auth", userDao.authenticate(email, hash.getHash(password)));
            out.print(JSON);
            out.flush();
            //*/

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
