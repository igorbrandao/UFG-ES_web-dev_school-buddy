package servlet;

import dao.ClassDAO;
import entity.Class;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class ServletAllClasses extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            ClassDAO classDao = new ClassDAO();
            String idProfessor = request.getParameter("pk_enrollment");
            JSONArray array = new JSONArray();
            ArrayList<Class> allClasses= new ArrayList<>();
            allClasses.addAll(classDao.allTeacherClasses(idProfessor));

            for (Class aClass: allClasses){
                JSONObject classJSON = new JSONObject();
                //classJSON.put("pk_class_name", aClass.getPk_class_name());
                //classJSON.put("total_students", aClass.getTotal_students());
                //classJSON.put("total_subjects",  aClass.getTotal_subjects());
                //classJSON.put("is_active", aClass.is_active());
                array.put(classJSON);
            }
            out.print(array);
            out.flush();
        } catch (HeuristicMixedException | SystemException | RollbackException | HeuristicRollbackException e) {
            e.printStackTrace();
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
