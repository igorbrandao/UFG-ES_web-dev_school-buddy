package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Rafa on 17/07/2016.
 */
@WebServlet("/AddTask")
public class ServletAddTask extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Recolher parâmetros:
        String titulo = request.getParameter("titulo");
        String dataInicio = request.getParameter("dataInicio");
        String dataFim = request.getParameter("dataFim");
        String peso = request.getParameter("peso");
        String descricao = request.getParameter("descricao");

        //Preencher objeto e persistir:
        //Activity atividade = new Activity();


        //Resposta: (Acessar detailedClass)
        request.getRequestDispatcher("detailedClass.jsp").forward(request,response);

    }

}
