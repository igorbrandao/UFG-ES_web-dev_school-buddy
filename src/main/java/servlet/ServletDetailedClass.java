package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Rafa on 17/07/2016.
 */
public class ServletDetailedClass extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Recolher dados da turma no banco:


        //Preencher página com itens recolhidos:


        //Resposta: (Acessar detailedClass)
        request.getRequestDispatcher("detailedClass.jsp").forward(request,response);

    }

}
