package servlet;

import dao.TaskDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Rafa on 17/07/2016.
 */
@WebServlet("/AddTask")
public class ServletAddTask extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            //Recolher parâmetros:
            String tipo = request.getParameter("tipo");
            String titulo = request.getParameter("titulo");
            String dataInicio = request.getParameter("dataInicio");
            String dataFim = request.getParameter("dataFim");
            String peso = request.getParameter("peso");
            String descricao = request.getParameter("descricao");
            String idDisciplina = request.getParameter("idDisciplina");
            String idProfessor = request.getParameter("idProfessor");

            Timestamp dataInicioTimestamp = toTimestamp(dataInicio);
            Timestamp dataFimTimestamp = toTimestamp(dataFim);


            //Preencher objeto e persistir:
            TaskDAO taskDao = new TaskDAO();
            taskDao.newTask(tipo, titulo, dataInicioTimestamp, dataFimTimestamp, peso, descricao, idDisciplina, idProfessor);


            //Resposta: (Acessar detailedClass)


        }

    }

    private Timestamp toTimestamp(String data){
        try{
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
            Date parsedDate = dateFormat.parse(data);
            Timestamp timestamp = new Timestamp(parsedDate.getTime());
            return  timestamp;
        }catch(Exception e){
            return null;
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