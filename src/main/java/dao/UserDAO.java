package dao;

import db.HibernateSession;
import entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.Hash;

import java.util.List;
import java.util.Vector;

public class UserDAO {

    private static final SessionFactory sessionFactory = HibernateSession.getSessionFactory();

    public boolean authenticate(Integer enrollment, String hash) {
        return this.getUserByEnrollment(enrollment).getHash().equals(new Hash().getHash(hash));
    }

    public Integer newUser(String user_type, String email, String password, String name, String address, String phone){

        Transaction transact = null;
        Integer userID = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            User user = new User(user_type, email, password, name, address, phone);
            userID = (Integer) session.save(user);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null) {
                transact.rollback();
            }
            e.printStackTrace();
        }
        return userID;

    }

    public User getUserByEnrollment(Integer enrollment) {

        User user = null;
        Transaction transact = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            user = (User) session.createQuery("from User where pk_enrollment = " + enrollment).uniqueResult();
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
        return user;

    }

    public List<User> listUsers(){

        List<User> users = new Vector<>();
        Transaction transact = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            for (Object aUser : session.createQuery("FROM User").list()) {
                users.add((User)aUser);
            }
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
        return users;

    }

    public void updateUser(Integer enrollment, User newUser){

        Transaction transact = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            User user = session.get(User.class, enrollment);
            user.setEmail(newUser.getEmail());
            user.setName(newUser.getName());
            user.setAddress(newUser.getAddress());
            user.setPhone(newUser.getPhone());
            session.update(user);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteUser(Integer enrollment){

        Transaction transact = null;
        try (Session session = sessionFactory.openSession()) {
            transact = session.beginTransaction();
            User user = session.get(User.class, enrollment);
            session.delete(user);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
    }

}
