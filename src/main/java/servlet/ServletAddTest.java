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
@WebServlet("/AddTest")
public class ServletAddTest extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Recolher parâmetros:
        String titulo = request.getParameter("titulo");
        String dataTeste = request.getParameter("dataTeste");
        String peso = request.getParameter("peso");
        String descricao = request.getParameter("descricao");

        //Preencher objeto e persistir:
        //Test avaliacao = new Test();


        //Resposta: (Acessar detailedClass)
        request.getRequestDispatcher("detailedClass.jsp").forward(request,response);

    }
}

