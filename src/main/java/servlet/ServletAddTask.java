package servlet;

import dao.TaskDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Rafa on 17/07/2016.
 */
@WebServlet("/AddTask")
public class ServletAddTask extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        try(PrintWriter out = response.getWriter()){
            //Recolher parâmetros:
            String titulo = request.getParameter("titulo");
            String dataInicio = request.getParameter("dataInicio");
            String dataFim = request.getParameter("dataFim");
            String peso = request.getParameter("peso");
            String descricao = request.getParameter("descricao");

            //Preencher objeto e persistir:
            TaskDAO taskDao = new TaskDAO();



            //Resposta: (Acessar detailedClass)


        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo(){return "Short description";}
}
