package servlet;

import com.google.common.collect.Lists;
import dao.UserDAO;
import entity.User;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


public class ServletListUsers extends HttpServlet{
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            UserDAO classDao = new UserDAO();
            int numPagina = Integer.valueOf(request.getParameter("page"));
            JSONArray array = new JSONArray();
            List<User> allUsers= new ArrayList<>();
            allUsers.addAll(classDao.listUsers());
            List<List<User>> listaDePaginas = Lists.partition(allUsers, 10);
            List<User> pagina = listaDePaginas.get(numPagina-1);

            for (User aUser: pagina){
                JSONObject classJSON = new JSONObject();
                classJSON.put("pk_enrollment", aUser.getPk_enrollment());
                classJSON.put("user_type", aUser.getUser_type());
                classJSON.put("email", aUser.getEmail());
                classJSON.put("hash",  aUser.getHash());
                classJSON.put("name", aUser.getName());
                classJSON.put("adress", aUser.getAddress());
                classJSON.put("phone", aUser.getPhone());
                array.put(classJSON);
            }
            out.print(array);
            out.flush();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
