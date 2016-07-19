package dao;

import entity.Task;
import entity.TaskEvaluations;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Created by alunoinf on 18/07/2016.
 */
public class TaskEvaluationsDAO {


    private static SessionFactory factory = new Configuration().configure().buildSessionFactory();

        public Float getBoletim(Integer aluno) {
            try (Session session = factory.openSession()) {
                TaskEvaluations taskEvaluations = (TaskEvaluations) session.createQuery("FROM TaskEvaluations TE WHERE TE.student = " + aluno);
                Task task = (Task) session.createQuery("FROM Task T WHERE T.task_number =  " + taskEvaluations.getFk_task_number());
                Float weight = task.getWeight();
            }
            catch ()
        }

    }
