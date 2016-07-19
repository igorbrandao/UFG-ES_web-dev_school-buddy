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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Rafa on 17/07/2016.
 */
@WebServlet("/AddTask")
public class ServletAddTask extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        try(PrintWriter out = response.getWriter()){
            //Recolher parâmetros:
            String tipo = request.getParameter("tipo");
            String titulo = request.getParameter("titulo");
            String dataInicio = request.getParameter("dataInicio");
            String dataFim = request.getParameter("dataFim");
            String peso = request.getParameter("peso");
            String descricao = request.getParameter("descricao");
            String idDisciplina = request.getParameter("idDisciplina");
            String idProfessor = request.getParameter("idProfessor");

            java.sql.Timestamp dataInicioTimestamp = toTimestamp(dataInicio);
            java.sql.Timestamp dataFimTimestamp = toTimestamp(dataFim);



            //Preencher objeto e persistir:
            TaskDAO taskDao = new TaskDAO();
            taskDao.newTask(tipo, titulo, dataInicioTimestamp, dataFimTimestamp, Float.valueOf(peso), descricao, idDisciplina, Integer.valueOf(idProfessor));


            //Resposta: (Acessar detailedClass)


        }



    }

    private java.sql.Timestamp toTimestamp(String data){
        try {
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
            Date date = df.parse(data);
            return new Timestamp(date.getTime());

        } catch (ParseException e) {
            System.out.println("Exception :" + e);
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