package servlet;

import dao.TaskEvaluationsDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by alunoinf on 18/07/2016.
 */
public class ServeletGetReportCard extends HttpServlet{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        try (PrintWriter out = response.getWriter()) {

            TaskEvaluationsDAO taskEvaluations = new TaskEvaluationsDAO();
            TaskDA


        }

}
