package dao;

import entity.Task;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.security.auth.login.Configuration;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.List;
import java.util.Vector;

/**
 * Created by alunoinf on 18/07/2016.
 */
public class TaskDAO {

    private static SessionFactory factory = new Configuration().configure().buildSessionFactory();

    public Integer newTask(BigInteger task_number, String task_type, String title, Timestamp start_date, Timestamp end_date, Float weight, String description, String subject_name, Integer subject_teacher){
        Transaction transact = null;
        Integer taskID = null;
        try (Session session = factory.openSession()) {
            transact = session.beginTransaction();
            Task task = new Task(task_number,task_type,title, start_date, end_date, weight, description, subject_name, subject_teacher);
            taskID = (Integer) session.save(task);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null) {
                transact.rollback();
            }
            e.printStackTrace();
        }
        return taskID;
    }

    public List<Task> listTasks(){

        List<Task> tasks = new Vector<>();
        Transaction transact = null;
        try (Session session = factory.openSession()) {
            transact = session.beginTransaction();
            for (Object aTask : session.createQuery("FROM tasks").list()) { //TODO fix HQL <<
                tasks.add((Task)aTask);
            }
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
        return tasks;
    }

    public void deleteTask(Integer enrollment){

        Transaction transact = null;
        try (Session session = factory.openSession()) {
            transact = session.beginTransaction();
            Task task = session.get(Task.class, enrollment);
            session.delete(task);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
    }

    /*
    public void updateTask(Integer enrollment, Task newTask){

        Transaction transact = null;
        try (Session session = factory.openSession()) {
            transact = session.beginTransaction();
            Task task = session.get(Task.class, enrollment);
            task.setTitle(newTask.getTitle());
            task.setStart_date(newTask.getStart_date());
            task.setEnd_date(newTask.getEnd_date());
            task.setWeight(newTask.getWeight());
            task.setDescription(newTask.getDescription());
            session.update(task);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }

    }*/

}
