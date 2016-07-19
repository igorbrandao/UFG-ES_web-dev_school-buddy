package dao;

import db.HibernateSession;
import entity.Task;
import entity.TaskEvaluations;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TaskEvaluationsDAO {

    private static final SessionFactory sessionFactory = HibernateSession.getSessionFactory();

        public Float getBoletim(Integer aluno) {
            try (Session session = sessionFactory.openSession()) {
                TaskEvaluations taskEvaluations = (TaskEvaluations) session.createQuery("FROM TaskEvaluations TE WHERE TE.student = " + aluno);
                Task task = (Task) session.createQuery("FROM Task T WHERE T.task_number =  " + taskEvaluations.getFk_task_number());
                Float weight = task.getWeight();
            }
            catch ()
        }

    }
