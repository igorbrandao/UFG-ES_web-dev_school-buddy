package dao;

import db.HibernateSession;
import entity.Class;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import java.io.Serializable;
import java.util.List;
import java.util.Vector;


public class ClassDAO {

    private static final SessionFactory sessionFactory = HibernateSession.getSessionFactory();

    public Integer newClass (String class_name, Integer total_students, Integer total_subjects, Boolean is_active, List students){
        Transaction transact = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            Class newClass = new Class (class_name, total_students, total_subjects, is_active, students);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null) {
                transact.rollback();
            }
            e.printStackTrace();
        }

        return null;
    }

    public List<Class> allTeacherClasses(String enrollment) throws HeuristicRollbackException, RollbackException, HeuristicMixedException, SystemException {

        List<Class> allClasses = new Vector<>();
        Transaction transact = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            for (Object aClass : session.createQuery("FROM ClassSubjects where cpk_teacher_enrollment = " + enrollment).list()) {//TODO fix HQL. Trazer todos os documentos da tabela classes_subjets
                // cuja matrícula do professor é igual a enrollment, mesclando com os dados do total de alunos, proveniente da tabela classes<<
                allClasses.add((Class) aClass);
            }
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
        return allClasses;
    }

    public boolean deleteClass(String id) throws HeuristicRollbackException, RollbackException, HeuristicMixedException, SystemException {
        Transaction transact = null;
        Serializable idSerializable = id;

        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            Object persistentInstance = session.load(Class.class, idSerializable);
            if (persistentInstance != null) {
                session.delete(persistentInstance);
            }
            transact.commit();

        } catch (ConstraintViolationException e){
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        } catch (HibernateException e){
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }

        return false;
    }

}
