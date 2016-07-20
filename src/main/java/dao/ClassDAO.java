package dao;

import db.HibernateSession;
import entity.Class;

import javax.jms.Session;
import javax.transaction.*;
import java.io.Serializable;
import java.util.List;
import java.util.Vector;

/**
 * Created by Rafa on 20/07/2016.
 */
public class ClassDAO {

    private static final SessionFactory sessionFactory = HibernateSession.getSessionFactory();

    public Integer newClass (String class_name, Integer total_students, Integer total_subjects, Boolean is_active){
        Transaction transact = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            Class class = new Class(class_name, total_students, total_subjects, is_active);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null) {
                transact.rollback();
            }
            e.printStackTrace();
        }

    }

    public List<Class> allTeacherClasses(String enrollment) throws HeuristicRollbackException, RollbackException, HeuristicMixedException, SystemException {

        List<Class> allClasses = new Vector<>();
        Transaction transact = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            for (Object aClass : session.createQuery("FROM classes_subjects").list()) {//TODO fix HQL. Trazer todos os documentos da tabela classes_subjets
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
        } catch (ConstraintViolationException | HibernateException e){
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }

    }

}
